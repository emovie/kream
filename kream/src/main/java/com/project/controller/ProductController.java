package com.project.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.model.ProductDTO;
import com.project.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired private ProductService ps;

	@GetMapping("/products/{idx}")
	public ModelAndView products(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/products/products");
		
		ProductDTO product = ps.getProductInfo(idx);
		mav.addObject("product", product);
		
		String sellPrice = ps.getSellPrice(idx);
		mav.addObject("sellPrice", sellPrice);
		
		List<ProductDTO> moreProduct = ps.getMoreProduct(product);
		mav.addObject("moreProduct", moreProduct);
		
		HashMap<String, String> buySizeList = ps.BuySizePriceList(product);
		mav.addObject("buySizeList", buySizeList);
		
		HashMap<String, String> sellSizeList = ps.SellSizePriceList(product);
		mav.addObject("sellSizeList", sellSizeList);
		
		ArrayList<String> categorySize = ps.categorySize(product.getCategory());
		mav.addObject("categorySize", categorySize);
		
		return mav;
	}
	
	@GetMapping("/products/{idx}/{size}")
	@ResponseBody
	public ArrayList<String> sizeSelectPrice(@PathVariable int idx, @PathVariable String size) {
		ArrayList<String> priceList = new ArrayList<String>();
		if(size.equals("all") || size.equals("모든 사이즈")) {
			priceList = ps.sizeAllPrice(idx);
		} else {
			priceList = ps.sizeSelectPrice(idx, size);
		}
		return priceList;
	}
	
	@GetMapping("/sizeWishList/{idx}")
	@ResponseBody
	public ArrayList<String> getSizeWishList(@PathVariable int idx) {
		int memberIdx = 1;
		System.out.println("productIdx : "+idx);
		System.out.println("memberIdx : "+memberIdx);
		return ps.getSizeWishList(idx,memberIdx);
	}
	
	@GetMapping("/sizeWishOff/{productIdx}/{size}")
	@ResponseBody
	public void sizeWishOff(@PathVariable int productIdx,@PathVariable String size) {
		int memberIdx = 1;
		System.out.println("off");
		System.out.println("productIdx : " + productIdx);
		System.out.println("size : "+size);
		ps.deleteProductWish(productIdx,memberIdx,size);
	}
	
	@GetMapping("/sizeWishOn/{productIdx}/{size}")
	@ResponseBody
	public void sizeWishOn(@PathVariable int productIdx,@PathVariable String size) {
		int memberIdx = 1;
		System.out.println("on");
		System.out.println("productIdx : " + productIdx);
		System.out.println("size : "+size);
		ps.insertProductWish(productIdx,memberIdx,size);
	}
	
	
}
