package com.project.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.model.AddressDTO;
import com.project.model.MemberDTO;
import com.project.model.ProductDTO;
import com.project.model.SellingDTO;
import com.project.service.BuySellService;
import com.project.service.ProductProcess;
import com.project.service.ProductService;
import com.project.service.UserService;

@Controller
public class SellController {
	
	@Autowired private ProductService ps;
	@Autowired private BuySellService bss;
	@Autowired private UserService us;
	@Autowired private ProductProcess process;

	@GetMapping("/sell/{productIdx}")
	public ModelAndView sell(@PathVariable("productIdx")int productIdx,@RequestParam("size") String size,HttpSession session) {
		ModelAndView mav;
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		
		if(login == null) {
			mav = new ModelAndView("home");
			return mav;
		}
		mav = new ModelAndView("/products/sell");
		
		mav.addObject("size", size);

		ProductDTO product = ps.getProductInfo(productIdx);
		mav.addObject("product", product);
		
		HashMap<String, String> priceList = new HashMap<String, String>();
		String buyPrice = ps.getBuySizePrice(productIdx,size);
		String sellPrice = ps.getSellSizePrice(productIdx,size);
		priceList.put("즉시 구매가", sellPrice);
		priceList.put("즉시 판매가", buyPrice);
		mav.addObject("sellPrice", buyPrice);
		mav.addObject("priceList", priceList);
		
		String deadlineTxt = bss.getDeadlineTxt("30일");
		mav.addObject("deadlineTxt", deadlineTxt);

		List<AddressDTO>addressList = us.getAddressList(login.getIdx());
		AddressDTO basicAddress = new AddressDTO();
		for(AddressDTO dto : addressList) {
			if(dto.getBasicck().equals("y")) {
				basicAddress = dto;
			}
		}
		mav.addObject("basicAddress", basicAddress);
		mav.addObject("addressList", addressList);
		
		return mav;
	}
	
	@GetMapping(value="/deadlineSell/{day}", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String deadlineText(@PathVariable("day") String day) {
		return bss.getDeadlineTxt(day);
	}
	
	@GetMapping("/sell/confirm/{productIdx}")
	public ModelAndView confirm(@PathVariable int productIdx,@RequestParam("tabSelect")String tabSelect,@RequestParam("size") String size,@RequestParam("addressIdx") int addressIdx,@RequestParam("total") int totalPrice,@RequestParam("deadline")String deadlineTxt,HttpSession session) {
		ModelAndView mav = new ModelAndView("/products/sellConfirm");
		SellingDTO selling = new SellingDTO();
		
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		if(login == null) {
			mav = new ModelAndView("home");
			return mav;
		}
		mav = new ModelAndView("/products/sellConfirm");
		
		selling.setStartDate(process.nowToday());
		selling.setMemberIdx(login.getIdx());
		selling.setProductIdx(productIdx);
		selling.setpSize(size);
		selling.setAddressIdx(addressIdx);
		selling.setPrice(totalPrice);
		
		if(tabSelect.equals("판매 입찰")) {
			selling.setCountDate(deadlineTxt);
			selling.setStep("입찰");
		} else {
			selling.setStep("진행");
		}
		mav.addObject("selling", selling);
		
		MemberDTO member = bss.getMember(login.getIdx());
		mav.addObject("member", member);
		
		ProductDTO product = ps.getProductInfo(productIdx);
		mav.addObject("product", product);
		
		String sellPrice = ps.getSellSizePrice(productIdx,size);
		mav.addObject("sellPrice", sellPrice);
		
		AddressDTO address = bss.getAddress(addressIdx);
		mav.addObject("address", address);
		
		
		
		return mav;
	}

	@PostMapping("/products/sellThx")
	public String thanks(SellingDTO sell) {
		
		int ck = bss.insertSelling(sell);
//		if(ck == 0) {
//			return "/products/fail";
//		}
//		return "/products/thx";
		return "home";
		
	}
	
}
