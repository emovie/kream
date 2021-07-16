package com.project.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.model.LoginDTO;
import com.project.model.MemberDTO;
import com.project.service.Hash;
import com.project.service.MemberService;

@Controller
@RequestMapping("/member")
public class UserLoginController {
	
	private final MemberService ms;
	
	@Inject
	public UserLoginController(MemberService ms) {
		this.ms = ms;
	}
	
	// 로그인 페이지
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String loginGET(@ModelAttribute("dto") LoginDTO dto) {
		return "/member/login";
	}
	
	// 로그인 처리
	@RequestMapping(value="/loginPost", method = RequestMethod.POST)
	public void loginPOST(LoginDTO logindto, HttpSession session, Model model) throws Exception {
		
		MemberDTO dto = ms.login(logindto);

		String hashedPw = Hash.getHash(logindto.getPw());
	
		System.out.println(hashedPw.equals(dto.getPw()));
		
		if (dto == null || !Hash.getHash(logindto.getPw()).equals(dto.getPw()))
			return;
		
		model.addAttribute("member", dto);
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
}
