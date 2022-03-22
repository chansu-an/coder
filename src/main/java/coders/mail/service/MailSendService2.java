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
            sendMail.setSubject("Coders 임시비밀번호 발급안내");
            sendMail.setText(new StringBuffer().append("<h1>[비밀번호 찾기]</h1>")
            .append("<p>아래 비밀번호로 로그인후 비밀번호 변경하시길 권장드립니다.</p>")
            .append("임시 비밀번호 : ")
            .append(authKey)         
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
