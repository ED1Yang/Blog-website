package Project.Servlets;

import Project.UserDAO.User;
import Project.UserDAO.UserDAO;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;
@SuppressWarnings("Duplicates")

public class RegistrationServlet extends HttpServlet{
    private File uploadsFolder;
    private File tempFolder;

    @Override
    public void init() throws ServletException {
        super.init();

        // Get upload folder, ensure it exists.
        this.uploadsFolder = new File(getServletContext().getRealPath("/Avatars"));
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

        try (UserDAO userDAO = new UserDAO()){

            List<FileItem> fileItems = upload.parseRequest(req);

            File fullsizeImageFile = null;
            File thumbnail = null;
            String username = null;
            User user = new User();

            // Extract / download file and caption
            for (FileItem fi : fileItems) {

                // The file
                if (!fi.isFormField()) {
                    String fileName = fi.getName();
                    fullsizeImageFile = new File(uploadsFolder, fileName);
                    try {
                        fi.write(fullsizeImageFile);
                        thumbnail = generateThumbnail(uploadsFolder, fullsizeImageFile, fileName);
                        fi.write(generateThumbnail(tempFolder, fullsizeImageFile, fileName));
                        try {
                            fi.write(thumbnail);
                            System.out.println("Thumbnail written");
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        String newFileName = username+".png";
                        System.out.println("Filename set");
                        new File(uploadsFolder+"/"+fileName).renameTo(new File(uploadsFolder+"/"+newFileName));
                        System.out.println("Filename changed");
                        user.setImage(newFileName);
                    } catch (FileNotFoundException e) {
                        e.printStackTrace();
                        System.out.println("Not uploading photo");
                    }
                }

                // Caption
                else if (fi.getFieldName().equals("fname")) {
                    System.out.println(fi.getString());
                    user.setFirstName(fi.getString());
                }

                else if (fi.getFieldName().equals("lname")) {
                    System.out.println(fi.getString());
                    user.setLastName(fi.getString());
                }

                else if (fi.getFieldName().equals("uname")) {
                    username = fi.getString();
                    if(new UserDAO().userNameValidation(username)) {
                        user.setUerName(fi.getString());
                        System.out.println(fi.getString());
                    }
                    else{
                        req.setAttribute("UsernameTaken", true);
                        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/RegistrationForm.jsp");
                        dispatcher.forward(req, resp);
                        return;
                    }
                }

                else if (fi.getFieldName().equals("dob")) {
                    user.setDateOfBirth(fi.getString());
                    System.out.println(fi.getString());
                }

                else if (fi.getFieldName().equals("country")) {
                    user.setCountry(fi.getString());
                    System.out.println(fi.getString());
                }

                else if (fi.getFieldName().equals("pwd")) {
                    user.setPassword(fi.getString());
                    System.out.println(fi.getString());
                }

                else if (fi.getFieldName().equals("avatar")) {
                    if(fi.getString() != null) {
                        user.setImage(fi.getString());
                        System.out.println(fi.getString());
                    }
                }

            }
            userDAO.addUser(user);
        }


        // This will produce a default error page when any Exception happens.
        catch (Exception e) {
            e.printStackTrace();
        }

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Login_page.jsp");
        dispatcher.forward(req, resp);

    }

    private File generateThumbnail(File folder, File originalImageFile, String filename) throws IOException {

        final int MAX_W = 100, MAX_H = 100;

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
            // Actually create the scaled image
            thumbnail = original.getScaledInstance(Math.round(MAX_W), Math.round(MAX_H), Image.SCALE_SMOOTH);
            System.out.println("I happened");
        }

        // Write out the thumbnail
        BufferedImage buffer = new BufferedImage(thumbnail.getWidth(null), thumbnail.getHeight(null), original.getType());
        buffer.createGraphics().drawImage(thumbnail, 0, 0, null);
        File thumbnailFile = new File(folder, filename);
        ImageIO.write(buffer, "png", thumbnailFile);
        return thumbnailFile;
    }
}
