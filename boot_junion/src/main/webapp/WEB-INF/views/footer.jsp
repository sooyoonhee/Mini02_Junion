<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>푸터</title>
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

	/* Footer */
	footer 
	{
	    padding:50px 0;
	    border-top: 1px solid var(--border-color-gray);
	}

	.footerInner 
	{
	    margin:0 auto;
	    max-width: 1200px;
	    display: flex;    
	}

	.footerInner .f_conWrap 
	{
	    width: 50%;
	}

	.footerInner .left_conWrap .textWrap 
	{
	    font-size: var(--font-size14);
	    line-height: 24px;
	    margin-top: 20px;
	} 

	.footerInner .right_conWrap 
	{
	    text-align: right;
	}

	.footerInner .right_conWrap .textWrap 
	{
	    font-size: var(--font-size14);
	    line-height: 24px;
	}

	.footerInner .right_conWrap h3
	{
	    font-size:var(--font-size24);
	    font-weight: 500;
	    color: #222;
	    margin-bottom: 20px;
	}
</style>	
</head>
<body>
	<footer>
	    <div class="footerInner">
	        <div class="left_conWrap f_conWrap">
	            <h5 class="logo">
	                <a href="#">
	                    <img src="images/logo.svg" alt="#">
	                </a>
	            </h5>
	            <p class="textWrap">
	                부산광역시 부산진구 중앙대로 688 한준빌딩 2층<br>
	                대표이사 : 주니온<br>
	                사업자등록번호 : 123-45-67890 / 통신판매업신고 : 9999-12345호<br>
	                이메일 : abcde@naver.com
	            </p>
	        </div>
	        <div class="right_conWrap f_conWrap">
	            <h3>1234-5678</h3>
	            <p class="textWrap">                        
	                오전 9시 ~ 오후 6시(토요일, 공휴일 휴무)<br>
	                Copyright ⓒ JUNION ALL RIGHTS RESERVED.
	            </p>
	        </div>
	    </div>
    </footer>
</body>
</html>