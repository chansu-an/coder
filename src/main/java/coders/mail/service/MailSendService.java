package coders.mail.service;

import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.mail.MessagingException;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import coders.common.common.MailUtils;

@Service("mss")
public class MailSendService {
	@Resource(name = "mailSender")
    private JavaMailSenderImpl mailSender;
	//수정 트리는 쉬운가?

    //인증메일 보내기
    public String sendAuthMail(String email) {
        //6자리 난수 인증번호 생성

        //인증메일 보내기
        try {
            MailUtils sendMail = new MailUtils(mailSender);
            sendMail.setSubject("회원가입 이메일 인증");
            sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
            .append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
           .toString());
            sendMail.setFrom("garde1540@naver.com", "관리자");
            sendMail.setTo(email);
            sendMail.send();
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
return "ss";
    }
}