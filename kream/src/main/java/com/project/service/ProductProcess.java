package com.project.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.stereotype.Service;

@Service
public class ProductProcess {
	
	public String addDate(int year, int month, int day) {
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		Calendar cal = Calendar.getInstance();
		
		cal.add(Calendar.YEAR, year);
		cal.add(Calendar.MONTH, month);
		cal.add(Calendar.DATE, day);
		return sdf.format(cal.getTime());
	}
	
	public String nowToday() {
		String today = "";
		
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		today = sdf.format(date);
		System.out.println(today);
		return today;
	}

}
