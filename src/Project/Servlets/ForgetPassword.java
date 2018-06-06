package Project.Servlets;

import Project.SendEmail;
import Project.UserDAO.User;
import Project.UserDAO.UserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.UUID;

public class ForgetPassword extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        try (UserDAO userDAO = new UserDAO()) {
            User olduser = userDAO.getUserInfo(username);
            User user = userDAO.getUserInfo(username);


            //check whether the password-reset is triggered by the user.
            if (req.getParameter("isFromUser").equals("true")) {

                //username check.
                if (user == null) {
                    req.setAttribute("wrongUsername", true);
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ForgetPassword.jsp");
                    dispatcher.forward(req, resp);
                    return;
                } else {
                    String rightEmail = user.getEmail();
                    //email address check.
                    if (!email.equals(rightEmail)) {
                        req.setAttribute("wrongEmail", true);
                        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ForgetPassword.jsp");
                        dispatcher.forward(req, resp);
                        return;
                    } else {
                        String link = generateLink(userDAO, user, olduser, req);

                        SendEmail sendEmail = new SendEmail();
                        sendEmail.sendEmail(email, username, link);
                        req.setAttribute("username", username);
                        req.setAttribute("email", email);
                        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Email_Sent.jsp");
                        dispatcher.forward(req, resp);
                    }
                }
            } else {
                /*password is reset by admin.
                  send email directly to the user.
                 */
                SendEmail sendEmail = new SendEmail();
                String link = generateLink(userDAO, user, olduser, req);
                sendEmail.sendEmail(email, username, link);
                req.setAttribute("passwordReset", true);
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/UserAdmin");
                dispatcher.forward(req, resp);

            }
        } catch (GeneralSecurityException | SQLException e) {
            e.printStackTrace();
        }

    }


    //generate a secret link consists of digital signature and username.
    private String generateLink(UserDAO userDAO, User user, User olduser, HttpServletRequest request) throws SQLException {
        String secretKey = UUID.randomUUID().toString();

        //expire after 24 hours
        Timestamp ExpireTime = new Timestamp(System.currentTimeMillis() + 24 * 60 * 60 * 1000);
        long date = ExpireTime.getTime() / 1000 * 1000;//
        user.setValidateCode(secretKey);
        user.setExpireTime(date);


        userDAO.updateUser(user, olduser);
        String key = user.getUserName() + "$" + date + "$" + secretKey;

        //generate a digital signature by username, date and a random secret key.
        String digitalSignature = crypt(key);


        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
        String resetPassHref = basePath + "passwordValidation?sid=" + digitalSignature + "&userName=" + user.getUserName();
        return resetPassHref;
    }


    //encrypt a string.
    public static String crypt(String str) {
        if (str == null || str.length() == 0) {
            throw new IllegalArgumentException("String to encrypt cannot be null or zero length");
        }
        StringBuffer hexString = new StringBuffer();
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(str.getBytes());
            byte[] hash = md.digest();
            for (int i = 0; i < hash.length; i++) {
                if ((0xff & hash[i]) < 0x10) {
                    hexString.append("0" + Integer.toHexString((0xFF & hash[i])));
                } else {
                    hexString.append(Integer.toHexString(0xFF & hash[i]));
                }
            }
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return hexString.toString();
    }
}
