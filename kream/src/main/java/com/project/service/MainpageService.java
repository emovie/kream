package com.project.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.model.ProductDAO;
import com.project.model.ProductDTO;
import com.project.model.ProductImgDTO;

@Service
public class MainpageService {

	@Autowired private ProductDAO dao;

	public List<ProductDTO> getImgList(List<ProductDTO> list) {
		
		List<ProductDTO> newList = new ArrayList<ProductDTO>();
		
		for(ProductDTO dto : list) {
			int idx = dto.getIdx();
			List<ProductImgDTO> imgList = dao.getImg(idx);
			if(imgList.size() > 0) {
				dto.setImgList(imgList);
				newList.add(dto);
			}
			else {
				newList.add(dto);
			}
		}
		return newList;
	}
	
	public List<ProductDTO> getList() {
		return getImgList(dao.getList());
	}
	
	public List<ProductDTO> search(String keyword) {
		return getImgList(dao.search(keyword));
	}

	public List<ProductDTO> justDropped() {
		return getImgList(dao.justDropped());
	}

	public List<ProductDTO> mostPopular() {
		return dao.mostPopular();
	}

}