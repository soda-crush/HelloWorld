<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World!</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/projectBase.css" type="text/css"/>
<link rel="stylesheet" href="/css/font-awesome/css/font-awesome.css" type="text/css"/>
<style>
	#pageTitle{margin-bottom:20px;}
	#pageTitle h1{display:inline;margin-right:10px;font-weight:bold;}
	#pageBody{background-color:white;}	
	#pHeader,#pageFooter{padding-top:10px;}
	#pHeader #stateLabel{color:white;}
	#pHeader label.N{background-color:limegreen;}
	#pHeader label.Y{background-color:red;}
	#pHeader label:not(#stateLabel){font-size:13px;}
	#pHeader span:first-of-type{font-size:20px;}
	#pHeader label:nth-of-type(2){width:200px;}
	#pHeader .fa{margin-left:15px;margin-top:15px;font-size:20px;}
	#pInfo *,#pBody *{font-size:15px;font-weight:bold;}
	#pInfo label,#pBody label{width:100px;color:darkgray;}
	.applyBtn{margin-bottom:20px;}
	.modal-title{font-weight:bold;}
	.aItem{margin-top:5px;font-size:15px;font-weight:bold;}
	.star{margin-left:2px;color:red;}
	.genderRadio,.workInRadio{padding-top:5px;}
	#pCoInput{margin-top:20px;}
	#pCoInput textarea{height:100px; margin-left:20px; margin-bottom:20px;}
	#pCoInput button{height:45px; width:90%;}
	.pApply{font-size:13px;color:red;}
	.checkBtn button:nth-child(2){margin-left:10px;}
	#advBox{height:100px;width:100%;background-color:darkgray;margin-top:20px;}
</style>
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
					<h1>프로젝트 모집</h1>
				</div>
				<div class="border border-secondary rounded" id="pageBody">
					<c:if test="${pPage.seq !=null }">
						<div id="pHeader">
							<label class="${pPage.state } badge badge-pill ml-4" id="stateLabel">${pPage.stateInKor }</label>
							<i class="fa fa-share-alt"></i><i class="fa fa-bookmark"></i><br>
							<span class="ml-4" style="font-weight:bold;">${pPage.title}</span><br>
							<label class="ml-4">작성자 : ${pPage.writer }</label><label>작성일 : ${pPage.formedWriteDate }</label>
						</div>
						<hr>
						<div id="pInfo">
							<div><label class="ml-4">지역</label><span>${pPage.location1 } ${pPage.location2 }</span></div>
							<div><label class="ml-4">모집인원</label><span>${pPage.capacity }명</span></div>
							<div><label class="ml-4">기간</label><span>${pPage.formedAllDate }</span></div>
							<div><label class="ml-4">사용언어</label><span>${pPage.languages }</span></div>
						</div>
						<hr>
						<div id="pBody">
							<div><p>${pPage.contents }</p></div>
							
							<div><label class="ml-4">연락처</label><span>${pPage.phone }</span></div>
							<div><label class="ml-4">메일주소</label><span>${pPage.email }</span></div>
							
							<c:if test="${pPage.writer == sessionScope.loginInfo}">
								<div class="text-center checkBtn">
									<button type="button" class="btn btn-warning">신청내역
										<c:if test="${pPage.applyCount>0 }">
					  						<span class="pApply font-weight-bold">${pPage.applyCount }</span>
					  					</c:if>
									</button>
									<button type="button" class="btn btn-success">모집완료처리</button>
								</div>
							</c:if>
							
							
							
							<c:if test="${pPage.writer != sessionScope.loginInfo}">
								<div class="text-center applyBtn">
									<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">신청하기</button>
								</div>
							</c:if>
							
							
							<div id="advBox"></div>
							
							
							<c:if test="${comments.size()>0 }">
								<c:forEach items="${comments }" var="c">
									${c.contents }<br>
								</c:forEach>
							</c:if>
							
							<div id="pCoInput" class="row">
								<div class="col-9 col-lg-10"><textarea class="form-control" placeholder="댓글 내용을 입력해주세요"></textarea></div>
								<div class="col-3 col-lg-2">
									<div class="row">
										<div class="col-12">
											<button type="button" class="btn btn-secondary" style="margin-bottom:10px;">취소</button>
										</div>										
									</div>
									<div class="row">
										<div class="col-12">
											<button type="button" class="btn btn-primary">작성</button>
										</div>										
									</div>								
		        				</div>
							</div>
						</div>
					</c:if>
				</div>
				<div id="pageFooter">
					<span><a class="btn btn-danger" href="#" role="button">게시글 신고</a></span>
					<span class="float-right">
						<c:if test="${pPage.writer == sessionScope.loginInfo}">
							<a class="btn btn-info" href="#" role="button">수정</a>
							<a class="btn btn-info" href="#" role="button">삭제</a>
						</c:if>
						<a class="btn btn-secondary" href="/project/list" role="button">목록</a>
					</span>
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
        
        
        
        
        <!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">프로젝트 신청</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		      
		      	<div class="row">
					<div class="col-4"><label class="aItem">사용 가능 언어</label><label class="star">*</label></div>
					<div class="col-7"><input type="text" class="form-control" id="email"></div>
				</div>
				<div class="row">
					<div class="col-4"><label class="aItem">성별</label><label class="star">*</label></div>
					<div class="col-7 genderRadio">
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="gender" id="male" value="male">
						  <label class="form-check-label" for="male">남</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="gender" id="female" value="female">
						  <label class="form-check-label" for="female">여</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="gender" id="none" value="none">
						  <label class="form-check-label" for="none">비공개</label>
						</div> 					  
					</div>
					
				</div>
				<div class="row">
					<div class="col-4"><label class="aItem">나이</label><label class="star">*</label></div>
					<div class="col-4">
						<select class="custom-select">
							<option selected>선택</option>
						    <option value="1">10대</option>
						    <option value="2">20대</option>
						    <option value="3">30대</option>
						    <option value="4">40대 이상</option>
						    <option value="0">비공개</option>
						</select>
					</div>
				</div>							
				<div class="row">
					<div class="col-4"><label class="aItem">재직여부</label><label class="star">*</label></div>
					<div class="col-7 workInRadio">
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="workIn" id="Y" value="Y">
						  <label class="form-check-label" for="Y">재직</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="workIn" id="N" value="N">
						  <label class="form-check-label" for="N">비재직</label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-4"><label class="aItem">메일주소</label></div>							
					<div class="col-7"><input type="email" class="form-control" id="email"></div>
				</div>
				<div class="row">
					<div class="col-12"><label class="aItem">하고 싶은 말</label></div>
					<div class="col-12" id="aContentsInput"><textarea class="form-control" style="height:100px;" placeholder="내용을 입력해주세요"></textarea></div>
				</div>						
		      
		      
		      		       
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		        <button type="button" class="btn btn-primary">신청</button>
		      </div>
		    </div>
		  </div>
		</div>
</body>
</html>