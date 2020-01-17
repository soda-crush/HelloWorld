package kh.hello.utils;

import java.math.BigInteger;
import java.security.MessageDigest;

public class Utils {
	
	//Itnews,Code-How로그인시 마지막 경로의 메서드 저장 변수
	public static String lastPathMethod;
	//로그인 직전 Itnews,Code-How에 있었는지 아닌지 저장하는 변수
	public static String isLastInItOrCode;
	
	public static String getIsLastInItOrCode() {
		return isLastInItOrCode;
	}
	public static void setIsLastInItOrCode(String isLastInItOrCode) {
		Utils.isLastInItOrCode = isLastInItOrCode;
	}
	public static String getLastPathMethod() {
		return lastPathMethod;
	}
	public static void setLastPathMethod(String lastPathMethod) {
		Utils.lastPathMethod = lastPathMethod;
	}

	public static String getRandomCode(){//메일 인증 코드
		return Integer.toString((int)(Math.random()*1000000));
	}
	
	public static int getRandomNum(int min, int max) {
		System.out.println(((int)(Math.random()*max)) + 1);
		return (((int)(Math.random()*max)) + 1);
	}
	
	public static String protectXss(String input) {
		input = input.replaceAll("&", "&amp;");
		input = input.replaceAll("<", "&lt;");
		input = input.replaceAll(">", "&gt;");
		
		return input;		
	}
	
	public static String encrypt (String pw) throws Exception{
		MessageDigest digest = MessageDigest.getInstance("SHA-256");
		digest.reset();
		digest.update(pw.getBytes("utf8"));
		String result = String.format("%064x", new BigInteger(1, digest.digest()));
		return result;
	}
	
}
