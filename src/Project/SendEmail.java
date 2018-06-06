package Project;

import com.sun.mail.util.MailSSLSocketFactory;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.security.GeneralSecurityException;
import java.util.Properties;

public class SendEmail {
    public void sendEmail(String userEmail,String username,String link) throws GeneralSecurityException{

        // email send from
        String from = "apollo.teamgrea@gmail.com";

        // host:
        String host = "smtp.gmail.com";

        // system properties
        Properties properties = System.getProperties();

        // email server
        properties.setProperty("mail.smtp.host", host);

        //set ssl validation to true, and set the port.
        properties.put("mail.smtp.auth", "true");
        MailSSLSocketFactory sf = new MailSSLSocketFactory();
        sf.setTrustAllHosts(true);
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.ssl.socketFactory", sf);
        properties.put("mail.smtp.port", 465);
        /* default session object
           we are using validation password here, for security reason.
         */
        Session session = Session.getDefaultInstance(properties,new Authenticator(){
            public PasswordAuthentication getPasswordAuthentication()
            {
                return new PasswordAuthentication("apollo.teamgrea@gmail.com", "zyenshlojevtbnba");
            }
        });

        session.setDebug(true);


        try{
            // default MimeMessage object
            MimeMessage message = new MimeMessage(session);

            // Set From: head
            message.setFrom(new InternetAddress(from));

            // Set To: head
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(userEmail));

            // Set Subject
            message.setSubject("Password Reset: Apollo.com");

            // message
            String bodyText = "<div>" +
                    "Hi " + username + ",<br/><br/>" +
                    "You recently requested to reset your password for your Apollo account.<br/>" +
                    "Please click <a href=\"" + link + "\">here</a> or copy the link below to the browser to reset it.<br/>" +
                    "<a href=\"" + link + "\">" + link + "</a><br><br>" +
                    "Please notice that this password reset is only valid for the next 24 hours." +
                    "<br/><br/>" +
                    "Thanks,<br/>" +
                    "Apollo Team" +
                    "</div>";

            message.setContent(bodyText, "text/html; charset=utf-8");

            // send info
            Transport.send(message);
        }catch (Exception e) {
            e.printStackTrace();
        }
    }

}