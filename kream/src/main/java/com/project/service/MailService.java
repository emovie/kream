package com.project.service;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Properties;
import java.util.Random;
import java.util.Scanner;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.service.Hash;
import com.project.model.UserDAO;

@Service
public class MailService {

	@Autowired private UserDAO userdao;

	public int checkEmail(String email, String phoneNumber) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("phoneNumber", phoneNumber);
		return userdao.checkEmail(map);
	}

	public int changePw(String email, String phoneNumber, HttpSession session) throws IOException {
		
		String tempPw = getTempPw();
		String hashNumber = Hash.getHash(tempPw);
		
		String account = null;
		String filePath = session.getServletContext().getRealPath("/WEB-INF/config/mailAccount.dat");
		File f = new File(filePath);
		if(f.exists() == false) {
			System.out.println("메일 전송에 필요한 계정 정보를 찾을 수 없습니다.");
			return 0;
		}
		Scanner sc = new Scanner(f);
		while(sc.hasNextLine()) {
			account = sc.nextLine();
		}
		sc.close();
		
		
		String result = sendMail(email, tempPw, account, 0);

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("phoneNumber", phoneNumber);
		map.put("pw", hashNumber);
		if(result.equals(tempPw)) {
			return userdao.changeTempPw(map);
		}
		else {
			System.out.println("발송 실패");
			System.out.println(result);
			return 0;					
		}
		
	}
	
	public String modifyEmail(String email, HttpSession session) throws IOException {
		
		String authNum = getAuthNumber();
		String hashNumber = Hash.getHash(authNum);
		
		session.setAttribute("hashNumber", hashNumber);
		
		String account = null;
		String filePath = session.getServletContext().getRealPath("/WEB-INF/config/mailAccount.dat");
		File f = new File(filePath);
		if(f.exists() == false) {
			return "메일 전송에 필요한 계정 정보를 찾을 수 없습니다.";
		}
		Scanner sc = new Scanner(f);
		while(sc.hasNextLine()) {
			account = sc.nextLine();
		}
		sc.close();
		
		String result = sendMail(email, authNum, account, 1);

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("pw", hashNumber);
		if(result.equals(authNum)) {
			return hashNumber;
		}
		else {
			System.out.println("발송 실패");
			System.out.println(result);
			return result;
		}
		
	}

	private String getTempPw() {
		Random ran = new Random();
		String tempPw = "";
		
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
									'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
									'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
									'!', '@', '#', '$', '^', '&' };
		
		for(int i = 0; i < 6; i++) {
			tempPw += charSet[ran.nextInt(charSet.length)];
		}
		
		tempPw += charSet[ran.nextInt(6) + 61];
		tempPw += charSet[ran.nextInt(26) + 36];
		tempPw += charSet[ran.nextInt(26) + 10];
		tempPw += charSet[ran.nextInt(9)];
		
		return tempPw;
	}
	
	private String getAuthNumber() {
		Random ran = new Random();
		String authNumber = "";
		
		for(int i = 0; i < 6; i++) {
			authNumber += ran.nextInt(9);
		}
		
		return authNumber;
	}
	
	public String sendMail(String mailAddress, String tempPw, String account, int checkModify) {
		// 메일을 발송하는 데에 사용하는 코드
		String host = "smtp.naver.com";
		int port = 465;
		
		final String username = account.split("/")[0];
		final String password = account.split("/")[1];
		
		String subject = "";
		String body = "";
		if(checkModify == 0) {
			subject = "[KREAM] 임시 비밀번호입니다.";
			body = String.format("임시 비밀번호는 [%s] 입니다.", tempPw);			
		}
		else {
			subject = "[KREAM] 인증번호입니다.";
			body = String.format("인증번호는 [%s] 입니다.", tempPw);			
		}
		
		// 메일을 발송하는 서버에 대한 인증과 속성을 설정하기
		Properties props = System.getProperties();
		
		// 속성 설정
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.trust", host);
		
		Session mailSession = Session.getDefaultInstance(props, new Authenticator() {
			String un = username;
			String pw = password;
			
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(un, pw);
			}
		});
		
		// 보내는 메일 내용 구성하기
		Message mimeMessage = new MimeMessage(mailSession);
		
		try {
			// 보내는 사람 주소
			mimeMessage.setFrom(new InternetAddress(username + "@naver.com"));
			// 받는 사람 주소
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(mailAddress));
		
			mimeMessage.setSubject(subject);
			mimeMessage.setText(body);
			
			Transport.send(mimeMessage);
			
		} catch(MessagingException e) {
			return "주소가 잘못되었습니다";
		}
		return tempPw;
	}

}
