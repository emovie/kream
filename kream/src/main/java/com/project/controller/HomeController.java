package com.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.model.ProductDTO;
import com.project.service.MainpageService;

@Controller
public class HomeController {
	
	@Autowired private MainpageService ms;
	
	@GetMapping("/")
	public String home() {
		return "home";
	}
	
	@GetMapping("/products/{prodIdx}")
	public ModelAndView product(@PathVariable int prodIdx) {
		ModelAndView mav = new ModelAndView("/products/products");
		return mav;
	}
	
	// user 
	@GetMapping("/my")
	public String myPage() {
		return "/user/mypage";
	}
	
	@GetMapping("/my/buying")
	public String myBuying() {
		return "/user/buying";
	}

	@GetMapping("/my/selling")
	public String mySelling() {
		return "/user/selling";
	}
	
	@GetMapping("/my/wish")
	public String myWish() {
		return "/user/wish";
	}
	
	@GetMapping("/my/profile")
	public String myProfile() {
		return "/user/profile";
	}
	
	@GetMapping("/my/address")
	public String myAddress() {
		return "/user/address";
	}
	
	@GetMapping("/my/payment")
	public String myPayment() {
		return "/user/payment";
	}
	
	@GetMapping("/my/account")
	public String myAccount() {
		return "/user/account";
	}
	
	
	@GetMapping("/login")
	public String login() {
		return "/member/login";
	}
	
	@GetMapping("/login/find_password")
	public String findPassword() {
		return "/user/findPassword";
	}
	
	// policy
	@GetMapping("/policy/privacy")
	public void privacy() {}

	@GetMapping("/policy/agreement")
	public void agreement() {}
	
	// shop
	@GetMapping("/search")
	public ModelAndView getList(HttpServletRequest req) {
		String keyword = req.getParameter("keyword");
		ModelAndView mav = new ModelAndView("search");
		if(keyword != null) {
			List<ProductDTO> list = ms.search(keyword);
			mav.addObject("list",list);
			return mav; 
		}
		else {
			List<ProductDTO> list = ms.getList();
			mav.addObject("list",list);
			return mav; 
		}
	}
	
	@PostMapping("/search")
	public ModelAndView search(String keyword) {
		ModelAndView mav = new ModelAndView("search");
		
		List<ProductDTO> list = ms.search(keyword);
		
		mav.addObject("list",list);
		return mav;
	}
	
}
