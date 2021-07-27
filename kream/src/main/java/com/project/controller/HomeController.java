package com.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.model.KreamDTO;
import com.project.model.ProductDTO;
import com.project.service.KreamService;
import com.project.service.MainpageService;

@Controller
public class HomeController {
	
	@Autowired private MainpageService ms;
	@Autowired private KreamService ks;
	
	@GetMapping("/")
	public String home() {
		return "home";
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
	
	@GetMapping("/list")
	public void list(Model model) {
		List<KreamDTO> list = ks.selectList();
		model.addAttribute("list", list);
	}
}
