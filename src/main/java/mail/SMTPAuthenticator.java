package mail;

import javax.mail.Authenticator;  // javax.mail.Authenticator 임포트
import javax.mail.PasswordAuthentication;  // javax.mail.PasswordAuthentication 임포트

public class SMTPAuthenticator extends Authenticator {
    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication("lunasc@naver.com", "25PZ97HBW8CM"); // 사용자 이름과 비밀번호
    }
}