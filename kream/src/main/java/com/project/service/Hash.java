package com.project.service;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Hash {
	public static String getHash(String input) {
		
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-512");
			md.reset();
			md.update(input.getBytes("utf-8"));
			String hashNumber = String.format("%0128x",new BigInteger(1, md.digest()));
			return hashNumber;
			
		} catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
			e.printStackTrace();
			System.out.println("해시 알고리즘이 틀렸거나, 인코딩에 문제 발생");
		}
		return null;
		
	}
}
