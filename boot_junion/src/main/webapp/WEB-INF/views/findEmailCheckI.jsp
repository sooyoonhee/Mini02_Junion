<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
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

    /* 이메일찾기_조회_개인 section */

	section
	{
		padding-top: 90px;
		display: flex;
		justify-content: center;
	}

	.sectionInnerFEIC
	{
		min-width: 1200px;
		margin: 136px 0;
	}

	.sectionConFEIC 
	{
	display: grid;
	justify-content: center;
	}

	.sectionConInnerFEIC
	{
		margin-bottom: 15px;
	}

	.sectionConInnerFEIC h2
	{
		font-size: var(--font-size24);
	}

	.sectionInnerWrapperFEIC
	{
		width: 678px;
		padding: 20px;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		border-radius: 10px;

		align-items: center;
		margin-top: 15px; 
		padding-top: 40px;
		padding-bottom: 50px;
		margin-bottom: 40px;
	}

	.sectionInnerWrapperFEIC h3
	{
		font-size: var(--font-size16);
		margin-left: 20px;
	}

	.sectionInnerWrapperFEIC li
	{
		list-style: circle;
		margin-top: 15px;
		margin-left: 37px;
		color: var(--color-gray);
	}

	.buttonRe
	{
		display: flex;
	}

	.buttonRePW
	{
		width: 250px;
		height: 48px;
		background-color: var(--color-white);
		border:solid 1px var(--input-gray);
		color: var(--color-gray);
		font-size: var(--font-size16);
		border-radius: 6px;
		margin: auto ;
		cursor: pointer;
	}

	.buttonLogin
	{
		width: 250px;
		height: 48px;
		background-color: var(--main-color);
		border:0;
		color: var(--color-white);
		font-size: var(--font-size16);
		border-radius: 6px;
		margin-right: auto ;
		cursor: pointer;
	}


   
</style>
</head>
<body>
    <div class="container">
        <%@ include file="header.jsp" %>
        <section>
            <div class="sectionInnerFEIC">  
                <div class="sectionConFEIC">
                    <div class="sectionConInnerFEIC">
                        <h2>이메일 조회</h2>
                    </div> <!-- 이메일찾기_조회_개인 sectionConInnerFEIC 끝-->
                    <div class="sectionInnerWrapperFEIC">
                        <h3>입력된 정보로 등록된 이메일</h3>
                        <ul>
							<c:forEach var="userEmail" items="${userFindEmail}">
								  
								  <li>${userEmail} </li><br/>
							
							</c:forEach>
						</ul>
                    </div> <!-- 이메일찾기_조회_개인 sectionInnerWrapperFEIC 끝 -->
					<div class="buttonRe">
						<button class="buttonRePW" type="button" onclick="location.href='findPasswordIndividual'">비밀번호 찾기</button>
						<button class="buttonLogin" type="button" onclick="location.href='login'">로그인 하기</button>
					</div>
                </div> <!-- 이메일찾기_조회_개인 sectionConFEIC 끝-->
            </div> <!-- 이메일찾기_조회_개인 sectionInnerFEIC 끝 -->
        </section>
        <%@ include file="footer.jsp" %>
    </div>    
</body>
</html>