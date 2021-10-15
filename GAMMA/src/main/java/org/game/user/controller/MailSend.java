package org.game.user.controller;

import java.io.File;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mail/*")
@AllArgsConstructor
public class MailSend {
	
	/*
	 * @Autowired private JavaMailSender mailSender;
	 * 
	 * @GetMapping("/sendMail") public void sendMailTest()throws Exception{
	 * 
	 * String subject ="test 메일"; String content =" 메일 테스트 내용임"; String from
	 * ="보내는이 아이디@도메인주소"; String to ="받는이 아이디@도메인주소";
	 * 
	 * try { MimeMessage mail = mailSender.createMimeMessage(); MimeMessageHelper
	 * mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
	 * 
	 * mailHelper.setFrom(from); mailHelper.setTo(to);
	 * mailHelper.setSubject(subject); mailHelper.setText(content,true);
	 * 
	 * FileSystemResource file = new FileSystemResource(new
	 * File("C:\\text\test.txt")); mailHelper.addAttachment("test.txt", file);
	 * 
	 * mailSender.send(mail); }catch(Exception e) { e.printStackTrace(); } }
	 */

}
