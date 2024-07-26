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
  box-shadow: 0 5px 15px rgba(0,0,0,0.2);
  transition: 0.5s;
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

/* 드롭다운 메뉴 */
.dorpdowmMain
	{
	display: flex;
	}

	.dropdown
	{
	display: flex;
	align-items: center;
	}

	.dropdownSub
	{
	display: flex;
	}

	.dropdownContent 
	{
	position: absolute;
	display: none;
	text-align: center;
	margin-top: 20px;
	width: 160px;
	background-color: var(--color-white);
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0,0,0,0.2);
	right: 11px;
	}

	.dropdownContent a 
	{
	color: var(--color-black);
	padding: 12px;
	text-decoration: none;
	display: block;
	font-size: var(--color-black);
	}

  


/* 헤더 */
.mainContent header 
{
  height: 90px;
  border-bottom: 1px solid var(--input-gray);
  padding: 0 40px;
  display: flex;
  align-items: center;
}

/* 헤더 아이디 영역 */
.mainContent header .userWrapper
{
  display: flex;
  padding: 0 15px;
  white-space: nowrap;
  margin-left: auto;
  width: 140px;
  align-items: center;
}

.mainContent header .userWrapper img
{
  margin-right: 12px;
  width: 36px;
  height: 36px;
  border-radius: 50%;   
}

.mainContent header .userWrapper h4.name 
{
  font-size: var(--font-size14);
  margin-right: 12px;
}








/*메인콘텐츠 전체*/

.sectionInner
{
  display: flex;
  justify-content: center;
  min-width: 1200px;
}

/*회원정보수정 타이틀*/

.infoTitle
{
  font-size: var(--font-size32);
  margin-top: 70px;
}

/*회원사진 + 테이블*/
.infoConWrap
{
  display : flex;
  gap: 50px;
  margin-top: 80px;
  
  
}

/*회원사진*/
.infoCon img
{
  width: 100px;
}


/*회원정보 테이블*/


.userInfoTable
{
  border: 1px solid var(--input-gray);
  border-radius: 10px;
  box-sizing: border-box;
  border-collapse: collapse;
  font-size: var(--font-size16);
}
.userInfoTable th
{
  width: 300px;
  background-color: var(--button-gray);
}

.userInfoTable td
{
  width: 750px;
}
.userInfoTable th, td
{
  border-bottom: 1px solid var(--input-gray);
  padding: 0 20px;
  text-align: start;
  height: 60px;
}

/*희망직무, 기술스택 버튼들 */
.userInfoTable .disF .position 
{
  display: flex;
  align-items: center;
  gap: 20px;
  width: inherit;
}

.userInfoTable .disF .stack 
{
  display: flex;
  align-items: center;
  gap: 20px;
  width: inherit;
}

.userInfoTable td .Btn
{
  background-color: var(--button-gray);
  border: 1px solid var(--input-gray);
  font-size: 16px;
  color: var(--color-gray);
  /* width: 100px; */
  height: 44px;
  padding: 10px;
  border-radius: 6px;
}


/*수정버튼*/
.modifyBtn
{
  display: flex;
  justify-content: center;
}
.buttonModify
{
  background-color: #999;
  border: none;
  /* border: 1px solid var(--input-gray); */
  border-radius: 6px;
  width: 240px;
  height: 56px;
  margin: 40px auto;
  font-size: 16px;
  color: var(--color-white);
  cursor: pointer;
}



   
</style>
</head>
<body>
    <div class="container">
		<%@ include file="nav_individual.jsp" %>
		<div class="mainContent">        
      <header>
        <div class="userWrapper">
            <img src="images/people.svg"alt="">
            <div class="dorpdowmMain">
                <div class="dropdown">
                    <div class="dropdownSub" id="dropdownSub">
                        <h4 class="name" name="user_name" style="cursor: pointer;">${login_name}</h4>
                        <div class="dropdownContent" id="dropdownContent">
                            <a href="userInfo"><div>개인 정보 관리</div></a>
                            <a href="logout"><div>로그아웃</div></a>
                        </div> <!-- dropdownContent 끝-->
                        <span class="icon">
                            <i id="iconDown" class="fa-solid fa-caret-down" style="display: block; cursor: pointer;"></i>
                            <i id="iconUp" class="fa-solid fa-caret-up" style="display: none; cursor: pointer;"></i>
                        </span>
                    </div> <!--dropdownSub 끝-->
                </div> <!--dropdown 끝-->
            </div><!--dropdownMain 끝-->
         </div>
      </header>   

            <section>
                <div class="sectionInner">
                    <form method="post" id="userInfoForm" action="modifyPage">
                        <div class="infoWrap">
                            <h2 class="infoTitle">회원 정보 수정</h2>
                            <div class="infoConWrap">
                                <div class="infoCon left">
                                    <img src="images/people.svg" alt="#" class="resumeImage">
                                </div>
                                <div class="infoCon right">
                                    <table class="userInfoTable">	
                                        <tr>
                                            <th>이름</th>
                                            <td>${userInfo.user_name}</td>
                                        </tr>
                                        <tr>
                                          <th>이메일</th>
                                          <td>${userInfo.user_email}</td>
                                        </tr>
                                        <tr>
                                            <th>생년월일</th>
                                            <td>${userInfo.user_birthdate}</td>
                                        </tr>
                                        <tr>
                                            <th>성별</th>
                                            <td>${userInfo.user_gender}</td>  
                                        </tr>
                                        <tr>
                                            <th>휴대폰</th>
                                            <td>${userInfo.user_tel}</td>
                                        </tr>
                                        <tr>
                                          <th>희망직무</th>
                                          <td class="disF">
                                              <div class="position" id="position">
												<c:forEach items="${jobInfo}" var="dto">
													<input type="button" class="Btn" value="${dto.job_name}">
												</c:forEach>
                                              </div>
                                          </td>
                                        </tr>
                                        <tr>
                                            <th>기술스택</th>
                                            <td class="disF">
                                                <div class="stack" id="stack">
													<c:forEach items="${stackInfo}" var="dto">
														<input type="button" class="Btn" value="${dto.stack_name}">
													</c:forEach>  
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                          <th>희망근무지역</th>
                                          <td>${userInfo.user_location} ${userInfo.user_location2}</td>
                                      </tr>
                                    </table>
                                </div><!-- infoCon right 끝 -->
                            </div> <!-- infoConWrap 끝-->
                            <div class="modifyBtn">
                                <button class="buttonModify">수정</button>
                                <!-- <button class="buttonModify" onclick="location.href='/modifyPage'">수정</button> -->
                            </div>
                        </div> <!--infoWrap끝 : 개인정보  -->
                    </form>
                </div> <!-- sectionInner 끝 : 전체 1200 영역-->
            </section>
        </div><!-- mainContent-->
    </div>    
	<%@ include file="footer.jsp" %>
</body>
</html>
<script>
  // 드롭다운 메뉴 (하지수)

  function dropdown() {
      let click = document.getElementById("dropdownContent");
      let iconDown = document.getElementById("iconDown");
      let iconUp = document.getElementById("iconUp");

      if (click.style.display === "none" || click.style.display === "") {
          click.style.display = "block";
          iconDown.style.display = "none";
          iconUp.style.display = "block";
      } else {
          click.style.display = "none";
          iconDown.style.display = "block";
          iconUp.style.display = "none";
      }
  }
  document.getElementById("dropdownSub").addEventListener("click", dropdown); // 드롭다운 메뉴 끝
</script>