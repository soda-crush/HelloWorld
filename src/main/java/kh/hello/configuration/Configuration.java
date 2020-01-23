package kh.hello.configuration;

public class Configuration {
	public static int recordCountPerPage = 10;
	public static int naviCountPerPage = 5;
	public static String ip = "52.79.135.246";
	
	//프로젝트(PLog용)
	public static int pLogProjectRecordCountPerPage = 5;
	public static int pLogProjectNaviCountPerPage = 5;
	
	
	//글 작성시 추가 포인트
	public static int articleAddPoint = 10;
	//글 작성시 삭감 포인트
	public static int articleDelPoint = -15;
	//댓글 작성시 추가 포인트
	public static int commentAddPoint = 5;
	//댓글 작성시 삭감 포인트
	public static int commentDelPoint = -5;
	
	
	//광고 최대개수
	public static int maxAd = 7;
}
