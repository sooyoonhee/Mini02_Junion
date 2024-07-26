<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Company_InfoUpdate</title>
<!--    <link rel="stylesheet" href="css/default.css">-->
<!--    <link rel="stylesheet" href="css/style.css">-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/company_InfoUpdate.css">
    <!-- import font-awesome, line-awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
    <!-- import pretendard font -->
    <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
    <!-- import js -->
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <script src="js/company_InfoUpdate.js"></script> 
<style>
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
</style>
</head>
<body>
<div class="container">
	<%@ include file="../nav_company.jsp" %>
    <div class="mainContent">
        <header>
            <div class="userWrapper">
                <img src="images/people.svg"alt="">
                <div class="dorpdowmMain">
                    <div class="dropdown">
                        <div class="dropdownSub" id="dropdownSub">
                            <h4 class="name" name="com_name" style="cursor: pointer;">${login_name}</h4>
                            <div class="dropdownContent" id="dropdownContent">
                                <a href="companyInfoManagement"><div>기업 정보 관리</div></a>
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
        <main>
            <div class="containe">
                
                
                <div class="toptitle">
                    <h3 class="toptitle1" style="font-size: var(--font-size32);" >기업 기본 수정</h3>
                    
                </div>
                     
				<form method="post" action="modify_Info">
                    <div class="tabCon detail">
                        <table class="tabCon" style="width:100%">
                            <input type="hidden" name="com_email" value="${companyInfo.com_email}">
                            <tr>
                                <th>기업이메일</th>
                                <!-- <td> <input type="textarea" class="modifytext" name="com_email" placeholder="이메일을 입력해주세요"> </td> -->
                                <td class="modifytext">${companyInfo.com_email}</td>
                            </tr>
                            <tr>
                                <th>사업자등록번호 </th>
                                <!-- <td><input type="textarea" class="modifytext" name="com_serial_number" placeholder="사업자등록번호를 입력해주세요"></td> -->
                                <td  class="modifytext">${companyInfo.com_serial_number}</td>
                            </tr>
                            <tr>
                                <th>인사담당자명</th>
                                <td><input type="text" class="modify" name="com_person" placeholder="이름을 입력해주세요" required></td>
                            </tr>
                            <tr>
                                <th>연락처</th>
                                <td><input type="text" class="modify" name="com_tel" placeholder="연락처를 입력해주세요" required></td>
                            </tr>
                            <tr>
                                <th>비밀번호</th>
                                <td><input type="text" class="modify" class="changepw"  placeholder="변경 확인을 위해 비밀번호를 입력해주세요" required></td>
                            </tr>
                        </table><!-- table끝 -->
                        
                    </div>
                    <div class="modify">
                        <input type="submit" value="수정완료" class="commodify">
                    </div>
      			</form>
            </div> <!-- containe끝 -->
        </main>
    
    </div> <!-- //main-content -->
</div>    
<%@ include file="../footer.jsp" %>
    
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