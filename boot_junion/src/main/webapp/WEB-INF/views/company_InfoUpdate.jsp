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
</head>
<body>
<div class="container">
    <div class="navigation">

        <div class="logo">
            <a href="#">
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
                    <a href="#">
                        <span class="icon">
                            <i class="fa-regular fa-pen-to-square"></i>
                        </span>
                        <span class="title">공고등록</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon">
                            <i class="fa-regular fa-file-lines"></i>
                        </span>
                        <span class="title">공고·지원자관리</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon">
                            <i class="fa-solid fa-users"></i>
                        </span>
                        <span class="title">인재풀</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon">
                            <i class="fa-regular fa-building"></i>
                        </span>
                        <span class="title">기업정보관리</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon">
                            <i class="fa-regular fa-address-book"></i>
                        </span>
                        <span class="title">기업인재상 등록</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon">
                            <i class="fa-regular fa-trash-can"></i>
                        </span>
                        <span class="title">기업회원탈퇴</span>
                    </a>
                </li>              
            </ul>
        </div>  <!-- nav-menu 끝-->    
    </div> <!-- navigation 끝-->
    <div class="mainContent">
        <header>
            <div class="userWrapper">
                <img src="images/people.svg"alt="">
                <h4 class="name">${companyInfo.com_name}</h4>
                <span class="icon">
                    <i class="fa-solid fa-caret-down"></i>
                </span>
             </div>
        </header>    
        <main>
            <div class="containe">
                
                
                <div class="toptitle">
                    <h3 class="toptitle1" >기업 기본 수정</h3>
                    
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
                                <td><input type="text" class="modifytext" name="com_person" placeholder="이름을 입력해주세요"></td>
                            </tr>
                            <tr>
                                <th>연락처</th>
                                <td><input type="text" class="modifytext" name="com_tel" placeholder="연락처를 입력해주세요"></td>
                            </tr>
                            <tr>
                                <th>비밀번호</th>
                                <td><input type="button" value="변경하기" class="changepw"  onClick="location.href='비밀번호수정페이지'""></td>
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