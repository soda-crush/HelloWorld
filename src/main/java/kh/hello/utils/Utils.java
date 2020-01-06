package kh.hello.utils;

public class Utils {
	public static String getRandomCode(){//메일 인증 코드
		return Integer.toString((int)(Math.random()*1000000));
	}
	
	public static int getRandomNum(int min, int max) {
		System.out.println(((int)(Math.random()*max)) + 1);
		return (((int)(Math.random()*max)) + 1);
	}
	
}
