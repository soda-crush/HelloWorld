<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World!</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/mainBase.css">
<link rel="stylesheet" type="text/css" href="/css/font-awesome/css/font-awesome.css">

	<style>
            h1{
                text-align: center;
                padding-top: 50px;
                padding-bottom: 50px;
            }
            ul{
                background-color: lightgray;
                font-size: 13px;
            }
            .container{
                margin:auto;
                background-color: #efefef;
            }
            .card{
                margin-top:20px;
            }
            .myprofile{
                float: left;
                margin-top: 20px;
                margin-bottom: 30px;
            }
            #mycard{
                width:200px;
                float:none;
                display:flex;
                margin: auto;
                align-items:center;
            }
            .cardwrap{
                float:left;
            }
            .card-img-top{
                width: 80%;
                margin:10%;
            }
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

            
            <div class="container">
				<h1> Programming-Log</h1>
	            <ul class="nav nav-tabs d-none d-sm-block">
	                <li class="nav-item">
	                    <a class="nav-link" href="#">내 포트폴리오</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="#">내 지식인</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="#">내 스크랩</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="#">내 팀 프로젝트</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link active" href="#">방명록</a>
	                </li>
	            </ul>
	            <ul class="nav nav-tabs d-sm-none">
	                <li class="nav-item">
	                    <a class="nav-link" href="#" style="padding:7px;">내 포트폴리오</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="#" style="padding:7px;">내 지식인</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="#" style="padding:7px;">내 스크랩</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="#" style="padding:7px;">내 팀 프로젝트</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link active" href="#" style="padding:7px;">방명록</a>
	                </li>
	            </ul>
	            <div class="row">
	                <div class="col-12 col-md-4 col-lg-3 myprofile">
	                    <div class="card" id="mycard">
	                        <img src="lion.png" class="card-img-top" alt="..." style="width: 170px;height: 170px;margin:15px;">
	                        <div class="card-body">
	                            <h3 class="card-title" style="text-align: center;">라이언 님</h3>
	                            <p class="card-text" style="text-align: center;">point : 12,345</p>
	                        </div>
	                    </div>
	                </div>
	                <div class ="col-12 col-md-8 col-lg-9 wrapportfolio">
	                    <div class="cardwrap col-6 col-xl-4">
	                        <div class="card" >
	                            <img src="success3.gif" class="card-img-top" alt="...">
	                            <div class="card-body" style="padding: 5px;">
	                                <h5 class="card-title">포트폴리오 1</h5>
	                                <p class="card-text">~~~에서 ~~~를 구현한 ~~~입니다.</p>
	                                <a href="#" class="btn btn-primary">이동하기</a>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="cardwrap col-6 col-xl-4">
	                        <div class="card" >
	                            <img src="success3.gif" class="card-img-top" alt="...">
	                            <div class="card-body" style="padding: 5px;">
	                                <h5 class="card-title">포트폴리오 1</h5>
	                                <p class="card-text">~~~에서 ~~~를 구현한 ~~~입니다.</p>
	                                <a href="#" class="btn btn-primary">이동하기</a>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="cardwrap col-6 col-xl-4">
	                        <div class="card" >
	                            <img src="success3.gif" class="card-img-top" alt="...">
	                            <div class="card-body" style="padding: 5px;">
	                                <h5 class="card-title">포트폴리오 1</h5>
	                                <p class="card-text">~~~에서 ~~~를 구현한 ~~~입니다.</p>
	                                <a href="#" class="btn btn-primary">이동하기</a>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="cardwrap col-6 col-xl-4">
	                        <div class="card" >
	                            <img src="success3.gif" class="card-img-top" alt="...">
	                            <div class="card-body" style="padding: 5px;">
	                                <h5 class="card-title">포트폴리오 1</h5>
	                                <p class="card-text">~~~에서 ~~~를 구현한 ~~~입니다.</p>
	                                <a href="#" class="btn btn-primary">이동하기</a>
	                            </div>
	                        </div>
	                    </div>
	                </div>
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
</body>
</html>
