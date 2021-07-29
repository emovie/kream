package com.project.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.model.ProductDTO;
import com.project.service.BuySellService;
import com.project.service.ProductService;

@Controller
public class SellController {
	
	@Autowired private ProductService ps;
	@Autowired private BuySellService bss;

	@GetMapping("/sell/{productIdx}")
	public ModelAndView sell(@PathVariable("productIdx")int productIdx,@RequestParam("size") String size) {
		ModelAndView mav = new ModelAndView("/products/sell");
		
		mav.addObject("size", size);

		ProductDTO product = ps.getProductInfo(productIdx);
		mav.addObject("product", product);
		
		HashMap<String, String> priceList = new HashMap<String, String>();
		String buyPrice = ps.getBuyPrice(productIdx);
		buyPrice = (buyPrice == null ? "-" : buyPrice);
		String sellPrice = ps.getSellPrice(productIdx);
		sellPrice = (sellPrice == null ? "-" : sellPrice);
		priceList.put("즉시 구매가", buyPrice);
		priceList.put("즉시 판매가", sellPrice);
		mav.addObject("sellPrice", sellPrice);
		mav.addObject("priceList", priceList);
		
		String deadlineTxt = bss.getDeadlineTxt("30일");
		mav.addObject("deadlineTxt", deadlineTxt);
		
		return mav;
	}
	
	@GetMapping("/deadline/{day}")
	@ResponseBody
	public String deadlineText(@PathVariable("day") String day) {
		return bss.getDeadlineTxt(day);
	}
	
}
