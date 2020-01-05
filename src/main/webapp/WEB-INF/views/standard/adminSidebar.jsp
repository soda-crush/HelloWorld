<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="sidebar-menu">
	<div class="sidebar-header">
		<div class="logo">
			<a href="${pageContext.request.contextPath }/admin/main"><img src="${pageContext.request.contextPath }/adRsc/images/logo.png" alt="logo"></a>
		</div>
	</div>
	<div class="main-menu">
		<div class="menu-inner">
			<nav>
				<ul class="metismenu" id="menu">
					<li class="active"><a href="${pageContext.request.contextPath }/admin/main"><i class="ti-dashboard"></i><span>모니터링</span></a></li>

					<li><a href="javascript:void(0)" aria-expanded="true"><i class="ti-user"></i><span>회원관리</span></a>
						<ul class="collapse">
							<li><a href="${pageContext.request.contextPath }/admin/memberList">전체 회원 관리</a></li>
							<li><a href="${pageContext.request.contextPath }/admin/forcedOutList">강제 탈퇴 회원ID 관리</a></li>
						</ul>
					</li>

					<li><a href="javascript:void(0)" aria-expanded="true"><i class="ti-menu"></i><span>게시판관리</span></a>
						<ul class="collapse">
							<li><a href="#">대나무숲</a></li>
							<li><a href="#">코드지식인</a></li>
							<li><a href="#">업계현황</a></li>
							<li><a href="${pageContext.request.contextPath }/adBoard/projectList">프로젝트 모집</a></li>
						</ul>
					</li>

					<li><a href="${pageContext.request.contextPath }/admin/inquiryList"><i class="ti-help"></i><span>일대일문의</span></a></li>
					<li><a href="${pageContext.request.contextPath }/admin/modifyForm"><i class="ti-face-smile"></i><span>정보변경</span></a></li>
				</ul>
			</nav>
		</div>
	</div>
</div>