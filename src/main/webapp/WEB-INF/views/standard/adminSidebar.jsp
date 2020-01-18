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
					<li id="monitoring"><a href="${pageContext.request.contextPath }/admin/main"><i class="ti-dashboard"></i><span>모니터링</span></a></li>
					
					<li id="notice"><a href="${pageContext.request.contextPath }/admin/noticeList"><i class="ti-announcement"></i><span>공지사항</span></a></li>
					
					<li id="member"><a href="javascript:void(0)" aria-expanded="true"><i class="ti-user"></i><span>회원관리</span></a>
						<ul class="collapse">
							<li id="allMember"><a href="${pageContext.request.contextPath }/admin/memberList">회원 관리</a></li>
							<li id="outMember"><a href="${pageContext.request.contextPath }/admin/forcedOutList">강제 탈퇴 계정 관리</a></li>
						</ul>
					</li>

					<li id="report"><a href="${pageContext.request.contextPath }/report/reportList"><i class="ti-target"></i><span>신고글 관리</span></a></li>

					<li id="board"><a href="javascript:void(0)" aria-expanded="true"><i class="ti-menu"></i><span>게시판관리</span></a>
						<ul class="collapse">
							<li id="bamboo"><a href="${pageContext.request.contextPath }/adBoard/bambooList">대나무숲</a></li>
							<li id="cohow"><a href="${pageContext.request.contextPath }/adBoard/cohowList">Code-How</a></li>
							<li id="industry"><a href="${pageContext.request.contextPath }/adBoard/industryList">업계현황</a></li>
							<li id="itnews"><a href="${pageContext.request.contextPath }/adBoard/itnewsList">IT뉴스</a></li>
							<li id="project"><a href="${pageContext.request.contextPath }/adBoard/projectList">프로젝트</a></li>
							<li id="guest"><a href="${pageContext.request.contextPath }/adBoard/guestBookList">P-log 방명록</a></li>
						</ul>
					</li>

					<li id="inquiry"><a href="${pageContext.request.contextPath }/admin/inquiryList"><i class="ti-help"></i><span>일대일문의</span></a></li>
					<li id="modify"><a href="${pageContext.request.contextPath }/admin/modifyForm"><i class="ti-face-smile"></i><span>정보변경</span></a></li>
				</ul>
			</nav>
		</div>
	</div>
</div>