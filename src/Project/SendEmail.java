package Project;

import com.sun.mail.util.MailSSLSocketFactory;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.security.GeneralSecurityException;
import java.util.Properties;

public class SendEmail {
    public void sendEmail(String userEmail,String username,String link) throws GeneralSecurityException{

        // email send to
        String to = userEmail;

        // email send from
        String from = "apollo.teamgrea@gmail.com";

        // host: smtp.gmail.com
        String host = "smtp.gmail.com";

        // system properties
        Properties properties = System.getProperties();

        // email server
        properties.setProperty("mail.smtp.host", host);

        properties.put("mail.smtp.auth", "true");
        MailSSLSocketFactory sf = new MailSSLSocketFactory();
        sf.setTrustAllHosts(true);
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.ssl.socketFactory", sf);
        properties.put("mail.smtp.port", 465);
        // default session object
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
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            // Set Subject: head
            message.setSubject("Password Reset: Apollo.com");


            StringBuilder bodyText = new StringBuilder();
            bodyText.append("<div>").append("Hi ").append(username).append(",<br/><br/>")
                    .append("You recently requested to reset your password for your Apollo account.<br/>")
                    .append("Please click <a href=\"").append(link).append("\">here</a> or copy the link below to the browser to reset it.<br/>")
                    .append("<a href=\"").append(link).append("\">").append(link).append("</a><br><br>")
                    .append("Please notice that this password reset is only valid for the next 24 hours.")
                    .append("<br/><br/>")
                    .append("Thanks,<br/>")
                    .append("Apollo Team")
                    .append("</div>");

            // message
//            message.setText("Hi");
            message.setContent(bodyText.toString(), "text/html; charset=utf-8");

            // send info
            Transport.send(message);
            System.out.println("Sent message successfully....to "+userEmail);
        }catch (Exception e) {
            e.printStackTrace();
        }


    }

}