<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

        <!-- Modal -->
		<div class="modal fade" id="pApplyModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="pApplyModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="pApplyModalLabel">프로젝트 신청</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <form action="/project/apply/writeProc" method="post" id="applyFrm">
			      <div class="modal-body">		      
			      	<div class="row">
						<div class="col-4"><label class="aItem">사용 가능 언어</label><label class="star">*</label></div>
						<div class="col-7 pApplyInput"><input type="text" class="form-control form-control-sm" id="languages" name="languages"></div>
					</div>
					<div class="row">
						<div class="col-4"><label class="aItem">성별</label><label class="star">*</label></div>
						<div class="col-7 genderRadio pApplyInput">
							<div class="form-check form-check-inline pApplyInput">
							  <input class="form-check-input" type="radio" name="gender" id="male" value="M">
							  <label class="form-check-label" for="male">남</label>
							</div>
							<div class="form-check form-check-inline">
							  <input class="form-check-input" type="radio" name="gender" id="female" value="F">
							  <label class="form-check-label" for="female">여</label>
							</div>
							<div class="form-check form-check-inline">
							  <input class="form-check-input" type="radio" name="gender" id="none" value="N">
							  <label class="form-check-label" for="none">비공개</label>
							</div> 					  
						</div>
						
					</div>
					<div class="row">
						<div class="col-4"><label class="aItem">나이</label><label class="star">*</label></div>
						<div class="col-4 pApplyInput">
							<select class="form-control form-control-sm pSelect" name="age" id="age">
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
						<div class="col-7 workInRadio pApplyInput">
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
						<div class="col-7"><input type="email" class="form-control form-control-sm" id="email" name="email"></div>
					</div>
					<div class="row">
						<div class="col-12"><label class="aItem">하고 싶은 말</label></div>
						<div class="col-12 pApplyInput" id="aContentsInput">
							<textarea class="form-control form-control-sm" placeholder="내용을 입력해주세요" name="etc" style="height:100px;"></textarea>
							<input type=hidden name="projectSeq" value="${pPage.seq }">
							<input type=hidden name="leaderId" value="${pPage.id }">
						</div>
					</div>						
			      		       
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			        <button type="submit" class="btn btn-primary" id="applyBtn">신청</button>
			      </div>
		      </form>
		    </div>
		  </div>
		</div>