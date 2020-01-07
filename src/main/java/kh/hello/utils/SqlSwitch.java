package kh.hello.utils;

public class SqlSwitch {//sql문 변환완료되었으면 본인 sql문 지워주세요.
	public static void main(String[] args) {
		String sql = "CREATE TABLE \"codeQuestion\" (\r\n" + 
				"	\"seq\"	number		NOT NULL,\r\n" + 
				"	\"division\"	varchar(20)		NULL,\r\n" + 
				"	\"title\"	varchar(300)		NULL,\r\n" + 
				"	\"content\"	clob		NULL,\r\n" + 
				"	\"writer\"	varchar(100)		NULL,\r\n" + 
				"	\"point\"	number		NULL,\r\n" + 
				"	\"viewCount\"	number		NULL,\r\n" + 
				"	\"writeDate\"	Timestamp		NULL\r\n" + 
				");\r\n" + 
				"\r\n" + 
				"CREATE TABLE \"bamboo\" (\r\n" + 
				"	\"seq\"	number		NOT NULL,\r\n" + 
				"	\"writer\"	varchar(100)		NULL,\r\n" + 
				"	\"title\"	varchar(300)		NULL,\r\n" + 
				"	\"content\"	clob		NULL,\r\n" + 
				"	\"writeDate\"	Timestamp		NULL,\r\n" + 
				"	\"viewCount\"	number		NULL\r\n" + 
				");\r\n" + 
				"\r\n" + 
				"CREATE TABLE \"inquiry\" (\r\n" + 
				"	\"seq\"	number		NOT NULL,\r\n" + 
				"	\"title\"	varchar(300)		NULL,\r\n" + 
				"	\"content\"	clob		NULL,\r\n" + 
				"	\"writer\"	varchar(100)		NULL,\r\n" + 
				"	\"writeDate\"	Timestamp		NULL,\r\n" + 
				"	\"count\"	number		NULL\r\n" + 
				");\r\n" + 
				"\r\n" + 
				"CREATE TABLE \"adminAccount\" (\r\n" + 
				"	\"adminId\"	varchar(100)		NULL,\r\n" + 
				"	\"password\"	varchar(256)		NULL,\r\n" + 
				"	\"email\"	varchar(200)		NULL\r\n" + 
				");\r\n" + 
				"\r\n" + 
				"CREATE TABLE \"forcedOut\" (\r\n" + 
				"	\"seq\"	number		NOT NULL,\r\n" + 
				"	\"id\"	varchar(100)		NULL,\r\n" + 
				"	\"resaon\"	varchar(200)		NULL,\r\n" + 
				"	\"outDate\"	timestamp		NULL\r\n" + 
				");\r\n" + 
				"\r\n" + 
				"CREATE TABLE \"project\" (\r\n" + 
				"	\"seq\"	number		NOT NULL,\r\n" + 
				"	\"title\"	varchar(300)		NULL,\r\n" + 
				"	\"contents\"	clob		NULL,\r\n" + 
				"	\"location1\"	varchar(20)		NULL,\r\n" + 
				"	\"location2\"	varchar(20)		NULL,\r\n" + 
				"	\"capacity\"	number		NULL,\r\n" + 
				"	\"startDate\"	timestamp		NULL,\r\n" + 
				"	\"endDate\"	timestamp		NULL,\r\n" + 
				"	\"languages\"	varchar(1000)		NULL,\r\n" + 
				"	\"phone\"	varchar(13)		NULL,\r\n" + 
				"	\"email\"	varchar(200)		NULL,\r\n" + 
				"	\"writer\"	varchar(100)		NULL,\r\n" + 
				"	\"writeDate\"	timestamp		NULL,\r\n" + 
				"	\"state\"	varchar(1)		NULL,\r\n" + 
				"	\"viewCount\"	number		NULL\r\n" + 
				");\r\n" + 
				"\r\n" + 
				"CREATE TABLE \"Portfolio\" (\r\n" + 
				"	\"seq\"	number		NOT NULL,\r\n" + 
				"	\"writer\"	varchar(100)		NULL,\r\n" + 
				"	\"potfolioTitle\"	varchar(200)		NULL,\r\n" + 
				"	\"startDate\"	timestamp		NULL,\r\n" + 
				"	\"endDate\"	timestamp		NULL,\r\n" + 
				"	\"Purpose\"	varchar(1000)		NULL,\r\n" + 
				"	\"environment\"	varchar(1000)		NULL,\r\n" + 
				"	\"allFunction\"	clob		NULL,\r\n" + 
				"	\"dbUnitPlan\"	clob		NULL,\r\n" + 
				"	\"role\"	clob		NULL,\r\n" + 
				"	\"contribution\"	clob		NULL,\r\n" + 
				"	\"image1\"	clob		NULL,\r\n" + 
				"	\"function1\"	clob		NULL,\r\n" + 
				"	\"explanation1\"	clob		NULL,\r\n" + 
				"	\"image2\"	varchar(400)		NULL,\r\n" + 
				"	\"function2\"	clob		NULL,\r\n" + 
				"	\"explanation2\"	clob		NULL,\r\n" + 
				"	\"image3\"	varchar(400)		NULL,\r\n" + 
				"	\"function3\"	clob		NULL,\r\n" + 
				"	\"explanation3\"	clob		NULL,\r\n" + 
				"	\"git\"	varchar(200)		NULL\r\n" + 
				");\r\n" + 
				"\r\n" + 
				"CREATE TABLE \"industryStatus\" (\r\n" + 
				"	\"seq\"	number		NOT NULL,\r\n" + 
				"	\"field\"	varchar(30)		NULL,\r\n" + 
				"	\"duty\"	varchar(30)		NULL,\r\n" + 
				"	\"writer\"	varchar(100)		NULL,\r\n" + 
				"	\"title\"	varchar(300)		NULL,\r\n" + 
				"	\"content\"	clob		NULL,\r\n" + 
				"	\"writeDate\"	Timestamp		NULL,\r\n" + 
				"	\"viewCount\"	number		NULL\r\n" + 
				");\r\n" + 
				"\r\n" + 
				"CREATE TABLE \"codeReply\" (\r\n" + 
				"	\"seq\"	number		NOT NULL,\r\n" + 
				"	\"queSeq\"	number		NULL,\r\n" + 
				"	\"title\"	varchar(300)		NULL,\r\n" + 
				"	\"content\"	clob		NULL,\r\n" + 
				"	\"writer\"	varchar(100)		NULL,\r\n" + 
				"	\"writeDate\"	Timestamp		NULL\r\n" + 
				");\r\n" + 
				"\r\n" + 
				"CREATE TABLE \"codeComments\" (\r\n" + 
				"	\"seq\"	number		NOT NULL,\r\n" + 
				"	\"repSeq\"	number		NULL,\r\n" + 
				"	\"content\"	clob		NULL,\r\n" + 
				"	\"writer\"	varchar(100)		NULL,\r\n" + 
				"	\"writeDate\"	Timestamp		NULL\r\n" + 
				");\r\n" + 
				"\r\n" + 
				"CREATE TABLE \"member\" (\r\n" + 
				"	\"id\"	varchar(100)		NOT NULL,\r\n" + 
				"	\"pw\"	varchar(200)		NULL,\r\n" + 
				"	\"name\"	varchar(100)		NULL,\r\n" + 
				"	\"nickName\"	varchar(100)		NULL,\r\n" + 
				"	\"email\"	varchar(200)		NULL,\r\n" + 
				"	\"phone\"	varchar(11)		NULL,\r\n" + 
				"	\"postcode\"	varchar(20)		NULL,\r\n" + 
				"	\"addr1\"	varchar(200)		NULL,\r\n" + 
				"	\"addr2\"	VARCHAR(255)		NULL,\r\n" + 
				"	\"joinPath\"	varchar(200)		NULL,\r\n" + 
				"	\"gender\"	varchar(5)		NULL,\r\n" + 
				"	\"memLevel\"	VARCHAR(255)		NULL,\r\n" + 
				"	\"reportCount\"	VARCHAR(255)		NULL,\r\n" + 
				"	\"point\"	number		NULL,\r\n" + 
				"	\"ifmOpenCheck\"	varchar(5)		NULL,\r\n" + 
				"	\"joinDate\"	timestamp		NULL,\r\n" + 
				"	\"lastLogin\"	timestamp		NULL,\r\n" + 
				"	\"profileImg\"	varchar(100)		NULL,\r\n" + 
				"	\"birth\"	timestamp		NULL\r\n" + 
				");\r\n" + 
				"\r\n" + 
				"CREATE TABLE \"inquiryImgs\" (\r\n" + 
				"	\"seq\"	number		NOT NULL,\r\n" + 
				"	\"boardSeq\"	number		NULL,\r\n" + 
				"	\"sysName\"	varchar(200)		NULL\r\n" + 
				");\r\n" + 
				"\r\n" + 
				"CREATE TABLE \"industryComments\" (\r\n" + 
				"	\"seq\"	number		NOT NULL,\r\n" + 
				"	\"indSeq\"	number		NULL,\r\n" + 
				"	\"writer\"	varchar(100)		NULL,\r\n" + 
				"	\"content\"	clob		NULL,\r\n" + 
				"	\"writedate\"	Timestamp		NULL\r\n" + 
				");\r\n" + 
				"\r\n" + 
				"CREATE TABLE \"bambooComments\" (\r\n" + 
				"	\"seq\"	number		NOT NULL,\r\n" + 
				"	\"bamSeq\"	number		NULL,\r\n" + 
				"	\"writer\"	varchar(100)		NULL,\r\n" + 
				"	\"content\"	clob		NULL,\r\n" + 
				"	\"writeDate\"	Timestamp		NULL\r\n" + 
				");\r\n" + 
				"\r\n" + 
				"CREATE TABLE \"today\" (\r\n" + 
				"	\"days\"	Timestamp		NOT NULL,\r\n" + 
				"	\"connections\"	number		NULL\r\n" + 
				");\r\n" + 
				"\r\n" + 
				"CREATE TABLE \"emailConfirm\" (\r\n" + 
				"	\"domain\"	varchar(100)		NOT NULL,\r\n" + 
				"	\"officeName\"	varchar(200)		NULL\r\n" + 
				");\r\n" + 
				"\r\n" + 
				"CREATE TABLE \"projectComment\" (\r\n" + 
				"	\"seq\"	number		NOT NULL,\r\n" + 
				"	\"projectSeq\"	number		NULL,\r\n" + 
				"	\"writer\"	varchar(100)		NULL,\r\n" + 
				"	\"contents\"	varchar(4000)		NULL,\r\n" + 
				"	\"writeDate\"	timestamp		NULL\r\n" + 
				");\r\n" + 
				"\r\n" + 
				"CREATE TABLE \"projectApply\" (\r\n" + 
				"	\"seq\"	number		NOT NULL,\r\n" + 
				"	\"projectSeq\"	number		NULL,\r\n" + 
				"	\"writer\"	varchar(100)		NULL,\r\n" + 
				"	\"languages\"	varchar(1000)		NULL,\r\n" + 
				"	\"gender\"	varchar(1)		NULL,\r\n" + 
				"	\"age\"	varchar(20)		NULL,\r\n" + 
				"	\"workIn\"	varchar(1)		NULL,\r\n" + 
				"	\"email\"	varchar(200)		NULL,\r\n" + 
				"	\"etc\"	varchar(4000)		NULL,\r\n" + 
				"	\"writeDate\"	timestamp		NULL,\r\n" + 
				"	\"approve\"	varchar(1)		NULL,\r\n" + 
				"	\"proceeding\"	number		NULL\r\n" + 
				");\r\n" + 
				"\r\n" + 
				"CREATE TABLE \"scrap\" (\r\n" + 
				"	\"seq\"	number		NOT NULL,\r\n" + 
				"	\"writer\"	varchar(200)		NULL,\r\n" + 
				"	\"category\"	varchar(200)		NULL,\r\n" + 
				"	\"categorySeq\"	varchar(200)		NULL\r\n" + 
				");\r\n" + 
				"\r\n" + 
				"CREATE TABLE \"projectList\" (\r\n" + 
				"	\"seq\"	number		NOT NULL,\r\n" + 
				"	\"projectSeq\"	number		NULL,\r\n" + 
				"	\"id\"	varchar(100)		NULL\r\n" + 
				");\r\n" + 
				"\r\n" + 
				"CREATE TABLE \"guestBook\" (\r\n" + 
				"	\"seq\"	number		NOT NULL,\r\n" + 
				"	\"owner\"	varchar(100)		NULL,\r\n" + 
				"	\"writer\"	varchar(100)		NULL,\r\n" + 
				"	\"content\"	clob		NULL,\r\n" + 
				"	\"writeDate\"	Timestamp		NULL\r\n" + 
				");\r\n" + 
				"\r\n" + 
				"CREATE TABLE \"inquiryReply\" (\r\n" + 
				"	\"seq\"	number		NOT NULL,\r\n" + 
				"	\"boardSeq\"	number		NULL,\r\n" + 
				"	\"reply\"	varchar(4000)		NULL,\r\n" + 
				"	\"writeDate\"	Timestamp		NULL\r\n" + 
				");\r\n" + 
				"\r\n" + 
				"CREATE TABLE \"itnews\" (\r\n" + 
				"	\"seq\"	number		NOT NULL,\r\n" + 
				"	\"writer\"	varchar(100)		NULL,\r\n" + 
				"	\"title\"	varchar(300)		NULL,\r\n" + 
				"	\"content\"	clob		NULL,\r\n" + 
				"	\"writeDate\"	Timestamp		NULL,\r\n" + 
				"	\"viewCount\"	number		NULL\r\n" + 
				");\r\n" + 
				"\r\n" + 
				"CREATE TABLE \"itnewsComments\" (\r\n" + 
				"	\"seq\"	number		NOT NULL,\r\n" + 
				"	\"itSeq\"	number		NULL,\r\n" + 
				"	\"writer\"	varchar(100)		NULL,\r\n" + 
				"	\"content\"	clob		NULL,\r\n" + 
				"	\"writeDate\"	Timestamp		NULL\r\n" + 
				");\r\n" + 
				"\r\n" + 
				"CREATE TABLE \"signupcertification\" (\r\n" + 
				"	\"email\"	varchar(150)		NULL,\r\n" + 
				"	\"certificationCode\"	varchar(20)		NULL\r\n" + 
				");\r\n" + 
				"\r\n" + 
				"CREATE TABLE \"industryImgs\" (\r\n" + 
				"	\"seq\"	number		NOT NULL,\r\n" + 
				"	\"indSeq\"	number		NULL,\r\n" + 
				"	\"fileName\"	varchar(200)		NULL\r\n" + 
				");\r\n" + 
				"\r\n" + 
				"CREATE TABLE \"bambooImgs\" (\r\n" + 
				"	\"seq\"	number		NOT NULL,\r\n" + 
				"	\"bamSeq\"	number		NULL,\r\n" + 
				"	\"fileName\"	varchar(200)		NULL\r\n" + 
				");\r\n" + 
				"\r\n" + 
				"";// export로 가져온 sql문 넣기.
		sql = sql.replace("\"", "");
//		sql = sql.replace("`", "");
		System.out.println(sql);
	}
}
