package com.project.controller;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.util.StringUtils;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

public class NaverLoginBO {
// 인증 요청문을 구성하는 파라미터
// client_id : 애플리케이션 등록 후 발급받은 클라이언트 아이디
// response_type: 인증 과정에 대한 구분값. code값 고정 
// redirect_uri: 네이버 로그인 인증의 결과를 전달받을 콜백 URL(URL 인코딩)
//state: 애플리케이션이 생성한 상태 토큰
	
	private final static String CLIENT_ID = "x8c8b_vEHqxVlX_8sPBS";
	private final static String CLIENT_SECRET = "7Hp0uBSJS6";                      
    private final static String REDIRECT_URI = "/kream/member/callback";
    private final static String SESSION_STATE = "oauth_state";
    
    /* 프로필 조회 API URL */
    private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";
    
    public String getAuthorizationUrl(HttpSession session, String serverUrl) {
    	
    	String state = generateRandomString();
    	setSession(session, state);
    	
    	OAuth20Service oauthService = new ServiceBuilder()
    		.apiKey(CLIENT_ID)
    		.apiSecret(CLIENT_SECRET)
    		.callback(serverUrl + REDIRECT_URI)
    		.state(state)
    		.build(NaverLoginApi.instance());
    	
		return oauthService.getAuthorizationUrl();
    	
    }

    public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state, String serverUrl) throws IOException{

        String sessionState = getSession(session);
        if(StringUtils.pathEquals(sessionState, state)){

            OAuth20Service oauthService = new ServiceBuilder()
            	.apiKey(CLIENT_ID)
                .apiSecret(CLIENT_SECRET)
                .callback(serverUrl + REDIRECT_URI)
                .state(state)
                .build(NaverLoginApi.instance());

            
            OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
            return accessToken;
        }
        return null;
    }
    
    /* Access Token을 이용하여 네이버 사용자 프로필 API를 호출 */
    public String getUserProfile(OAuth2AccessToken oauthToken, String serverUrl) throws IOException{

        OAuth20Service oauthService =new ServiceBuilder()
                .apiKey(CLIENT_ID)
                .apiSecret(CLIENT_SECRET)
                .callback(serverUrl + REDIRECT_URI).build(NaverLoginApi.instance());

            OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
        oauthService.signRequest(oauthToken, request);
        Response response = request.send();
        return response.getBody();
    }
    
    
	private void setSession(HttpSession session, String state) {
		session.setAttribute(SESSION_STATE, state);
	}
	
	private String getSession(HttpSession session) {
		return (String) session.getAttribute(SESSION_STATE);
	}

	private String generateRandomString() {
		return UUID.randomUUID().toString();
	}
}
