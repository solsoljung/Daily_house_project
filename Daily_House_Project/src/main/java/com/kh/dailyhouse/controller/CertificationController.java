package com.kh.dailyhouse.controller;

import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kh.dailyhouse.domain.CertificationDto;

@RestController
@RequestMapping("/certification")
public class CertificationController {

	@Inject
	private JavaMailSender mailSender;

	//메일코드 전송
	@RequestMapping(value = "/registerCertification", method = RequestMethod.POST)
	public int mailSending(@RequestBody String user_email) throws Exception {
		Random r = new Random();
		int dice = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드(난수생성)
		System.out.println("user_email: " + user_email);

		String setFrom = "neoselenium@gmail.com";
		String toMail = user_email; 
		
		//메일 전송시에 이렇게 하지말고 @@메일 전송하는 Dto를 하나 만들면 좋겠음@@
		String title = "회원가입 인증 이메일 입니다."; //제목
		String content = System.getProperty("line.separator") + //한줄씩 줄간격을 두기위해 작성
				System.getProperty("line.separator") + "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
				+ System.getProperty("line.separator") + System.getProperty("line.separator") 
				+ " 인증번호는 " + dice + " 입니다. " 
				+ System.getProperty("line.separator") + System.getProperty("line.separator")
				+ "받으신 인증번호를 입력하세요."; //내용

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setFrom); //보내는 사람 생략시 정상작동 불가
			messageHelper.setTo(toMail); 	//받는사람 이메일
			messageHelper.setSubject(title);//메일 제목은 생략가능
			messageHelper.setText(content); //메일 내용
			
			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

		return dice;
	}
	
	
	//인증 일치, 불일치 여부
	@RequestMapping(value = "/registerCertification2", method = {RequestMethod.GET, RequestMethod.POST})
	public String mailCertification(@RequestBody CertificationDto certificationDto) throws Exception{
		System.out.println("user_input: " + certificationDto.getUser_input());
		System.out.println("dice: " + certificationDto.getDice());
		String user_input = certificationDto.getUser_input();
		String dice = certificationDto.getDice();
		
		if(!dice.equals(user_input)) {
			return "fail";
		}
		
		return "success";
	}

}
