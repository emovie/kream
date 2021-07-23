package com.project.controller;

import java.io.FileNotFoundException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.model.ProductDTO;
import com.project.service.MailService;
import com.project.service.MainpageService;


@RestController
public class AjaxController {

	@Autowired private MainpageService ms;
	@Autowired private MailService mailservice;
	
	@GetMapping("/search/{keyword}/")
	public List<ProductDTO> search(@PathVariable String keyword) {
		return ms.search(keyword);
	}
	
	@GetMapping("/main/justDropped/")
	public List<ProductDTO> justDropped() {
		return ms.justDropped();
	}
	
	@GetMapping("/main/mostPopular/")
	public List<ProductDTO> mostPopular() {
		return ms.mostPopular();
	}
	
	@PostMapping("/login/find_password/")
	public int checkEmail(String email, String phoneNumber){
		// 일치하는 이메일 정보 찾기
		return mailservice.checkEmail(email, phoneNumber);
	}
	@GetMapping("/login/find_password/accord/{email}/{phoneNumber}")
	public int GetTempPw(@PathVariable String email, @PathVariable String phoneNumber, HttpSession session) throws FileNotFoundException {
		return mailservice.changePw(email, phoneNumber, session);
	}
	
}
