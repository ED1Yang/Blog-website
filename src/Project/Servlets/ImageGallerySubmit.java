package Project.Servlets;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class ImageGallerySubmit extends HttpServlet {

    private File uploadsFolder;
    private File tempFolder;

    @Override
    public void init() throws ServletException {
        super.init();

        // Get upload folder, ensure it exists.
        this.uploadsFolder = new File(getServletContext().getRealPath("/Uploaded-Photos"));
        if (!uploadsFolder.exists()) {
            uploadsFolder.mkdirs();
        }

        // Ditto with the temp folder that the file-upload mechanism needs.
        this.tempFolder = new File(getServletContext().getRealPath("/WEB-INF/temp"));
        if (!tempFolder.exists()) {
            tempFolder.mkdirs();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        PrintWriter out = resp.getWriter();
        out.println("<!DOCTYPE html><html>\n<head><title>My Photos</title>");

        // Bootstrap / jQuery links
        out.println("<script src=\"https://code.jquery.com/jquery-3.2.0.js\" integrity=\"sha256-wPFJNIFlVY49B+CuAIrDr932XSb6Jk3J1M22M3E2ylQ=\" crossorigin=\"anonymous\"></script>");
        out.println("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\" integrity=\"sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u\" crossorigin=\"anonymous\">");
        out.println("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css\" integrity=\"sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp\" crossorigin=\"anonymous\">");
        out.println("<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\" integrity=\"sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa\" crossorigin=\"anonymous\"></script>");
        out.println("<style>.container { margin-top: 50px; }</style>");
        out.println("</head>");
        out.println("<body><div class=\"container\">");

        out.println("<form action=\"./ImageGallerySubmit\" method=\"POST\" enctype = \"multipart/form-data\">");

        out.println("<div class=\"form-group\">\n" +
                "<label for=\"file\">File:</label>\n" +
                "<input class=\"form-control\" type=\"file\" id=\"file\" name=\"file\" required>\n" +
                "</div>");

        out.println("<div class=\"form-group\">\n" +
                "<label for=\"caption\">Caption:</label>\n" +
                "<input class=\"form-control\" type=\"text\" id=\"caption\" name=\"caption\"\n" +
                "placeholder=\"Enter a caption for the photo.\" required>\n" +
                "</div>");

        out.println("<div class=\"form-group\">\n" +
                "<input class=\"btn btn-primary\" type=\"submit\">\n" +
                "</div>");

        out.println("</form>");
        out.println("</div></body></html>");
    }

    /**
     * When this servlet receives a POST request, it will attempt to handle that request as a file upload. If the upload is successful,
     * and the upload is an image, a thumbnail of that image will be created, and a page showing the uploaded thumbnail and caption will
     * be shown to the user. If the user clicks the thumbnail, the full-size image will be thrown.
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // If this POST request isn't from a multipart form, send a 404 error.
        boolean isMultipart = ServletFileUpload.isMultipartContent(req);
        if (!isMultipart) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        // Create the downloader, and let it use our "temp" folder.
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(4 * 1024);
        factory.setRepository(tempFolder);

        ServletFileUpload upload = new ServletFileUpload(factory);
        // TODO Max file size

        // Make an uploads folder specifically for this user (session).
        File myUploadsFolder = new File(uploadsFolder, "gsik152");
        if (!myUploadsFolder.exists()) {
            myUploadsFolder.mkdirs();
        }

        try {

            List<FileItem> fileItems = upload.parseRequest(req);

            String caption = null;
            File fullsizeImageFile = null;

            // Extract / download file and caption
            for (FileItem fi : fileItems) {

                // The file
                if (!fi.isFormField()) {
                    String fileName = fi.getName();
                    fullsizeImageFile = new File(myUploadsFolder, fileName);
                    fi.write(fullsizeImageFile);
                }

                // Caption
                else if (fi.getFieldName().equals("caption")) {
                    caption = fi.getString();
                }

            }

            // If we found everything then we're sweet!
            if (caption != null && fullsizeImageFile != null) {

                File thumbnailFile = generateThumbnail(myUploadsFolder, fullsizeImageFile);
                writeUploadPage(resp.getWriter(), caption, fullsizeImageFile, thumbnailFile, req.getSession().getId());

            }

            // Otherwise we're not. Send a 404.
            else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }

        }

        // This will produce a default error page when any Exception happens.
        catch (Exception e) {
            throw new ServletException(e);
        }

    }

    /**
     * Writes an HTML page to the response. The page will contain the given thumbnail and caption. The thumbnail will be
     * a hyperlink to the given fullsize image.
     *
     * @param out
     * @param caption
     * @param fullsizeImageFile
     * @param thumbnailFile
     */
    private void writeUploadPage(PrintWriter out, String caption, File fullsizeImageFile, File thumbnailFile, String sessionId) {

        out.println("<script src=\"https://code.jquery.com/jquery-3.2.0.js\" integrity=\"sha256-wPFJNIFlVY49B+CuAIrDr932XSb6Jk3J1M22M3E2ylQ=\" crossorigin=\"anonymous\"></script>");
        out.println("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\" integrity=\"sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u\" crossorigin=\"anonymous\">");
        out.println("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css\" integrity=\"sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp\" crossorigin=\"anonymous\">");
        out.println("<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\" integrity=\"sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa\" crossorigin=\"anonymous\"></script>");
        out.println("<style>.container { margin-top: 50px; }</style>");
        out.println("</head>");
        out.println("<body><div class=\"container\">");

        out.println("<div class=\"panel panel-primary\">" +
                "<div class=\"panel-heading\"><h3 class=\"panel-title\">My Upload</h3></div>" +
                "<div class=\"panel-body\">");

        out.println("<p>" + caption + "</p>");

        String relativeFullsizeImagePath = "../Uploaded-Photos/" + sessionId + "/" + fullsizeImageFile.getName();
        String relativeThumbnailImagePath = "../Uploaded-Photos/" + sessionId + "/" + thumbnailFile.getName();
        out.println("<p><a href=\"" + relativeFullsizeImagePath + "\"><img src=\"" + relativeThumbnailImagePath + "\"/></a></p>");

        out.println("</form>");
        out.println("</div></body></html>");

    }


    /**
     * Create a thumbnail. Probably a long and outdated way of doing it.
     *
     * @param folder
     * @param originalImageFile
     * @return
     * @throws IOException
     */
    private File generateThumbnail(File folder, File originalImageFile) throws IOException {

        final int MAX_W = 400, MAX_H = 400;

        Image thumbnail = null;
        BufferedImage original = null;

        // read original image
        original = ImageIO.read(originalImageFile);

        // get its dimensions
        int w = original.getWidth(null);
        int h = original.getHeight(null);

        // check if we can leave the original dimensions intact
        if (w <= MAX_W & h <= MAX_H) {

            // no resizing
            thumbnail = original;

        } else {

            // one or both dimensions exceed the max allowed size
            float thumbWidth, thumbHeight;
            float scaleFactor = 1.0f;

            // Figure out the scaleFactor - the number by which we should multiply the thumbmail's width and height.
            if (w > h) {
                thumbWidth = MAX_W;
                scaleFactor = thumbWidth / (float) w;
                thumbHeight = (float) h * scaleFactor;
            } else {
                thumbHeight = MAX_H;
                scaleFactor = thumbHeight / (float) h;
                thumbWidth = (float) w * scaleFactor;
            }

            // Actually create the scaled image
            thumbnail = original.getScaledInstance(Math.round(thumbWidth), Math.round(thumbHeight), Image.SCALE_SMOOTH);

        }

        // Write out the thumbnail
        BufferedImage buffer = new BufferedImage(thumbnail.getWidth(null), thumbnail.getHeight(null), original.getType());
        buffer.createGraphics().drawImage(thumbnail, 0, 0, null);
        File thumbnailFile = new File(folder, "thumbnail.png");
        ImageIO.write(buffer, "png", thumbnailFile);
        return thumbnailFile;
    }
}
