<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- <head> -->
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> -->
<!-- <title>:: 카카오톡 공유하기 ::</title> -->
<!-- <script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script> -->
<!-- <script type="text/javascript"> -->
<!--     function shareKakaotalk() { -->
<!--         Kakao.init("7fce3c86f0e6aeeac11028850040589c");      // 사용할 앱의 JavaScript 키를 설정 -->
<!--         Kakao.Link.sendDefault({ -->
<!--               objectType:"feed" -->
<!--             , content : { -->
<!--                   title:"Hello World!"   // 콘텐츠의 타이틀 -->
<!--                 , description:"내 포트폴리오 입니다!"   // 콘텐츠 상세설명 -->
<!--                 , imageUrl:   // 썸네일 이미지  -->
<!--                 link : { -->
<!--                       mobileWebUrl:"http://www.naver.com/"    // 모바일 카카오톡에서 사용하는 웹 링크 URL -->
<!--                     , webUrl:"http://www.naver.com/"  // PC버전 카카오톡에서 사용하는 웹 링크 URL -->
<!--                 } -->
<!--             } -->
<!--             , social : { -->
<!--                   likeCount:0       // LIKE 개수 -->
<!--                 , commentCount:0    // 댓글 개수 -->
<!--                 , sharedCount:0     // 공유 회수 -->
<!--             } -->
<!--             , buttons : [ -->
<!--                 { -->
<!--                       title:"게시글 확인"    // 버튼 제목 -->
<!--                     , link : { -->
<!--                         mobileWebUrl:"http://www.naver.com/"    // 모바일 카카오톡에서 사용하는 웹 링크 URL -->
<!--                       , webUrl:"http://www.naver.com/"  // PC버전 카카오톡에서 사용하는 웹 링크 URL -->
<!--                     } -->
<!--                 } -->
<!--             ] -->
<!--         }); -->
<!--     } -->
<!-- </script> -->
<!-- </head> -->
<!-- <body> -->
<!--     <h1>카카오톡 공유하기</h1> -->
<!--     <input type="button" onClick="shareKakaotalk();" value="KAKOA Talk으로 공유하기"/> -->
<!-- </body> -->
<!-- </html> -->

<head>
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>KakaoLink v2 Demo(Scrap) - Kakao JavaScript SDK</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>
<body>
<a id="kakao-link-btn" href="javascript:;">
<img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"/>
</a>

<script type='text/javascript'>
  
    // // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init("7fce3c86f0e6aeeac11028850040589c");
    // // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
//     Kakao.Link.createScrapButton({
//       container: '#kakao-link-btn',
//       requestUrl: 'https://developers.kakao.com'
//     });
    
    function shareKakaotalk() {
            
        Kakao.Link.sendDefault({
           	container: '#kakao-link-btn',
              objectType:"feed", 
              content : {
                  title:"Hello World!"   // 콘텐츠의 타이틀
                , description:"내 포트폴리오 입니다!"   // 콘텐츠 상세설명
                , imageUrl:""   // 썸네일 이미지 
                , link : {
                      mobileWebUrl:"http://www.naver.com/"    // 모바일 카카오톡에서 사용하는 웹 링크 URL
                    , webUrl:"http://www.naver.com/"  // PC버전 카카오톡에서 사용하는 웹 링크 URL
                }
            }
            , social : {
                  likeCount:0       // LIKE 개수
                , commentCount:0    // 댓글 개수
                , sharedCount:0     // 공유 회수
            }
            , buttons : [
                {
                      title:"게시글 확인"    // 버튼 제목
                    , link : {
                        mobileWebUrl:"http://www.naver.com/"    // 모바일 카카오톡에서 사용하는 웹 링크 URL
                      , webUrl:"http://www.naver.com/"  // PC버전 카카오톡에서 사용하는 웹 링크 URL
                    }
                }
            ]
        });
    }
   
 

</script>

</body>
</html>
