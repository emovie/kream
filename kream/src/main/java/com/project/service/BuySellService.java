package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.model.AddressDTO;
import com.project.model.BuySellDAO;
import com.project.model.BuyingDTO;
import com.project.model.MemberDTO;
import com.project.model.SellingDTO;

@Service
public class BuySellService {
	
	@Autowired ProductProcess process = new ProductProcess();
	@Autowired BuySellDAO bsdao;

	public String getDeadlineTxt(String day) {
		String deadline = "";
		String date = "";
		switch (day) {
		case "1일":
			date = process.addDate(0, 0, 1);
			break;
		case "3일":
			date = process.addDate(0, 0, 3);
			break;
		case "7일":
			date = process.addDate(0, 0, 7);
			break;
		case "30일":
			date = process.addDate(0, 0, 30);
			break;
		case "60일":
			date = process.addDate(0, 0, 60);
			break;
		default:
			break;
		}
		deadline = String.format("%s (%s 마감)", day, date);
		return deadline;
	}

	public AddressDTO getAddress(int addressIdx) {
		return bsdao.getAddress(addressIdx);
	}

	public MemberDTO getMember(int loginIdx) {
		return bsdao.getMember(loginIdx);
	}

	public int insertSelling(SellingDTO sell) {
		if(sell.getCountDate().length() != 0) {
			String cntDate = sell.getCountDate();
			int length = cntDate.length();
			cntDate = cntDate.substring(length-14, length-3);
			sell.setCountDate(cntDate);
			sell.setEndDate(null);
		} else {
			sell.setEndDate(process.nowToday());
			sell.setCountDate(null);
		}
		
		int ck = bsdao.insertSelling(sell);
		return ck;
	}

	public int insertBuying(BuyingDTO buy) {
		if(buy.getCountDate().length() != 0) {
			String cntDate = buy.getCountDate();
			int length = cntDate.length();
			cntDate = cntDate.substring(length-14, length-3);
			buy.setCountDate(cntDate);
			buy.setEndDate(null);
		} else {
			buy.setEndDate(process.nowToday());
			buy.setCountDate(null);
		}
		
		int ck = bsdao.insertBuying(buy);
		return ck;
	}
	


	
	
}
