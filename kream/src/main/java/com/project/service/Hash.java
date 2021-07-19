package com.project.service;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Hash {

	public static String getHash(String input) {
		
		MessageDigest md;
		try {
			md = MessageDigest.getInstance("SHA-512");
			md.reset();
			md.update(input.getBytes("UTF-8"));
			String hashNumber = String.format("%0128x", new BigInteger(1, md.digest()));
			return hashNumber;
		} catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return null;
	}

}
