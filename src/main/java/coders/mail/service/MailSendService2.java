package coders.mail.service;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.annotation.Resource;
import javax.mail.MessagingException;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import coders.common.util.MailUtils;

@Service("mss2")
public class MailSendService2 {
	private int size;
	@Resource(name = "mailSender")
    private JavaMailSenderImpl mailSender;
	//수정 트리는 쉬운가?
	
	//인증키 생성
    private String getKey(int size) {
        this.size = size;
        return getAuthCode();
    }

    //인증코드 난수 발생
    private String getAuthCode() {
        Random random = new Random();
        StringBuffer buffer = new StringBuffer();
        int num = 0;

        while(buffer.length() < size) {
            num = random.nextInt(10);
            buffer.append(num);
        }

        return buffer.toString();
    }

    //인증메일 보내기
    public String sendAuthMail(String email) {
        //6자리 난수 인증번호 생성
    	String authKey = getKey(6);
        //인증메일 보내기
        try {
            MailUtils sendMail = new MailUtils(mailSender);
            sendMail.setSubject("회원가입 이메일 인증");
            sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
            .append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
            .append("<a href='http://localhost:9011/net/main/findPassword.do?EMAIL=")
            .append(email)
            .append("&authKey=")
            .append(authKey)
            .append("' target='_black'>이메일 인증 확인</a>")
            .toString());
            sendMail.setFrom("coders1154@gmail.com", "관리자");
            sendMail.setTo(email);
            sendMail.send();
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return authKey;
    }
}
