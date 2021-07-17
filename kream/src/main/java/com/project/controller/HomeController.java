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
	
	@GetMapping("/products")
	public String products() {
		return "/products/products";
	}
	
	// 현재 상품 페이지가 미완이기 때문에 상품 idx를 파라미터로 받아오기만 함
	// 차후에 인덱스에 맞는 상품을 호출할 수 있도록 수정해야 함
	@GetMapping("/products/{prodIdx}")
	public ModelAndView product(@PathVariable int prodIdx) {
		ModelAndView mav = new ModelAndView("/products/products");
		return mav;
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
