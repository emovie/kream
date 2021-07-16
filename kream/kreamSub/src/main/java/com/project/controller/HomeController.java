package com.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	@GetMapping("/products")
	public String products() {
		return "/products/products";
	}
	
	@GetMapping("/policy/privacy")
	public void privacy() {}

	@GetMapping("/policy/agreement")
	public void agreement() {}
	
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
