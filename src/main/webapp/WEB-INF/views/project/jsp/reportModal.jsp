<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

        <!-- Modal -->
		<div class="modal fade" id="reportModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="reportModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="reportModalLabel">게시글 신고</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <form method="post" id="reportFrm">
			      <div class="modal-body">		      
					<div class="row">
						<div class="col-12"><label class="rItem">신고사유</label></div>
						<div class="col-12" id="reportReasonBox">
							<textarea class="form-control form-control-sm" placeholder="신고사유를 작성해주세요" name="reason" id="reportReasonInput" style="height:100px;"></textarea>
							<input type=hidden name="boardSeq" value="${pPage.seq }">							
							<input type=hidden name="title" value="${pPage.title }">
						</div>
					</div>						
			      		       
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="reportCancelBtn">취소</button>
			        <button type="submit" class="btn btn-warning" id="reportConfirmBtn">신고</button>
			      </div>
		      </form>
		    </div>
		  </div>
		</div>