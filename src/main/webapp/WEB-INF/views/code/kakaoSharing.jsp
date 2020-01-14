<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>:: 카카오톡 공유하기 ::</title>
<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
	function shareKakaotalk() {
		Kakao.init("7fce3c86f0e6aeeac11028850040589c"); // 사용할 앱의 JavaScript 키를 설정
		Kakao.Link.sendDefault({
			objectType : "feed",
			content : {
				title : "Hello World!" // 콘텐츠의 타이틀
				,
				description : "코드지식인 공유 입니다!" // 콘텐츠 상세설명
				,
				imageUrl : "/img/kakao.png" // 썸네일 이미지 
				,
				link : {
					mobileWebUrl : "http://www.naver.com/" // 모바일 카카오톡에서 사용하는 웹 링크 URL
					,
					webUrl : "http://www.naver.com/" // PC버전 카카오톡에서 사용하는 웹 링크 URL
				}
			},
			social : {
				likeCount : 0 // LIKE 개수
				,
				commentCount : 0 // 댓글 개수
				,
				sharedCount : 0
			// 공유 회수
			},
			buttons : [ {
				title : "링크 이동하기" // 버튼 제목
				,
				link : {
					mobileWebUrl : "http://www.naver.com/" // 모바일 카카오톡에서 사용하는 웹 링크 URL
					,
					webUrl : "http://www.naver.com/" // PC버전 카카오톡에서 사용하는 웹 링크 URL
				}
			} ]
		});
	}
</script>
</head>
<body>
	
<a id="kakao-link-btn" href="javascript:;" onClick="shareKakaotalk();">
<img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"/>
</a>

</body>
</html>
