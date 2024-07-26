<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>네비게이션_개인</title>
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

	.container 
	{
	  display: flex;
	}

	/* 네비게이션 */
	.navigation
	{
	  position:relative;
	  width: 260px;
	  min-height: 100vh;
	  background: #fff;
	  overflow: hidden;
	  /*box-shadow: 0 5px 15px rgba(0,0,0,0.2);*/
	  transition: 0.5s;
	  padding: 1rem 0;
	  border-right: 1px solid var(--input-gray);
	}

	/* 로고 */

	.navigation .logo 
	{
	  list-style:none;
	  padding: 30px 20px;
	}

	.navigation .logo a {
	  color: var(--main-color);
	  position: relative;
	  width: 100%;
	  display: flex;
	  text-decoration: none;
	  font-weight: 600;
	}

	/* 메뉴 */

	.navigation .navMenu {
	  position: relative;
	  height: calc( 100vh - 163px);
	}

	.navigation ul
	{
	  position: absolute;
	  top:0;
	  left:0;
	  width: 100%;
	}

	.navigation ul li
	{
	  position:relative;
	  list-style:none;
	  width: 100%;
	}

	.navigation ul li.active
	{
	  background:rgba(255,165,0,0.3);
	}

	.navigation ul li a
	{
	  position:relative;
	  display:block;
	  width: 100%;
	  display:flex;
	  color: var(--color-black);
	  font-weight: 500;
	  font-size: 16px;
	}

	.navigation ul li a .icon
	{
	  position: relative;
	  display:block;
	  min-width: 80px;
	  height:60px;
	  line-height: 60px;
	  text-align: center;
	}

	.navigation ul li a .icon i
	{
	  font-size: var(--font-size24);
	}

	.navigation ul li a .title
	{
	  position:relative;
	  display:block;
	  height: 60px;
	  line-height: 60px;
	  white-space: nowrap;
	}

	/* 네비게이션 옆 컨텐츠 영역 */
	.mainContent 
	{
	  width: calc( 100% - 260px);
	  min-height: 100vh;
	}

	/* 헤더 */
	header 
	{
	    width: 100%;
	    height: 90px;
	    border-bottom: 1px solid var(--input-gray);
	    padding: 0 40px;
	    display: flex;
	    align-items: center;
	    box-sizing: border-box;
	}
	/* 헤더 아이디 영역 */
	header .userWrapper
	{
	  display: flex;
	  padding: 0 15px;
	  white-space: nowrap;
	  margin-left: auto;
	  width: 140px;
	  align-items: center;
	}
	header .userWrapper img
	{
	  margin-right: 12px;
	  width: 36px;
	  height: 36px;
	  border-radius: 50%;   
	}

	header .userWrapper h4.name 
	{
	  font-size: var(--font-size14);
	  margin-right: 12px;
	}
</style>	
</head>
<body>
	<div class="navigation">

	    <div class="logo">
	        <a href="main">
	            <img src="images/logo.svg" alt="#">
	        </a>
	        <!-- <h1>
	            <span class="las la-otter"></span>
	            Madia-Study-App
	        </h1> -->
	    </div> <!-- nav-brand 끝-->
	
	    <div class="navMenu">
	        <ul>
	            <li>
	                <a href="resumeList">
	                    <span class="icon">
	                        <i class="fa-regular fa-pen-to-square"></i>
	                    </span>
	                    <span class="title">이력서관리</span>
	                </a>
	            </li>
	            <li>
	                <a href="joinManagementList">
	                    <span class="icon">
	                        <i class="fa-regular fa-file-lines"></i>
	                    </span>
	                    <span class="title">입사지원관리</span>
	                </a>
	            </li>
	            <li>
	                <a href="jobOffer">
	                    <span class="icon">
	                        <i class="fa-regular fa-envelope"></i>
	                    </span>
	                    <span class="title">받은제안</span>
	                </a>
	            </li>
	            <li>
	                <a href="recentNotice">
	                    <span class="icon">
	                        <i class="fa-solid fa-list-check"></i>
	                    </span>
	                    <span class="title">최근 본 공고</span>
	                </a>
	            </li>
	            <li>
	                <a href="noticeScrap">
	                    <span class="icon">
	                        <i class="fa-regular fa-bookmark"></i>
	                    </span>
	                    <span class="title">스크랩</span>
	                </a>
	            </li>
	            <li>
	                <a href="interComlist">
	                    <span class="icon">
	                        <i class="fa-regular fa-building"></i>
	                    </span>
	                    <span class="title">관심기업</span>
	                </a>
	            </li>
	            <li>
	                <a href="userInfo">
	                    <span class="icon">
	                        <i class="fa-regular fa-address-card"></i>
	                    </span>
	                    <span class="title">회원정보수정</span>
	                </a>
	            </li> 
	            <li>
	                <a href="individualWithdraw">
	                    <span class="icon">
	                        <i class="fa-regular fa-trash-can"></i>
	                    </span>
	                    <span class="title">회원탈퇴</span>
	                </a>
	            </li>                    
	        </ul>
	    </div>  <!-- nav-menu 끝-->    
	</div> <!-- navigation 끝-->
</body>
</html>
<script>
	/*
        2024-06-25 이재원 
        메뉴 눌렀을 때 메뉴 활성화 : active
    */
    $('.navMenu ul li').click(function(){
        $(this).addClass('active');
        $('.navMenu ul li').not(this).removeClass('active');
    });
	
</script>