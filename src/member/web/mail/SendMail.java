package member.web.mail;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.Random;
public class SendMail {
    public SendMail(){}
    
//    final String username="구글아이디";
//    final String password="비밀번호!";
    
    public int sendmail(String email){
   
    	int result = (int)Math.floor(Math.random() * 1000000)+100000;
    	if(result>1000000){
    	   result = result - 100000;
    	}

    	int code = result;
    	
        Properties props = new Properties(); 
        props.put("mail.smtp.user","chlguddn1107@gmail.com"); 
        props.put("mail.smtp.password", "hyunju!1107");
        props.put("mail.smtp.host", "smtp.gmail.com"); 
        props.put("mail.smtp.port", "25"); 
        props.put("mail.debug", "true"); 
        props.put("mail.smtp.auth", "true"); 
        props.put("mail.smtp.starttls.enable","true"); 
        props.put("mail.smtp.EnableSSL.enable","true");
        props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");   
        props.setProperty("mail.smtp.socketFactory.fallback", "false");   
        props.setProperty("mail.smtp.port", "465");   
        props.setProperty("mail.smtp.socketFactory.port", "465"); 
    
        Session session = Session.getInstance(props, 
         new javax.mail.Authenticator() { 
        protected PasswordAuthentication getPasswordAuthentication() { 
        return new PasswordAuthentication("chlguddn1107@gmail.com", "hyunju!1107"); 
        }});
        System.out.println("??");
        try{
            Message message = new MimeMessage(session); 
            message.setFrom(new InternetAddress("chlguddn1107@gmail.com"));// 
            message.setRecipients(Message.RecipientType.TO,
            
 InternetAddress.parse(email)); 
            
            message.setSubject("Testing Subject");
            
            message.setText(code + "," 
            + "\n\n 인증번호를 입력하세요");//내용 
 //message.setContent("내용","text/html; charset=utf-8");//글내용을 html타입 charset설정
            System.out.println("send!!!");
            Transport.send(message); 
            System.out.println("SEND");
            
        } catch(Exception e){
            e.printStackTrace();
        }
        
        
        
        
        return code;
    }  
    
}
