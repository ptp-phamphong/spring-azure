package com.aptech.MyClass;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class SendingEmail {
	public SendingEmail() {
		
	}
	
	//Hàm này để gửi mail, mình sẽ truyền thông tin vào
    public boolean sendEmail(String subject, String content, String recipient){
        
        String emailFrom = "tpthanhphong111@gmail.com";
        //Host, cái dell gì ấy nhỉ
        String host = "smtp.gmail.com";

        //Lấy thuộc tính hệ thống, đcm cái gì đây
        Properties properties = System.getProperties();

        //Thiết lập server của email
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "465");
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.auth", "true");

        // Get the default Session object. Để xác thực email thì phải
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("tpthanhphong111@gmail.com", "quvhlbhvtubzhirk");
            }
        });

        // Used to debug SMTP issues
        session.setDebug(true);
        
        try {
            //Khởi tạo tin nhắn
            MimeMessage messege = new MimeMessage(session);

            //Cài đặt người gửi
            messege.setFrom(new InternetAddress(emailFrom));

            //Cài đặt người nhận
            messege.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));

            //Tiêu đề của mail
            messege.setSubject(subject);

            //Nội dung mail
            messege.setText(content);

            //Lệnh gửi
            Transport.send(messege);

            System.out.println("ok thành công");
            
            return true;

        } catch (MessagingException mex) {
        	System.out.println(mex.getMessage());
            System.out.println("aaaaa");
            mex.printStackTrace();
        }
        
        return false;
    }

}
