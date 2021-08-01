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
import com.project.model.BuyingDTO;
import com.project.model.MemberDTO;
import com.project.model.ProductDTO;
import com.project.service.BuySellService;
import com.project.service.ProductProcess;
import com.project.service.ProductService;
import com.project.service.UserService;

@Controller
public class BuyController{
	
	@Autowired private ProductService ps;
	@Autowired private BuySellService bss;
	@Autowired private UserService us;
	@Autowired private ProductProcess process;

	@GetMapping("/buy/{productIdx}")
	public ModelAndView buy(@PathVariable("productIdx")int productIdx,@RequestParam("size") String size,HttpSession session) {
		ModelAndView mav;
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		System.out.println(login.getIdx());
		
		if(login == null) {
			mav = new ModelAndView("home");
			return mav;
		}
		mav = new ModelAndView("/products/buy");
		
		mav.addObject("size", size);

		ProductDTO product = ps.getProductInfo(productIdx);
		mav.addObject("product", product);
		
		HashMap<String, String> priceList = new HashMap<String, String>();
		String buyPrice = ps.getBuySizePrice(productIdx,size);
		String sellPrice = ps.getSellSizePrice(productIdx,size);
		priceList.put("즉시 구매가", sellPrice);
		priceList.put("즉시 판매가", buyPrice);
		mav.addObject("buyPrice", sellPrice);
		mav.addObject("priceList", priceList);
		
		String deadlineTxt = bss.getDeadlineTxt("30일");
		System.out.println(deadlineTxt);
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
	
	@GetMapping(value="/deadlineBuy/{day}", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String deadlineText(@PathVariable("day") String day) {
		return bss.getDeadlineTxt(day);
	}
	
	@GetMapping("/buy/confirm/{productIdx}")
	public ModelAndView confirm(@PathVariable int productIdx,@RequestParam("tabSelect")String tabSelect,@RequestParam("size") String size,@RequestParam("addressIdx") int addressIdx,@RequestParam("total") int totalPrice,@RequestParam("deadline")String deadlineTxt,HttpSession session) {
		ModelAndView mav = new ModelAndView("/products/buyConfirm");
		BuyingDTO buying = new BuyingDTO();
		
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		if(login == null) {
			mav = new ModelAndView("home");
			return mav;
		}
		mav = new ModelAndView("/products/buyConfirm");
		
		buying.setStartDate(process.nowToday());
		buying.setMemberIdx(login.getIdx());
		buying.setProductIdx(productIdx);
		buying.setpSize(size);
		buying.setAddressIdx(addressIdx);
		buying.setPrice(totalPrice);
		
		if(tabSelect.equals("구매 입찰")) {
			buying.setCountDate(deadlineTxt);
			buying.setStep("입찰");
		} else {
			buying.setStep("진행");
		}
		mav.addObject("buying", buying);
		
		MemberDTO member = bss.getMember(login.getIdx());
		mav.addObject("member", member);
		
		ProductDTO product = ps.getProductInfo(productIdx);
		mav.addObject("product", product);
		
		String buyPrice = ps.getBuySizePrice(productIdx,size);
		mav.addObject("buyPrice", buyPrice);
		
		AddressDTO address = bss.getAddress(addressIdx);
		mav.addObject("address", address);
		
		
		
		return mav;
	}

	@PostMapping("/products/buyThx")
	public String thanks(BuyingDTO buy) {
		
		int ck = bss.insertBuying(buy);
//		if(ck == 0) {
//			return "/products/fail";
//		}
//		return "/products/thx";
		
		return "home";
		
	}
	
}
