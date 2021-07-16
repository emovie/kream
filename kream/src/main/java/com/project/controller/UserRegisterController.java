package com.project.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.model.LoginDTO;
import com.project.model.MemberDTO;
import com.project.service.Hash;
import com.project.service.MemberService;

@Controller
@RequestMapping("/member")
public class UserRegisterController {
	
	private final MemberService ms;
	
	@Inject
	public UserRegisterController(MemberService ms) {
		this.ms = ms;
	}
	
	
	// 회원가입 페이지 
	@RequestMapping(value="/register", method = RequestMethod.GET)
	public String registerGET() throws Exception {
		return "/member/register";
	}
	
	// 회원가입 처리
	@RequestMapping(value="/register", method = RequestMethod.POST)
	public String registerPOST(MemberDTO dto, RedirectAttributes ra) throws Exception {
		
		// mail에서 @ 앞부분 값 추출
		String mail = dto.getEmail();
		int idx = mail.indexOf("@");
		dto.setName(mail.substring(0, idx));
		
		String hashedPw = Hash.getHash(dto.getPw());
		dto.setPw(hashedPw);
		ms.register(dto);
		ra.addFlashAttribute("msg", "REGISTERED");
		
		return "redirect:/member/login";			
	}
	
	@GetMapping("emailCheck")
	@ResponseBody
	public String emailCheck(@RequestParam("userEmail")String email) throws Exception {
		System.out.println(email);
		int result = ms.checkEmail(email);
		return String.valueOf(result);
	}
	
//	@GetMapping("/checkEmail/{email}")
//	@ResponseBody
//	public int checkEmail(@PathVariable String email) throws Exception {
//		return ms.checkEmail(email);
//	}
//	
}
