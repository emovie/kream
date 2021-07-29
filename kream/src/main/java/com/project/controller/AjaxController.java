package com.project.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.project.service.FileUploadService;
import com.project.service.Hash;
import com.project.model.AccountDTO;
import com.project.model.AddressDTO;
import com.project.model.BuySellDTO;
import com.project.model.MemberDTO;
import com.project.model.ProductDAO;
import com.project.model.ProductDTO;
import com.project.model.ProductWishDTO;
import com.project.service.MailService;
import com.project.service.MainpageService;
import com.project.service.UserService;


@RestController
public class AjaxController {

	@Autowired private MainpageService mainserv;
	@Autowired private MailService mailservice;
	@Autowired private UserService userserv;
	@Autowired private FileUploadService fileserv;
	
	// 검색창 검색리스트
	@GetMapping("/search/{keyword}/")
	public List<ProductDTO> search(@PathVariable String keyword) {
		return mainserv.search(keyword);
	}
	
	// Shop 검색리스트 전체
	@GetMapping("/search/allList/")
	public List<ProductDTO> ShopList() {
		return mainserv.getList();
	}

	// Shop 검색리스트 키워드
	@GetMapping("/search/allList/{searchKeyword}")
	public List<ProductDTO> ShopList(@PathVariable String searchKeyword) {
		return mainserv.search(searchKeyword);
	}
	
	
	// main 노출 아이템
	@GetMapping("/main/justDropped/")
	public List<ProductDTO> justDropped() {
		return mainserv.justDropped();
	}
	
	@GetMapping("/main/mostPopular/")
	public List<ProductDTO> mostPopular() {
		return mainserv.mostPopular();
	}

	// 이메일, 비밀번호 찾기
	@PostMapping("/login/find_password/")
	public int checkEmail(String email, String phoneNumber){
		// 일치하는 이메일 정보 찾기
		return mailservice.checkEmail(email, phoneNumber);
	}
	@GetMapping("/login/find_password/accord/{email}/{phoneNumber}")
	public int GetTempPw(@PathVariable String email, @PathVariable String phoneNumber, HttpSession session) throws IOException {
		return mailservice.changePw(email, phoneNumber, session);
	}
	
	@PostMapping("/login/find_email/")
	public String checkPhoneNum(String phoneNumber) {
		return userserv.checkPhoneNum(phoneNumber);
	}
	
	// 마이페이지 주소등록
	@PostMapping("/my/regiAddress/")
	public int addressBook(AddressDTO dto) {
		System.out.println("address req member IDX: " + dto.getMemberIdx());
		System.out.println("address req checkBox: " + dto.getBasicck());
		return userserv.regiAddress(dto);
	}
	
	// 마이페이지 주소리스트
	@GetMapping("/my/regiAddress/{loginIdx}")
	public List<AddressDTO> getAddressList(@PathVariable int loginIdx) {
		return userserv.getAddressList(loginIdx);
	}
	
	// 마이페이지 기본 배송지 변경
	@GetMapping("/my/regiAddress/changeBasic/{addressIdx}")
	public int changBasicAdd(@PathVariable int addressIdx,HttpSession session) {
		MemberDTO sessionLogin = (MemberDTO)session.getAttribute("login");
		return userserv.changBasicAdd(addressIdx,sessionLogin.getIdx());
	}
	
	// 마이페이지 배송지 삭제
	@GetMapping("/my/regiAddress/deleteAdd/{addressIdx}")
	public int deleteAdd(@PathVariable int addressIdx) {
		return userserv.deleteAdd(addressIdx);
	}
	
	// 마이페이지 배송지 수정
	@PostMapping("/my/regiAddress/modifyAdd/{addressIdx}")
	public int modifyAdd(AddressDTO dto, @PathVariable int addressIdx, HttpSession session) {
		MemberDTO sessionLogin = (MemberDTO)session.getAttribute("login");
		return userserv.modifyAdd(dto, addressIdx, sessionLogin.getIdx());
	}
	
	
	// 마이페이지 관심 상품
	@GetMapping("/my/wish/{loginIdx}/")
	public HashMap<String, Object> getWishList(@PathVariable int loginIdx, Model model) {
		// 로그인한 유저의 관심상품 목록 가져오기
		List<ProductWishDTO> wishList = userserv.getWishList(loginIdx);
		List<ProductDTO> productList = new ArrayList<ProductDTO>();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		// 가져온 관심상품 데이터를 이용해 상품데이터 수집
		for(ProductWishDTO dto : wishList) {
			productList.add(mainserv.getProdDTO(dto.getProductIdx()));
		}
		productList = mainserv.getImgList(productList);
		
		// Map으로 관심상품 목록과 관련한 상품 데이터를 보냄
		map.put("wishList", wishList);
		map.put("productList", productList);
		return map;
	}
	
	// 마이페이지 관심 상품 삭제
	@GetMapping("/wish/delete/{wishIdx}/")
	public int wishItemDelete(@PathVariable int wishIdx) {
		return userserv.wishItemDelete(wishIdx);
	}
	
	@GetMapping("/my/profile/check/{email}/")
	public int checkSocialLog(@PathVariable String email) {
		String checkSocial = userserv.checkSocialLog(email);
		if(checkSocial != null) {
			return 1;
		}
		return 0;
	}
	
	@PostMapping("/my/profile/modifyEmail/checked/{email}/")
	public int checkEmailExist(@PathVariable String email) {
		return userserv.checkEmailExist(email);
	}
	
	@PostMapping("/my/profile/modifyEmail/{email}/")
	public String modifyEmail(@PathVariable String email, HttpSession session) throws IOException {
		return mailservice.modifyEmail(email, session);
	}
	
	// 이메일 변경
	@PostMapping("/getAuthResult/{userNumber}/{newmail}/{oldmail}/")
	public int getAuthResult(@PathVariable String userNumber, @PathVariable String newmail, @PathVariable String oldmail, HttpSession session) {
		MemberDTO sessionLogin = (MemberDTO)session.getAttribute("login");
		if(Hash.getHash(userNumber).equals((String)session.getAttribute("hashNumber"))) {
			if(userserv.modifyEmail(newmail, oldmail) == 1) {
				session.setAttribute("login", userserv.getUser(newmail));
			}
			return 1;
		}
		return 0;
	}
	
	// 비밀번호 변경 - 기존 비밀번호 체크
	@PostMapping("/my/profile/modifyPw/check/{nowpw}/")
	public int compareNowPw(@PathVariable String nowpw, HttpSession session) {
		MemberDTO nowLogin = (MemberDTO)session.getAttribute("login");
		return userserv.compareNowPw(Hash.getHash(nowpw), nowLogin.getEmail());
	}
	
	// 비밀번호 변경 
	@PostMapping("/my/profile/modifyPw/{newpw}/")
	public int changeNewPw(@PathVariable String newpw, HttpSession session) {
		MemberDTO nowLogin = (MemberDTO)session.getAttribute("login");
		if(userserv.changeNewPw(Hash.getHash(newpw), nowLogin.getEmail()) == 1) {
			session.setAttribute("login", userserv.getUser(nowLogin.getEmail()));
			return 1;
		}
		return 0;
	}
	
	// 이름 변경
	@GetMapping("/my/profile/modifyName/{newName}")
	public int changeName(@PathVariable String newName, HttpSession session) {
		MemberDTO nowLogin = (MemberDTO)session.getAttribute("login");
		if(userserv.changeName(newName, nowLogin.getEmail()) == 1) {
			session.setAttribute("login", userserv.getUser(nowLogin.getEmail()));
			return 1;
		}
		return 0;
	}
	
	// 프로필 파일 업로드
	@PostMapping("/my/profile/imgUpload/")
	public int profileImgUpload(MemberDTO dto, HttpSession session) {
		MemberDTO nowLogin = (MemberDTO)session.getAttribute("login");
		int nowLoginIdx = nowLogin.getIdx();
		if(fileserv.uploadFileDTO(dto, nowLoginIdx) == 1) {
			session.setAttribute("login", userserv.getUser(nowLogin.getEmail()));
			return 1;
		}
		return 0;
	}
	
	// 프로필 사진 삭제
	@GetMapping("/my/profile/delete/")
	public int deleteProfile(HttpSession session) {
		MemberDTO nowLogin = (MemberDTO)session.getAttribute("login");
		if(userserv.deleteProfile(nowLogin.getIdx()) == 1) {
			session.setAttribute("login", userserv.getUser(nowLogin.getEmail()));
			return 1;
		}
		return 0;
	}
	
	// 판매 정산 계좌 등록
	@PostMapping("/my/account/register/")
	public int registerAccount(AccountDTO dto, HttpSession session) {
		MemberDTO nowLogin = (MemberDTO)session.getAttribute("login");
		return userserv.registerAccount(dto, nowLogin.getIdx());
	}
	
	// 판매 정산 계좌 가져오기
	@GetMapping("/my/account/read/")
	public AccountDTO readAccount(HttpSession session) {
		MemberDTO nowLogin = (MemberDTO)session.getAttribute("login");
		return userserv.readAccount(nowLogin.getIdx());
	}
	
	// 구매입찰 내역 조회
	@PostMapping("/my/buying/BuyHistory/")
	public List<BuySellDTO> readBuyHistory(BuySellDTO dto, HttpSession session) {
		MemberDTO nowLogin = (MemberDTO)session.getAttribute("login");
		dto.setMemberIdx(nowLogin.getIdx());
		return userserv.readBuyHistory(dto);
	}

	// 판매입찰 내역 조회
	@PostMapping("/my/selling/SellHistory/")
	public List<BuySellDTO> readSellHistory(BuySellDTO dto, HttpSession session) {
		MemberDTO nowLogin = (MemberDTO)session.getAttribute("login");
		dto.setMemberIdx(nowLogin.getIdx());
		return userserv.readSellHistory(dto);
	}
}
