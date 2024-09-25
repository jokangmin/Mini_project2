<%@page import="java.util.Properties"%>
<%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.*"%>
<%@page import="mail.SMTPAuthenticator"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String from = request.getParameter("from");
String to = request.getParameter("to");
String code = request.getParameter("code"); // 인증번호 받기

String subject = "인증번호";

Properties props = new Properties();
props.put("mail.smtp.host", "smtp.naver.com");
props.put("mail.smtp.port", "465");
props.put("mail.smtp.starttls.enable", "true");
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.socketFactory.port", "465");
props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

try {
    Authenticator auth = new SMTPAuthenticator();
    Session emailSession = Session.getInstance(props, auth);
    emailSession.setDebug(true);

    MimeMessage msg = new MimeMessage(emailSession);
    msg.setFrom(new InternetAddress(from));
    msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
    msg.setSubject(subject);

    StringBuilder buffer = new StringBuilder();
    buffer.append("<html><body>")
          .append("<h3>메일 내용</h3>")
          .append("<p> 인증번호는 ").append(code).append(" 입니다</p>") 
          .append("</body></html>");

    msg.setContent(buffer.toString(), "text/html;charset=UTF-8");
    Transport.send(msg);

    out.println("<p>메일이 성공적으로 전송되었습니다.</p>");
} catch (Exception e) {
    e.printStackTrace();
    out.println("<p>메일 전송 중 오류가 발생했습니다: " + e.getMessage() + "</p>");
}
%>