package com.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.project.model.ProductDTO;
import com.project.service.MainpageService;

@RestController
public class AjaxController {

	@Autowired private MainpageService ms;
	
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
	


}
