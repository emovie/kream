package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BuySellService {
	
	@Autowired ProductProcess process = new ProductProcess();

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
		deadline = String.format("%s (20%s 마감)", day, date);
		return deadline;
	}

	
	
}
