<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World!</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="${pageContext.request.contextPath }/icon/favicon.ico"/>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/project/projectBase.css" type="text/css"/>
<link rel="stylesheet" href="/css/project/writeBase.css" type="text/css"/>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
<script src="/js/summernote-ko-KR.js"></script>
<script src="/js/bootstrap-datepicker.js"></script>
<script src="/js/bootstrap-datepicker.ko.min.js"></script>
<link rel="stylesheet" href="/css/bootstrap-datepicker.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/typeahead.js/0.11.1/typeahead.bundle.min.js"></script>
<script src="https://bootstrap-tagsinput.github.io/bootstrap-tagsinput/dist/bootstrap-tagsinput.min.js"></script>
<link rel="stylesheet" href="https://bootstrap-tagsinput.github.io/bootstrap-tagsinput/dist/bootstrap-tagsinput.css">
<link rel="stylesheet" href="https://bootstrap-tagsinput.github.io/bootstrap-tagsinput/examples/assets/app.css">
<script>
   $(function(){
      $("#proNavi").attr('class','nav-item nav-link active');
   });
</script>
</head>

<body>
	<jsp:include page="/WEB-INF/views/standard/header.jsp"/>
	
 		<div id=baseBackgroundColor>
            <div class=container>
                <div class=row>
                    <div class="col-12" id=aroundContent>
                    </div>
                </div>
            </div>
            
            <!--      몸통 시작!!!   -->
            <div class=container id="projectPage">
				<div id="pageTitle">
					<h1>프로젝트 모집 수정</h1>
				</div>
				
				<form action="/project/modifyProc" method="post" id="modifyFrm">
					<div id="pageBody">					
						<div id="pInfo">
							<div class="row">
								<div class="col-md-2"><label class="pItem">지역</label><label class="star">*</label></div>
								<div class="col-md-10">
									<select class="form-control form-control-sm pSelect" onChange="loc1_change(this.value,loc2)" id="loc1" name="loc1">
										<option selected disabled>선택</option>
								        <option value='0'>지역무관</option>
								        <option value='1'>서울</option>
								        <option value='2'>부산</option>
								        <option value='3'>대구</option>
								        <option value='4'>인천</option>
								        <option value='5'>광주</option>
								        <option value='6'>대전</option>
								        <option value='7'>울산</option>
								        <option value='8'>강원</option>
								        <option value='9'>경기</option>
								        <option value='10'>경남</option>
								        <option value='11'>경북</option>
								        <option value='12'>전남</option>
								        <option value='13'>전북</option>
								        <option value='14'>제주</option>
								        <option value='15'>충남</option>
								        <option value='16'>충북</option>
									</select>
									<input type=hidden name="location1" id="location1">
									<select class="form-control form-control-sm pSelect" id="loc2" name="loc2">
										<option selected disabled>선택</option>
									</select>
									<input type=hidden name="location2" id="location2">
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-2"><label class="pItem">모집인원</label><label class="star">*</label></div>
								<div class="col-md-2">
									<input type="number" id="capacity" name="capacity" class="form-control form-control-sm pSelect" min="1" max="100">
								</div>
							</div>
							<div class="row">
								<div class="col-md-2"><label class="pItem">프로젝트 기간</label><label class="star">*</label></div>
								<div class="col-md-10">
	        						<input type="text" class="form-control form-control-sm datePicker" placeholder="시작일" name="startDate" id="startDate" value="${pPage.formedCalStartDate }" readonly>
	        						<span> ~ </span>
	        						<input type="text" class="form-control form-control-sm datePicker" placeholder="종료일" name="endDate" id="endDate" value="${pPage.formedCalEndDate }" readonly>	        						
	    						</div>
							</div>							
							<div class="row">
								<div class="col-md-2"><label class="pItem">사용언어</label><label class="star">*</label></div>
								<div class="col-md-7" style="max-width:415px;word-break:break-all;word-break:break-word;">
									<input type="text" class="form-control" id="languages" name="languages" style="word-break:break-all;word-break:break-word;">
								</div>
							</div>
							<div class="row">
								<div class="col-md-2"><label class="pItem">연락처</label></div>
								<div class="col-md-7">
									<input type="text" class="form-control form-control-sm phone p-1" maxlength="3" id="phone1"> -
									<input type="text" class="form-control form-control-sm phone p-1" maxlength="4" id="phone2"> -
									<input type="text" class="form-control form-control-sm phone p-1" maxlength="4" id="phone3">
									<input type="hidden" name="phone" id="phone">
								</div>
							</div>
							<div class="row">
								<div class="col-md-2"><label class="pItem">메일주소</label></div>							
								<div class="col-md-7"><input type="email" class="form-control form-control-sm" id="email" name="email" value="${pPage.email}" style="width:385px;"></div>
							</div>
						</div>
						<div id="pBody">
							<div id="pTitleInput"><input type="text" class="form-control" placeholder="제목을 입력해주세요" name="title" id="title" value="${fn:escapeXml(pPage.title)}" maxlength="100"></div>
							<div id="pContentsInput"><textarea class="form-control summernote" name="contents" id="contents">${pPage.contents }</textarea></div>		
							<input type=hidden name=seq value="${pPage.seq }">
							<input type="hidden" id="nonTagContents" name="nonTagContents">									
						</div>					
					</div>
					<div id="pageFooter">
						<span><a class="btn btn-secondary" href="/project/list" role="button">목록</a></span>
						<span class="float-right">						
							<a class="btn btn-secondary" href="/project/list" role="button">취소</a>
							<input class="btn btn-primary" type="submit" value="글쓰기" id="modifyBtn">													
						</span>
					</div>
				</form>  
				
				<div>
					<input type="hidden" id="oriLoc1" value="${pPage.location1}">
					<input type="hidden" id="oriLoc2" value="${pPage.location2}">
					<input type="hidden" id="oriCapa" value="${pPage.capacity}">
					<input type="hidden" id="oriPhone" value="${pPage.phone}">		
					<input type="hidden" id="langData" value='${data }'>				
					<input type="hidden" id="oriLangs" value="${pPage.languages }">		
				</div>        
            </div>
            <!--       몸통 끝!!!   -->
            
            <div class=container>
                <div class=row>
                    <div class="col-12" id=aroundContent>
                    </div>
                </div>
            </div>
        </div>
        
        <jsp:include page="/WEB-INF/views/standard/footer.jsp"/>
        
        <script src="/js/project/location.js"></script>
        <script src="/js/project/modify.js"></script>
        <script>
			$('.summernote').summernote({
				lang: 'ko-KR',
		        placeholder: '내용을 입력해주세요',	        
		        minHeight: 400,
		        maxHeight: 400,
		        toolbar: [
		            ['style', ['style']],
		            ['font', ['bold', 'underline', 'clear']],
		            ['fontname', ['fontname']],
		            ['color', ['color']],
		            ['para', ['ul', 'ol', 'paragraph']],
		            ['table', ['table']],
		            ['insert', ['link', 'picture', 'hr']],
		            ['view', ['fullscreen']],
		            ['help', ['help']]
		          ]
		    });
        </script>        
</body>
</html>