<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>헤더</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
<!--<link rel="stylesheet" href="src/main/resources/static/css/style.css">-->
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<!-- import js -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<style>
	:root 
	{
	  /* 컬러 모음 */
	  --main-color:#FFA500;
	  --color-black: #111;
	  --color-white: #fff;
	  --color-gray: #787878;
	  --input-gray: #e5e5ec;
	  --button-gray: #f7f7f7;
	  --border-color-gray: #dadada;
	  --font-size32: 32px;
	  --font-size24: 24px;
	  --font-size16: 16px;
	  --font-size14: 14px;
	  --font-size12: 12px;
	}

	/* header  */
	header 
	{   
	    height: 90px;
	    border-bottom: 1px solid var(--border-color-gray);
		width: 100%;
		background-color: var(--color-white);
		position: fixed;
		z-index: 9;
	}

	.headerInner 
	{
	    margin: 0 auto;
	    max-width: 1200px;
	    display: flex;
	    align-items: center;
	    height: 100%;
	}

	.headerInner h5.logo 
	{
	    margin-right: 40px;
	    width: 120px;
	    height: 40px;
	    display: flex;
	    align-items: center;
	}

	.headerInner ul.menu 
	{
	    display: flex;
	    align-items: center;
	    height: 100%;
	    gap:40px;
	}

	.headerInner ul.menu li, .headerInner ul.rightMenu li 
	{
	    padding: 10px 20px;
	}

	.headerInner ul.menu li a, .headerInner ul.rightMenu li a 
	{
	    font-size: var(--font-size16);
	    color: var(--color-black);
	    font-weight: 500;
	}

	.rightMenu 
	{
	    margin-left: auto;
	    display: flex;
	}

	.headerInner ul.rightMenu li:first-child 
	{
	    margin-right:40px;
	}
	
	.rightMenu.mypage
	{	display: none;}
	
</style>	
</head>
<body>
	<header>
        <div class="headerInner">
            <h5 class="logo">
                <a href="main">
                    <img src="${pageContext.request.contextPath}/images/logo.svg" alt="#">
                </a>
            </h5>
            <ul class="menu">
                <li><a href="cardPageList">채용</a></li>
                <li><a href="jobpostingIndividualSupport">인재풀</a></li>
                <li><a href="comList">기업정보</a></li>
                <li><a href="boardList">커뮤니티</a></li>
                <!-- <li><a href="#">공지사항</a></li> -->
            </ul>
            <ul class="rightMenu">
                <li id="login"><a href="login">로그인</a></li>
                <li id="join"><a href="joinSelect">회원가입</a></li>
				<li id="mypage"><a id="mypageLink">마이페이지</a></li>
				<!-- <li class="mypage"><a href="#" onClick="mypage_check();">${login_name}</a></li>/ -->
				<li id="lonin_name">${login_name} 님</li>
				<li id="logout"><a href="logout">로그아웃</a></li>
            </ul>
        </div>            
    </header>
	<script>
		/*
	        2024-07-08 하지수 
	        로그인하면 마이페이지와 이름, 로그아웃 뜸
    	*/
		window.addEventListener('load', function() {
					var loginName = '${login_name}';
					if (loginName.trim() !== '') {
						document.getElementById('login').style.display = 'none';
						document.getElementById('join').style.display = 'none';
						document.getElementById('lonin_name').style.display = 'block';
						document.getElementById('mypage').style.display = 'block';
						document.getElementById('logout').style.display = 'block';
					} else {
						document.getElementById('login').style.display = 'block';
						document.getElementById('join').style.display = 'block';
						document.getElementById('lonin_name').style.display = 'none';
						document.getElementById('mypage').style.display = 'none';
						document.getElementById('logout').style.display = 'none';
					}
				});
				
				$(document).ready(function(){
				         var mypageLink = document.getElementById('mypageLink')
				         if('${login_usertype}'==1){
				            mypageLink.href='individualMain';
				         }else if('${login_usertype}'==2){
				            mypageLink.href='companyMain';
				         }
				      })

	</script>
</body>
</html>
