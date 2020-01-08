package kh.hello.utils;

public class SqlSwitch {//sql문 변환완료되었으면 본인 sql문 지워주세요.
	public static void main(String[] args) {
		String sql = "";// export로 가져온 sql문 넣기.
		sql = sql.replace("\"", "");
		sql = sql.replace("`", "");
		System.out.println(sql);
	}
}
