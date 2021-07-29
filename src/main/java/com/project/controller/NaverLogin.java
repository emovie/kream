package com.project.controller;



import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	public String naver_login(HttpServletRequest request, HttpServletResponse response,Model model, HttpSession session) { 
	
		String serverUrl = request.getScheme() + "://"+request.getServerName();
	
		if(request.getServerPort() != 80) {
			serverUrl = serverUrl + ":" + request.getServerPort();
		}
		
		
		String naverAuthUrl = bo.getAuthorizationUrl(session, serverUrl);
		System.out.println("네이버 : " + naverAuthUrl);
		
		model.addAttribute("url",naverAuthUrl);
		
		return "/member/naver_login";
	}
	
	
	@RequestMapping(value = "/member/callback", method= {RequestMethod.GET, RequestMethod.POST})
	public String callback(HttpServletRequest request, HttpServletResponse response, 
			Model model, @RequestParam String code, @RequestParam String state, HttpSession session) 
			throws Exception{
		
		String serverUrl = request.getScheme() + "://"+request.getServerName();
		
		if(request.getServerPort() != 80) {
			serverUrl = serverUrl + ":" + request.getServerPort();
		}
		
		System.out.println("serverUrl: " + serverUrl);
		OAuth2AccessToken oauthToken;
	    oauthToken = bo.getAccessToken(session, code, state, serverUrl);
	    //로그인 사용자 정보를 읽어온다.
	    apiResult = bo.getUserProfile(oauthToken, serverUrl);
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
	    JSONObject json_resp = (JSONObject) json_obj.get("response");
	    System.out.println(json_resp);
	    
	    String email = (String) json_resp.get("email");
	    String name;
	    
	    
	    if (json_resp.get("name") == null ) {
	    	
			int idx = email.indexOf("@");
			name = email.substring(0, idx);
	    	
	    }else 
	    	name = (String) json_resp.get("name");
	    
	    String profileimage = (String) json_resp.get("profile_image");
	    String phonenumber = (String) json_resp.get("mobile"); 

	    
	    System.out.printf("email: %s, name: %s, profileimage: %s, phonenumber: %s\n", email, name, profileimage, phonenumber);

	    
	    // 이메일 중복 체크
	    int dupli_mail = ms.checkEmail(email);
	    System.out.println(dupli_mail);
	    
	    
	   // 계정의 DB등록 
	    MemberDTO dto = new MemberDTO();
	    dto.setEmail(email);
	    dto.setName(name);
	    dto.setProfileimage(profileimage);	
	    dto.setPhonenumber(phonenumber.replaceAll("[^0-9]", ""));

	    System.out.println(dto.getPhonenumber());
 
	    int dupli_pw = ms.checkPw(email);
	    
	    System.out.println("dupli_pw : " + dupli_pw);
	    if(dupli_mail == 0 ) {
	    	
	    	/* 수정 사항 : 
	    	 1. 프로필 이미지만 넣으면 밑에 오류가 뜸  
	    	 org.apache.ibatis.reflection.ReflectionException: There is no getter for property named
	    	 
	    	 
	    	 네이버 아이디로 로그인 했다 => 네아로로 회원 가입이 되어 있는 경우 = > 로그인 
									dupli_mail = 1, dupli_pw == null;

							  => 미리 회원 가입이 안되어있는 경우 => 회원가입 (db저장) = > 로그인
									dupli_mail = 0, dupli_pw == null;

							  => 같은 계정으로 회원가입이 되어 있는 경우 => 회원가입 불가. 									dupli_mail = 1, dupli_pw != null;
  								dupli_mail = 1, dupli_pw != null;
	    	*/
	    	ms.naver_register(dto);
	    	
	    	
	    	
	    } else if(dupli_pw != 0) {
	    	System.out.println("중복된 아이디가 있음");
	    	return "member/naverFail";
	    } 
	    
	    int memberIdx = ms.getIdx(email); 
    	System.out.println("memberIdx: " + memberIdx);
    	dto.setIdx(memberIdx);
    	
    	
	    session.setAttribute("login", dto);
	    System.out.println("dto.getIdx():" + dto.getIdx());
	    model.addAttribute("result", apiResult);
	        
	        
	    return "member/naverSuccess";
	}
}
