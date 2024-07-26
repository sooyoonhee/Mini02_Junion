<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Company_InfoManagement</title>
<!--    <link rel="stylesheet" href="css/default.css">-->
<!--    <link rel="stylesheet" href="css/style.css">-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/company_InfoMamagement.css">
    <!-- import font-awesome, line-awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
    <!-- import pretendard font -->
    <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
    <!-- import js -->
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <script src="js/index.js"></script>
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
	
<!--	${companyInfo}-->
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
                    <h3 class="toptitle1" >기업 기본 정보</h3>
                    <h3 class="toptitle2" >기업 상세 정보</h3>
                </div>
                
                    <div class="tabCon common">

                        <!-- 섹션시작 -->
                        <section class="tabCon common disN" >            
                            <div class="wrap">
                
                
                                <div class="left">
                
                
                                    <!-- 컴퍼니 시작 -->
                
                                    <div class="company">
                                        <img class="imgg" src="../images/companyInfo.svg" alt="#">
                                    </div>
                                    <div class="main">
                                        <div class="sub1">
                                            <h5 class="name">${companyInfo.com_name}</h5>
                                            <h5 class="locationC">${companyInfo.com_location}ㆍ(${year})</h5>
                                        </div>
                                    </div>
                
                
                                    <!-- 컬럼 시작 -->
                
                
                                    <div class="column"> 
                
                
                                    <div class="col1">
                                        <div class="columnA">
                                            <h5 class="title">회사 소개</h5>
                                        </div>
                                        <div class="boerder"></div>
                                        <div class="columnAA">
                                            <h5 class="detail">
                                                ${companyInfo.com_content}
                                            </h5>
                                        </div>
                                    </div>

                                    <div class="col1">
                                        <div class="columnA">
                                            <h5 class="title">기술 스택</h5>
                                        </div>
                                        <div class="boerder"></div>
                                        <div class="columnAA">
                                            <div class="detail" id="stack">
                                                <!-- ${companyInfo.com_stack} -->
                                            </div>
                                        </div>
                                    </div><!--col2-->
                
                                    <div class="col7">
                                        <div class="columnA">
                                            <h5 class="title">회사 위치</h5>
                                        </div>
                                        <div class="columnBB">
                                            <!-- <h5 class="loc">${companyInfo.com_location}</h5> -->
                                        </div>
                                    </div>
                
                                    <div class="col8">
                                        <div class="columnA">
                                                <h5 class="title">
                                                    기업정보
                                                </h5>
                                            </div>
                                            <div class="content">
                                                <div class="comname1">
                                                    <h5 class="name">
                                                        연혁
                                                    </h5>
                                                </div>
                                                <div class="comname2">
                                                    <h5 class="name">
                                                        (${year}년 설립)
                                                    </h5>
                                                </div>
                                                <div class="comname1">
                                                    <h5 class="name">
                                                        매출액 (2024년)
                                                    </h5>
                                                </div>
                                                <div class="comname2">
                                                    <h5 class="name">
                                                        ${companyInfo.com_sale} 
                                                    </h5>
                                                </div>
                                                <div class="comname1">
                                                    <h5 class="name">
                                                        기업유형
                                                    </h5>
                                                </div>
                                                <div class="comname2">
                                                    <h5 class="name">
                                                        ${companyInfo.com_type} 
                                                    </h5>
                                                </div>
                                                <div class="comname1">
                                                    <h5 class="name">
                                                        평균연봉
                                                    </h5>
                                                </div>
                                                <div class="comname2">
                                                    <h5 class="name">
                                                        ${companyInfo.com_salary} 
                                                    </h5>
                                                </div>
                                                <div class="comname1">
                                                    <h5 class="name">
                                                        대표자명
                                                    </h5>
                                                </div>
                                                <div class="comname2">
                                                    <h5 class="name">
                                                        ${companyInfo.com_CEO} 
                                                    </h5>
                                                </div>
                                                <div class="comname1">
                                                    <h5 class="name">
                                                        홈페이지
                                                    </h5>
                                                </div>
                                                <div class="comname2">
                                                    <h5 class="name">
                                                        ${companyInfo.com_site} 
                                                    </h5>
                                                </div>
                                                <div class="comname1">
                                                    <h5 class="name">
                                                        가입 사원수 (인원)
                                                    </h5>
                                                </div>
                                                <div class="comname2">
                                                    <h5 class="name">
                                                        ${companyInfo.com_employee}명 
                                                    </h5>
                                                </div>
                                            </div>
                                    </div>
                
                
                
                                </div><!-- 컬럼 끝 -->
								<div class="modify">
								    <input type="button" value="기업정보수정" class="commodify" onclick="location.href='companyInfoDetailUpdate'">
								</div>
                                </div><!-- left 끝 -->
					
                
                            </div><!-- wrap 끝 -->
                        </section><!-- section 끝 -->
                        
                    </div>
                    
                    <div class="tabCon detail">
                        <table class="tabCon detail disB" width="1200px" height="300px">
                            <tr>
                                <th>기업이메일</th>
                                <td>${companyInfo.com_email}</td>
                            </tr>
                            <tr>
                                <th>사업자등록번호 </th>
                                <td>${companyInfo.com_serial_number}</td>
                            </tr>
                            <tr>
                                <th>이름</th>
                                <td>${companyInfo.com_person}</td>
                            </tr>
                            <tr>
                                <th>연락처</th>
                                <td>${companyInfo.com_tel}</td>
                            </tr>
                            <tr>
                                <th>비밀번호</th>
                                <!-- <td><button type="button" value="변경하기" class="changepw"></td> -->
                                <td><input type="button" value="변경하기" class="changepw" onclick="pwchange()"></td>
                            </tr>
                        </table>
<!--						 table끝 -->
                        
                    <div class="modify">
                        <input type="button" value="기업정보수정" class="commodify" onclick="location.href='companyInfoUpdate'">
<!--                        <input type="button" value="기업정보수정" class="commodify" onclick="location.href='company_InfoUpdate?com_email=${companyInfo.com_email}'">-->
                    </div>
                    </div>

            </div><!-- containe끝 -->
        </main>
    
    </div><!-- main-content -->
</div>    
<%@ include file="../footer.jsp" %>
    
</body>
</html>
<script>
    $(document).ready(function () {
        var comStack = "${companyInfo.com_stack}";

        if(comStack){
            // comStack.forEach(function(stack) {
    //   alert('${comInfo.com_stack}');
       // const comStack = "<c:out value='${comInfo.com_stack}'/>";
    //    const comStack = "<c:out value='${companyInfo.com_stack}'/>";
        console.log(comStack);
                const stacks = comStack.split(",");//배열로 만듦
                // console.log("@@###=>1"+stacks[0]);
                // console.log("@@###=>2"+stacks[1]);
                // console.log("@@###=>3"+stacks[2]);
                // console.log("@@###=>4"+stacks[3]);
                let str = "";
                for( let i=0; i < stacks.length; i++) 
                // for( let i=0; i < comStack.length; i++) 
                {
                    // alert("test");
                    str += "<input type='button' class='tech' value='"+stacks[i].trim()+"'>";       
                    // str += "<button class='tech' value='"+stacks[i].trim()+"'>";       
                }
                console.log("str@@##"+str);
                $("#stack").html(str);
            // });

            // var comLocation ="${companyInfo.com_location}";
            // var comYear = "${companyInfo.com_year}";
            // if (!comLocation && !comYear) {
            //     $(".locationC").css("display","none");
            // }else{
            //     $(".locationC").css("display","flex");
            // }
        }
    });//end of ready
     // 24-07-09 하진
     function pwchange() {
            // window.name = "부모창 이름"; 
        
            var popupURL = "/companyPW";
            // window.name = "company_InfoManagement";
            var popupProperties = "width=600, height=400, resizable = no, scrollbars = no";
            // window.open("open할 window", "자식창 이름", "팝업창 옵션");
            window.open(popupURL, "companyPW.jsp", popupProperties);    
        }

</script>
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