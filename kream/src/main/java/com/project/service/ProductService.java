package com.project.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.model.BuyingDTO;
import com.project.model.ProductDAO;
import com.project.model.ProductDTO;
import com.project.model.SellingDTO;

@Service
public class ProductService {

	@Autowired private ProductDAO dao;
	
	public ProductDTO getProductInfo(int idx) {
		ProductDTO product = dao.getProduct(idx);
		product.setImgList(dao.getImg(idx));
		return product;
	}

	public List<BuyingDTO> getBuyingList(int idx) {
		List<BuyingDTO> buyingList = dao.getBuyingListOrigin(idx);
		return buyingList;
	}

	public List<SellingDTO> getSellingList(int idx) {
		List<SellingDTO> sellingList = dao.getSellingListOrigin(idx);
		return sellingList;
	}

	public List<ProductDTO> getMoreProduct(ProductDTO dto) {
		List<ProductDTO> productList = dao.getMoreProduct(dto);
		for(ProductDTO moreDTO : productList) {
			moreDTO.setImgList(dao.getImg(moreDTO.getIdx()));
		}
		productList = getMoreProductPrice(productList);
		return productList;
	}

	public List<ProductDTO> getMoreProductPrice(List<ProductDTO> moreProduct) {
		for(ProductDTO dto : moreProduct) {
			Integer price = dao.buyLowPrice(dto.getIdx());
			String strPrice =  nullCheck(price);
			dto.setPrice(strPrice);
		}
		return moreProduct;
	}

	public LinkedHashMap<String, String> BuySizePriceList(ProductDTO dto) {
		LinkedHashMap<String, String> sizeList = new LinkedHashMap<String, String>();
		sizeList.put("모든 사이즈", "");
		switch (dto.getCategory()) {
		case "스니커즈" :
			for(int i=220;i<=300;i+=10) {
				sizeList.put(Integer.toString(i), "");
			}
			break;
		case "아우터" : case "상의": case "하의": case "의류/기타":
			sizeList.put("XXS", "");
			sizeList.put("XS", "");
			sizeList.put("S", "");
			sizeList.put("M", "");
			sizeList.put("L", "");
			sizeList.put("XL", "");
			sizeList.put("XL", "");
			sizeList.put("XXXL", "");
			break;
		case "모자" : case "가방" : case "지갑 및 카드홀더" : case "패션잡화/기타":
		case "그래픽카드" : case "게임기" : case "테크/기타" : case "라이프" :
			sizeList.put("ONE SIZE", "");
			break;
		default:
			break;
		}
		
		for(String key : sizeList.keySet()) {
			Integer price;
			if(key.equals("모든 사이즈")) { price = dao.buyLowPrice(dto.getIdx()); }
			else { price = dao.buyLowSizePrice(dto.getIdx(), key); }
			String value = (price == null ? "구매 입찰" : Integer.toString(price));
			sizeList.put(key, value);
		}
		
		return sizeList;
	}
	
	public LinkedHashMap<String, String> SellSizePriceList(ProductDTO dto) {
		LinkedHashMap<String, String> sizeList = new LinkedHashMap<String, String>();
		sizeList.put("모든 사이즈", "");
		switch (dto.getCategory()) {
		case "스니커즈" :
			for(int i=220;i<=300;i+=10) {
				sizeList.put(Integer.toString(i), "");
			}
			break;
		case "아우터" : case "상의": case "하의": case "의류/기타":
			sizeList.put("XXS", "");
			sizeList.put("XS", "");
			sizeList.put("S", "");
			sizeList.put("M", "");
			sizeList.put("L", "");
			sizeList.put("XL", "");
			sizeList.put("XL", "");
			sizeList.put("XXXL", "");
			break;
		case "모자" : case "가방" : case "지갑 및 카드홀더" : case "패션잡화/기타":
		case "그래픽카드" : case "게임기" : case "테크/기타" : case "라이프" :
			sizeList.put("ONE SIZE", "");
			break;
		default:
			break;
		}
		
		for(String key : sizeList.keySet()) {
			Integer price = dao.sellHighSizePrice(dto.getIdx(), key);
			if(key.equals("모든 사이즈")) { price = dao.sellHighPrice(dto.getIdx()); }
			else { price = dao.sellHighSizePrice(dto.getIdx(), key); }
			String value = (price == null ? "판매 입찰" : Integer.toString(price));
			sizeList.put(key, value);
		}
		
		return sizeListSort(sizeList);
	}
	
	public LinkedHashMap<String,String> sizeListSort(HashMap<String,String> sizeList) {
		LinkedHashMap<String,String> resultList = new LinkedHashMap<String, String>();
		List<String>keys = new ArrayList<String>(sizeList.keySet());
		Collections.sort(keys);
		for(String key : keys) {
			resultList.put(key, sizeList.get(key));
		}
		return resultList;
	}

	public String getBuyPrice(int idx) {
		Integer price = dao.buyLowPrice(idx);
		return nullCheck(price);
	}

	public String getSellPrice(int idx) {
		Integer price = dao.sellHighPrice(idx);
		return nullCheck(price);
	}

	public ArrayList<String> sizeAllPrice(int idx) {
		ArrayList<String> priceList = new ArrayList<String>();
		
		priceList.add(nullCheck(dao.latelyPrice(idx)));
		priceList.add(nullCheck(dao.buyLowPrice(idx)));
		priceList.add(nullCheck(dao.sellHighPrice(idx)));
		
		return priceList;
	}
	
	public ArrayList<String> sizeSelectPrice(int idx, String size) {
		ArrayList<String> priceList = new ArrayList<String>();
		
		priceList.add(nullCheck(dao.sizelatelyPrice(idx,size)));
		priceList.add(nullCheck(dao.buyLowSizePrice(idx,size)));
		priceList.add(nullCheck(dao.sellHighSizePrice(idx,size)));
		
		return priceList;
	}
	
	public String nullCheck(Integer price) {
		String result;
		if(price == null) {
			result = "-";
		} else {
			result = String.valueOf(price);
		}
		return result;
	}

	public ArrayList<String> getSizeWishList(int productIdx, int memberIdx) {
		return dao.getSizeWishList(productIdx,memberIdx);
	}

	public ArrayList<String> categorySize(String category) {
		ArrayList<String> sizeList = new ArrayList<String>();
		switch (category) {
		case "스니커즈" :
			for(int i=220;i<=300;i+=10) {
				sizeList.add(Integer.toString(i));
			}
			break;
		case "아우터" : case "상의": case "하의": case "의류/기타":
			sizeList.add("XXS");
			sizeList.add("XS");
			sizeList.add("S");
			sizeList.add("M");
			sizeList.add("L");
			sizeList.add("XL");
			sizeList.add("XL");
			sizeList.add("XXXL");
			break;
		case "모자" : case "가방" : case "지갑 및 카드홀더" : case "패션잡화/기타":
		case "그래픽카드" : case "게임기" : case "테크/기타" : case "라이프" :
			sizeList.add("ONE SIZE");
			break;
		default:
			break;
		}
		return sizeList;
	}

	public void deleteProductWish(int productIdx, int memberIdx, String size) {
		dao.deleteProductWish(productIdx,memberIdx,size);
	}

	public void insertProductWish(int productIdx, int memberIdx, String size) {
		dao.insertProductWish(productIdx,memberIdx,size);
	}
	
	
}