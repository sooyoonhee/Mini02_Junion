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

    /* 로그인 section */

    section
    {
        padding-top: 90px;
        display: flex;
        justify-content: center;
    }

    .sectionInner
    {
        min-width: 1200px;
        margin: 136px 0;
        display: grid;
        justify-content: center;
    }

    .sectionTitleLogin
    {
        text-align: center;
    }

    .sectionTitleLogin a
    {
        font-size: var(--font-size24);
        color: var(--color-black);
        margin: 0 35px;
    }

    .sectionTitleLogin .tabC
    {   
        border: 0;
        background-color: transparent;
        color: var(--color-gray);
    }

    .sectionInnerWrapperLoginI 
    {
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 40px;  
        margin-top: 40px; 
    }

    .sectionInnerWrapperLoginI .inputLogin
    {
        font-size: var(--font-size16);
        color: var(--color-black);
        margin-top: 24px;
    }

    .sectionInnerWrapperLoginI .inputJoin
    {
        font-size: var(--font-size16);
        width: 500px;
        height: 56px;
        border-radius: 6px;
        box-sizing: border-box;
        border: solid 1px var(--input-gray);
        padding-left: 16px;
    }

    .sectionInnerWrapperLoginI .buttonJoin
    {
        width: 500px;
        height: 48px;
        background-color: var(--main-color);
        border:0;
        color: var(--color-white);
        font-size: var(--font-size16);
        margin-top: 16px;
        border-radius: 6px;
        margin-bottom: 22px;
        cursor: pointer;
    }

    .sectionInnerWrapperLoginC 
    {
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 40px;  
        margin-top: 40px; 
    }

    .sectionInnerWrapperLoginC .inputLogin
    {
        font-size: var(--font-size16);
        color: var(--color-black);
        margin-top: 24px;
    }

    .sectionInnerWrapperLoginC .inputJoin
    {
        font-size: var(--font-size16);
        width: 500px;
        height: 56px;
        border-radius: 6px;
        box-sizing: border-box;
        border: solid 1px var(--input-gray);
        padding-left: 16px;
    }

    .sectionInnerWrapperLoginC .buttonJoin
    {
        width: 500px;
        height: 48px;
        background-color: var(--main-color);
        border:0;
        color: var(--color-white);
        font-size: var(--font-size16);
        margin-top: 16px;
        border-radius: 6px;
        margin-bottom: 22px;
        cursor: pointer;
    }

    .sectionFind
    {
        display: flex;
        justify-content:center ;
    }

    .sectionFind a
    {
        font-size: var(--font-size14);
        color: var(--color-gray);
        padding: 0 20px;
    }

    .sectionTitleLogin a.active 
    {
        color: var(--color-black);
        padding-bottom: 4px;
        border-bottom: 3px solid var(--main-color);
    }
    .sectionTitleLogin a 
    {
        border: 0;
        background-color: transparent;
        color: var(--color-gray);
        font-size: var(--font-size24);
        margin: 0 35px;
        cursor: pointer;
    }

    .sectionInnerWrapperLoginI.active, .sectionInnerWrapperLoginC.active 
    {
        display: flex;
    }
</style>

</head>
<body>
	<div class="container">
        <%@ include file="header.jsp" %>
        <section>
            <div class="sectionInner">
                <div class="sectionTitleLogin">
                    <a href="#" class="tabI active">개인회원</a>
                    <a href="#" class="tabC">기업회원</a>
                    <!-- <button id="tabI" class="active">개인회원</button>
                    <button id="tabC">기업회원</button> -->
                </div> <!--로그인 sectionTitleLogin (개인/기업 탭) 끝-->
                <div id="LoginI" class="sectionInnerWrapperLoginI">
                    <form method="post" action="/login_ynI">
                        <div class="inputLogin">
                            <input type="email" id="user_email" class="inputJoin" name="user_email" placeholder="이메일" required>
                        </div>
                        <div class="inputLogin">
                            <input type="password" id="user_pw" class="inputJoin" name="user_pw" placeholder="비밀번호" required>
                        </div>
                        <div class="inputLogin">
                            <button class="buttonJoin" type="submit">로그인</button>
                        </div>
                    </form>
                </div> <!--로그인 sectionInnerWrapperLoginI (개인로그인) 끝-->
                <div id="LoginC" class="sectionInnerWrapperLoginC" style="display: none;">
                    <form method="post" action="/login_ynC">
                        <div class="inputLogin">
                            <input type="email" id="com_email" class="inputJoin" name="com_email" placeholder="기업 이메일" required>
                        </div>
                        <div class="inputLogin">
                            <input type="password" id="com_pw" class="inputJoin" name="com_pw" placeholder="비밀번호" required>
                        </div>
                        <div class="inputLogin">
                            <button class="buttonJoin" type="submit">로그인</button>
                        </div>
                    </form>
                </div> <!--로그인 sectionInnerWrapperLoginC (기업로그인) 끝)-->
                <div class="sectionFind">
                    <a href="findEmail">이메일 찾기</a>
                    <a href="findPassword">비밀번호 찾기</a>
                </div>
            </div> <!-- 로그인 sectionInner끝-->
        </section>
        <%@ include file="footer.jsp" %>
    </div>

    <script>
        // 뒤로가기 눌렀을 때 input 정보 삭제 
        window.addEventListener('pageshow', function(event) {
            if (event.persisted) {
                document.getElementById('user_email').value = '';
                document.getElementById('user_pw').value = '';
                document.getElementById('com_email').value = '';
                document.getElementById('com_pw').value = '';
            }
        });
        
        // 개인, 기업회원 탭 눌렀을 때 input 정보 삭제
        function clearForm() {
            document.getElementById('user_email').value = '';
            document.getElementById('user_pw').value = '';
            document.getElementById('com_email').value = '';
            document.getElementById('com_pw').value = '';
        }
    
        document.addEventListener('DOMContentLoaded', function() {
            var tabI = document.querySelector('.tabI');
            var tabC = document.querySelector('.tabC');
            if (tabI) {
                tabI.addEventListener('click', clearForm);
            }
            if (tabC) {
                tabC.addEventListener('click', clearForm);
            }
        });

    </script>
</body>
</html>
<script>

    $(document).ready(function () 
    {
        // 로그인_기업 개인 탭 (하지수)

        $(".tabI").click(function () {
            $(".tabI").addClass('active');
            $(".tabC").removeClass('active');
            $('#LoginI').show();
            $('#LoginC').hide();
        });

        $(".tabC").click(function () {
            $(".tabC").addClass('active');
            $(".tabI").removeClass('active');
            $('#LoginI').hide();
            $('#LoginC').show();
        });
        
    });

</script>
