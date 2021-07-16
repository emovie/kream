package com.project.controller;



import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.project.model.MemberDTO;
import com.project.service.MemberService;

@Controller
public class NaverLogin {

	
	private NaverLoginBO bo;
	private String apiResult = null;
	private MemberService ms;
	

	@Inject
	public NaverLogin(MemberService ms) {
		this.ms = ms;
	}
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO bo) {
		this.bo = bo;
	}
	
	
	@RequestMapping(value = "/member/naver_login", method= {RequestMethod.GET, RequestMethod.POST})
	public String naver_login(Model model, HttpSession session) { 
		String naverAuthUrl = bo.getAuthorizationUrl(session);
		System.out.println("네이버 : " + naverAuthUrl);
		
		model.addAttribute("url",naverAuthUrl);
		
		return "/member/naver_login";
		
		
	}
	
	
	@RequestMapping(value = "/member/callback", method= {RequestMethod.GET, RequestMethod.POST})
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) 
		throws Exception{
		
		System.out.println("callback");
		OAuth2AccessToken oauthToken;
	    oauthToken = bo.getAccessToken(session, code, state);
	    //로그인 사용자 정보를 읽어온다.
	    apiResult = bo.getUserProfile(oauthToken);
	    System.out.println("result: " + apiResult);
	    
	    // String 형식을 JSON형태로 변환
	    JSONParser parser = new JSONParser();
	    Object obj = null;
		try {
			obj = parser.parse(apiResult);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	    JSONObject json_obj = (JSONObject) obj;
	    JSONObject response = (JSONObject) json_obj.get("response");
	    System.out.println(response);
	    
	    String email = (String) response.get("email");
	    String name = (String) response.get("name");
	    String profileimage = (String) response.get("profile_image");
	    String phonenumber = (String) response.get("mobile"); 

	    
	    System.out.printf("email: %s, name: %s, profileimage: %s, phonenumber: %s\n", email, name, profileimage, phonenumber);

	    
	    // 이메일 중복 체크
	    int result = ms.checkEmail(email);
	    System.out.println(result);
	    
	    
	   // 계정의 DB등록 
	    if(result == 0) {
	    	MemberDTO dto = new MemberDTO();
	    	dto.setEmail(email);
	    	dto.setName(name);
	    	dto.setProfileiamge(profileimage);	
	    	
	    	/* 수정 사항 : 
	    	 1. 프로필 이미지만 넣으면 밑에 오류가 뜸  
	    	 org.apache.ibatis.reflection.ReflectionException: There is no getter for property named
	    	 
	    	 2. result 값이 1일경우  (= db에 같은 이메일주소가 중복인 경우) 이미 가입된 메일 입니다라는 팝업 띄우기
	    	*/  
	    	dto.setPhonenumber(phonenumber);
	    	ms.naver_register(dto);
			session.setAttribute("login", dto);
	    	
	    }
	    
//	    session.setAttribute("login", )
	    
	    
	    model.addAttribute("result", apiResult);
	        
	        
	        
	    return "member/naverSuccess";
	}
}
