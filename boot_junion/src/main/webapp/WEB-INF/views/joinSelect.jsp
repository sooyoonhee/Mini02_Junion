<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
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

	/* 회원가입 section */

	section
	{
		padding-top: 90px;
	    display: flex;
	    justify-content: center;
	}

	.sectionInnerJoin
	{
	    min-width: 1200px;
	    margin: 136px 0;
	}

	.sectionTitleJoin
	{
	    text-align: center;
	}

	.sectionTitleJoin a
	{
	    font-size: var(--font-size32);
	    color: var(--color-black);
	}

	.sectionInnerWrapperJoin 
	{
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    gap: 40px;  
	    margin-top: 40px; 
	}

	.sectionInnerConJoin
	{
	    width: 50%;
	    padding: 40px;
	    border: 1px solid var(--input-gray);
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    flex-direction: column;
	}

	.sectionInnerConJoin .individual 
	{
	    width: 120px;
	    height: 120px;
	    margin: 20px auto;
	}

	.sectionInnerConJoin .company 
	{
	    width: 120px;
	    height: 120px;
	    margin: 20px auto;
	}


	.sectionInnerConJoin .txt 
	{
	    text-align: center;
	    font-size: var(--font-size24);
	    font-weight: 500;
	}

	.sectionInnerConJoin button.join 
	{
	    width: 320px;
	    height: 48px;
	    background-color: var(--main-color);
	    border:0;
	    color: var(--color-white);
	    font-size: var(--font-size16);
	    margin-top: 40px;
	    border-radius: 6px;
	    cursor: pointer;
	}
</style>
</head>
<body>
	<div class="container">
		<%@ include file="header.jsp" %>
		<section>            
			<div class="sectionInnerJoin">
    			<h3 class="sectionTitleJoin">
		           <a href="#">회원가입</a>
		       </h3>
       		   <div class="sectionInnerWrapperJoin">
		           <div class="sectionInnerConJoin individual">
		               <div class="img"></div>
		               <img src="images/individual.svg" alt="#" class="individual">
		               <h3 class="txt">개인회원</h3>
		               <button class="join" onclick="location.href='joinIndividual'">회원가입</button>
		           </div>
		           <div class="sectionInnerConJoin company">
		               <div class="img"></div>
		               <img src="images/company.svg" alt="#" class="company">
		               <h3 class="txt">기업회원</h3>
		               <button class="join" onclick="location.href='joinCompany'">회원가입</button>
		           </div>
       			</div> <!--회원가입 sectionInnerWrapperJoin 끝-->
			</div> <!--회원가입 sectionInnerJoin 끝-->
   		</section>
		<%@ include file="footer.jsp" %>	   
	</div>
</body>
</html>
<script>
	$(document).ready(function()
	{

	});
</script>