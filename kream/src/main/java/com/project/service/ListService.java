package com.project.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.model.ProductDAO;
import com.project.model.ProductDTO;



@Service
public class ListService {
	
	@Autowired private ProductDAO dao;
	
	public List<ProductDTO> selectList() {
		return dao.selectList();
	}
	
	

}
