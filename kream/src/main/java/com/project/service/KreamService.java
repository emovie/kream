package com.project.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.model.KreamDAO;
import com.project.model.KreamDTO;



@Service
public class KreamService {
	
	@Autowired private KreamDAO dao;
	
	public List<KreamDTO> selectList() {
		return dao.selectList();
	}
	
	

}
