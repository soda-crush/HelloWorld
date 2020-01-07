<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Modal -->
<div class="modal fade" id="pApplyConfirmModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body text-center">
        <br><h4>신청이 <span style="color:limegreen;">완료</span>되었습니다!</h4>
        <span>팀장 승인여부는 <span style="font-weight: bold;">[P-log] > [프로젝트 참여 현황]</span>에서</span><br><span>확인하실 수 있습니다.</span><br><br>          
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" style="width: 100px;" data-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>