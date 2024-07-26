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

    /* 이메일찾기비밀번호찾기 section */

    section
    {
        padding-top: 90px;
        display: flex;
        justify-content: center;
    }

    .sectionInnerFE
    {
        min-width: 1200px;
        margin: 136px 0;
    }

    .sectionTitleFE 
    {
        text-align: center;
    }

    .sectionTitleFE a
    {
        font-size: var(--font-size24);
        color: var(--color-black);
        margin: 0 35px;
    }

    .sectionTitleFE a.findPassword
    {
        color: var(--color-gray);
    }
    .sectionInnerWrapperFE
    {
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 40px;  
        margin-top: 48px;
    }

    .sectionInnerWrapperFP
    {
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 40px;  
    }

    .sectionInnerConFE 
    {
        width: 50%;
        padding: 40px;
        border: 1px solid var(--input-gray);
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        border-radius: 10px;
    }

    .sectionInnerConFP
    {
        display: none;
        width: 50%;
        padding: 40px;
        border: 1px solid var(--input-gray);
        justify-content: center;
        align-items: center;
        flex-direction: column;
        border-radius: 10px;
    }

    .sectionInnerConFP.active
    {
        display: flex;
    }

    .sectionInnerWrapperFP.active
    {
        margin-top: 48px;
    }

    .sectionInnerConFE .individual , .sectionInnerConFP .individual
    {
        width: 120px;
        height: 120px;
        margin: 20px auto;
    }

    .sectionInnerConFE .company , .sectionInnerConFP .company
    {
        width: 120px;
        height: 120px;
        margin: 20px auto;
    }


    .sectionInnerConFE .txt , .sectionInnerConFP .txt
    {
        text-align: center;
        font-size: var(--font-size24);
        font-weight: 500;
    }

    .sectionInnerConFE button.join , .sectionInnerConFP button.join
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

    .sectionTitleFE a.active
    {
        color: var(--color-black);
        padding-bottom: 4px;
        border-bottom: 3px solid var(--main-color);
    }

    .sectionTitleFE a
    {
        color: var(--color-gray);
    }
</style>
</head>
<body>
    <div class="container">
        <%@ include file="header.jsp" %>
        <section>            
            <div class="sectionInnerFE">
                <h3 class="sectionTitleFE">
                    <a href="#" id="findEmail" class="findEmail active">이메일 찾기</a>
                    <a href="#" id="findPassword" class="findPassword">비밀번호 찾기</a>
                </h3>
                <div id="FindE" class="sectionInnerWrapperFE">
                    <div class="sectionInnerConFE individual">
                        <div class="img"></div>
                        <img src="${pageContext.request.contextPath}/images/individual.svg" alt="#" class="individual">
                        <h3 class="txt">개인회원</h3>
                        <button class="join" onclick="location.href='findEmailIndividual'">이메일 찾기</button>
                    </div>
                    <div class="sectionInnerConFE company">
                        <div class="img"></div>
                        <img src="${pageContext.request.contextPath}/images/company.svg" alt="#" class="company">
                        <h3 class="txt">기업회원</h3>
                        <button class="join" onclick="location.href='findEmailCompany'">이메일 찾기</button>
                    </div>
                </div> <!--이메일 찾기 sectionInnerWrapperFE 끝-->
                <div id="FindPW" class="sectionInnerWrapperFP">
                    <div class="sectionInnerConFP individual">
                        <div class="img"></div>
                        <img src="${pageContext.request.contextPath}/images/individual.svg" alt="#" class="individual">
                        <h3 class="txt">개인회원</h3>
                        <button class="join" onclick="location.href='findPasswordIndividual'">비밀번호 찾기</button>
                    </div>
                    <div class="sectionInnerConFP company">
                        <div class="img"></div>
                        <img src="${pageContext.request.contextPath}/images/company.svg" alt="#" class="company">
                        <h3 class="txt">기업회원</h3>
                        <button class="join" onclick="location.href='findPasswordCompany'">비밀번호 찾기</button>
                    </div>
                </div> <!--비밀번호 찾기 sectionInnerWrapperFP 끝-->
            </div> <!--이메일 비밀번호 찾기 sectionInnerFE 끝-->
        </section>
        <%@ include file="footer.jsp" %>
    </div>    
</body>
</html>
<script>
    $(document).ready(function () {

        // 이메일찾기 비밀번호 찾기_개인 기업 탭 (하지수)
        
        $('#findEmail').click(function () {
            $('#findEmail').addClass('active');
            $('#findPassword').removeClass('active');
            $('#FindE').show();
            $('#FindPW').hide();
        });
        
        $('#findPassword').click(function () {
            $('#findPassword').addClass('active');
            $(".sectionInnerConFP").addClass('active');
            $(".sectionInnerWrapperFP").addClass('active');
            $('#findEmail').removeClass('active');
            $('#FindE').hide();
            $('#FindPW').show();
        });

    });
</script>