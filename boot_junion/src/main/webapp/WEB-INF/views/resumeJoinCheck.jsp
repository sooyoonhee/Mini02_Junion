<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>입사지원관리</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/resumeJoinCheck.css">
<!--<link rel="stylesheet" href="src/main/resources/static/css/style.css">-->
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<!-- import js -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
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
	        <main>
	            <div class="mainContainer">
	                <div class="memberInfo">
	                    <h3 class="memberName">입사지원관리</h3>
	                </div>
	
	                <div class="tabWrap">
	                    <div class="tabCon completeApply">
	                        <h3 class="tabTitle">
	                            <a href="#">지원완료</a>
	                        </h3>
	                        <h3 class="tabNum">
	                            <a href="#">7</a>
	                        </h3>
	                    </div>
	                    <div class="tabCon find">
	                        <h3 class="tabTitle">
	                            <a href="#">열람</a>
	                        </h3>
	                        <h3 class="tabNum">
	                            <a href="#">7</a>
	                        </h3>
	                    </div> 
	                    <div class="tabCon noFind">
	                        <h3 class="tabTitle">
	                            <a href="#">미열람</a>
	                        </h3>
	                        <h3 class="tabNum">
	                            <a href="#">7</a>
	                        </h3>
	                    </div> 
	                    <div class="tabCon cancelApply">
	                        <h3 class="tabTitle">
	                            <a href="#">지원취소</a>
	                        </h3>
	                        <h3 class="tabNum">
	                            <a href="#">7</a>
	                        </h3>
	                    </div>                     
	                </div>
	
	                <div class="dataWrap">
	                    <div class="dataHeader">
	                        <input type="checkbox" class="all">
	                        <button class="deleteData">삭제</button>
	                        <select name="lookupDate" id="luD">
	                            <option value="1">조회기간</option>
	                            <option value="1">지난 1개월</option>
	                            <option value="1">지난 3개월</option>
	                            <option value="1">지난 6개월</option>
	                        </select>
	                        <select name="noticeStatus" id="nS">
	                            <option value="1">진행여부</option>
	                            <option value="1">진행</option>
	                            <option value="1">마감</option>
	                        </select>
	                        <select name="resumeCheck" id="rC">
	                            <option value="1">열람여부</option>
	                            <option value="1">열람</option>
	                            <option value="1">미열람</option>
	                        </select>
	                        <div class="searchWrap">
	                            <input type="search" placeholder="기업명, 채용제목">
	                            <button class="search">검색하기</button>
	                        </div>                        
	                    </div>
	                    <div class="dataBody">
	                        <div class="dataBodyCon">
	                            <input type="checkbox">
	                            <h5 class="companyName">브레인즈컴퍼니</h5>
	                            <div class="resumeDiv">
	                                <h3 class="resumeTitle">백앤드 Java개발자 OOO입니다.</h3>
	                                <div class="resumeOption">
	                                    <div class="optionCon location">서울 성동구</div>
	                                    <div class="optionCon career">경력: 3~5년</div>
	                                    <div class="optionCon findList">
	                                        <a href="#">
	                                            <span class="icon">
	                                                <i class="fa-regular fa-file-lines"></i>
	                                            </span>
	                                            <span class="title">입사지원관리</span>
	                                        </a>                                        
	                                    </div>
	                                    <div class="optionCon applyDate">지원일자: 2024-06-17</div>
	                                </div>
	                            </div>
	                            <div class="leftDataWrap">                                
	                                <div class="noticeDiv">
	                                    <button class="noticeStatus">공고마감</button>
	                                    <button class="noticeCheck">열람</button>
	                                    <button class="noticeEstimate">평가하기</button>
	                                </div>
	                                <span class="icon delete">
	                                    <i class="fa-regular fa-trash-can"></i>
	                                </span>
	                            </div>
	                            <!-- 삭제팝업 -->
	                            <div class="deletePop">
	                                <div class="popBlackBg">
	                                    <div class="popDiv Pop">
	                                        <div class="popH">
	                                            <span class="icon cancel">
	                                                <i class="fa-solid fa-xmark"></i>
	                                            </span>
	                                        </div>
	                                        <div class="popM">
	                                            <h3 class="title">지원내역을 삭제 하시겠습니까?</h3> 
	                                        </div>
	                                        <div class="popB">
	                                            <div class="buttonWrap">
	                                                <button class="yes buttonGray">예</button>
	                                                <button class="no buttonGray">아니오</button>
	                                            </div> 
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>    <!-- .deletePop 끝 -->  
	                            <div class="estimatePop">
	                                <div class="popBlackBg">
	                                    <div class="popDiv Pop">
	                                        <div class="popH">
	                                            <h3 class="title">기업 평가하기</h3>
	                                            <span class="icon cancel">                                                
	                                                <i class="fa-solid fa-xmark"></i>
	                                            </span>
	                                        </div>         
	                                        <div class="popM">
	                                            <div class ="star_rating">
	                                                <span class="star on" value="1"> </span>
	                                                <span class="star" value="2"> </span>
	                                                <span class="star" value="3"> </span>
	                                                <span class="star" value="4"> </span>
	                                                <span class="star" value="5"> </span>
	                                            </div>
	                                        </div>                               
	                                        <div class="popB">
	                                            <button class="submit estimate">평가하기</button>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>    <!-- .estimatePop 끝 -->                        
	                        </div> <!-- .dataBodyCon 끝-->
	                        <div class="dataBodyCon">
	                            <input type="checkbox">
	                            <h5 class="companyName">브레인즈컴퍼니</h5>
	                            <div class="resumeDiv">
	                                <h3 class="resumeTitle">백앤드 Java개발자 OOO입니다.</h3>
	                                <div class="resumeOption">
	                                    <div class="optionCon location">서울 성동구</div>
	                                    <div class="optionCon career">경력: 3~5년</div>
	                                    <div class="optionCon findList">
	                                        <a href="#">
	                                            <span class="icon">
	                                                <i class="fa-regular fa-file-lines"></i>
	                                            </span>
	                                            <span class="title">입사지원관리</span>
	                                        </a>                                        
	                                    </div>
	                                    <div class="optionCon applyDate">지원일자: 2024-06-17</div>
	                                </div>
	                            </div>
	                            <div class="leftDataWrap">                                
	                                <div class="noticeDiv">
	                                    <button class="noticeStatus">공고마감</button>
	                                    <button class="noticeCheck">열람</button>
	                                    <button class="noticeEstimate">평가하기</button>
	                                </div>
	                                <span class="icon delete">
	                                    <i class="fa-regular fa-trash-can"></i>
	                                </span>
	                            </div>
	                            <!-- 삭제팝업 -->
	                            <div class="deletePop">
	                                <div class="popBlackBg">
	                                    <div class="popDiv Pop">
	                                        <div class="popH">
	                                            <span class="icon cancel">
	                                                <i class="fa-solid fa-xmark"></i>
	                                            </span>
	                                        </div>
	                                        <div class="popM">
	                                            <h3 class="title">지원내역을 삭제 하시겠습니까?</h3> 
	                                        </div>
	                                        <div class="popB">
	                                            <div class="buttonWrap">
	                                                <button class="yes buttonGray">예</button>
	                                                <button class="no buttonGray">아니오</button>
	                                            </div> 
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>    <!-- .deletePop 끝 -->   
	                            <div class="estimatePop">
	                                <div class="popBlackBg">
	                                    <div class="popDiv Pop">
	                                        <div class="popH">
	                                            <h3 class="title">기업 평가하기</h3>
	                                            <span class="icon cancel">                                                
	                                                <i class="fa-solid fa-xmark"></i>
	                                            </span>
	                                        </div>         
	                                        <div class="popM">
	                                            <div class ="star_rating">
	                                                <span class="star on" value="1"> </span>
	                                                <span class="star" value="2"> </span>
	                                                <span class="star" value="3"> </span>
	                                                <span class="star" value="4"> </span>
	                                                <span class="star" value="5"> </span>
	                                            </div>
	                                        </div>                               
	                                        <div class="popB">
	                                            <button class="submit estimate">평가하기</button>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>    <!-- .estimatePop 끝 -->                      
	                        </div> <!-- .dataBodyCon 끝-->
	                        <div class="dataBodyCon">
	                            <input type="checkbox">
	                            <h5 class="companyName">브레인즈컴퍼니</h5>
	                            <div class="resumeDiv">
	                                <h3 class="resumeTitle">백앤드 Java개발자 OOO입니다.</h3>
	                                <div class="resumeOption">
	                                    <div class="optionCon location">서울 성동구</div>
	                                    <div class="optionCon career">경력: 3~5년</div>
	                                    <div class="optionCon findList">
	                                        <a href="#">
	                                            <span class="icon">
	                                                <i class="fa-regular fa-file-lines"></i>
	                                            </span>
	                                            <span class="title">입사지원관리</span>
	                                        </a>                                        
	                                    </div>
	                                    <div class="optionCon applyDate">지원일자: 2024-06-17</div>
	                                </div>
	                            </div>
	                            <div class="leftDataWrap">                                
	                                <div class="noticeDiv">
	                                    <button class="noticeStatus">공고마감</button>
	                                    <button class="noticeCheck">열람</button>
	                                    <button class="noticeEstimate">평가하기</button>
	                                </div>
	                                <span class="icon delete">
	                                    <i class="fa-regular fa-trash-can"></i>
	                                </span>
	                            </div>
	                            <!-- 삭제팝업 -->
	                            <div class="deletePop">
	                                <div class="popBlackBg">
	                                    <div class="popDiv Pop">
	                                        <div class="popH">
	                                            <span class="icon cancel">
	                                                <i class="fa-solid fa-xmark"></i>
	                                            </span>
	                                        </div>
	                                        <div class="popM">
	                                            <h3 class="title">지원내역을 삭제 하시겠습니까?</h3> 
	                                        </div>
	                                        <div class="popB">
	                                            <div class="buttonWrap">
	                                                <button class="yes buttonGray">예</button>
	                                                <button class="no buttonGray">아니오</button>
	                                            </div> 
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>    <!-- .deletePop 끝 -->   
	                            <div class="estimatePop">
	                                <div class="popBlackBg">
	                                    <div class="popDiv Pop">
	                                        <div class="popH">
	                                            <h3 class="title">기업 평가하기</h3>
	                                            <span class="icon cancel">                                                
	                                                <i class="fa-solid fa-xmark"></i>
	                                            </span>
	                                        </div>         
	                                        <div class="popM">
	                                            <div class ="star_rating">
	                                                <span class="star on" value="1"> </span>
	                                                <span class="star" value="2"> </span>
	                                                <span class="star" value="3"> </span>
	                                                <span class="star" value="4"> </span>
	                                                <span class="star" value="5"> </span>
	                                            </div>
	                                        </div>                               
	                                        <div class="popB">
	                                            <button class="submit estimate">평가하기</button>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>    <!-- .estimatePop 끝 -->                      
	                        </div> <!-- .dataBodyCon 끝-->
	                        <div class="dataBodyCon">
	                            <input type="checkbox">
	                            <h5 class="companyName">브레인즈컴퍼니</h5>
	                            <div class="resumeDiv">
	                                <h3 class="resumeTitle">백앤드 Java개발자 OOO입니다.</h3>
	                                <div class="resumeOption">
	                                    <div class="optionCon location">서울 성동구</div>
	                                    <div class="optionCon career">경력: 3~5년</div>
	                                    <div class="optionCon findList">
	                                        <a href="#">
	                                            <span class="icon">
	                                                <i class="fa-regular fa-file-lines"></i>
	                                            </span>
	                                            <span class="title">입사지원관리</span>
	                                        </a>                                        
	                                    </div>
	                                    <div class="optionCon applyDate">지원일자: 2024-06-17</div>
	                                </div>
	                            </div>
	                            <div class="leftDataWrap">                                
	                                <div class="noticeDiv">
	                                    <button class="noticeStatus">공고마감</button>
	                                    <button class="noticeCheck">열람</button>
	                                    <button class="noticeEstimate">평가하기</button>
	                                </div>
	                                <span class="icon delete">
	                                    <i class="fa-regular fa-trash-can"></i>
	                                </span>
	                            </div>
	                            <!-- 삭제팝업 -->
	                            <div class="deletePop">
	                                <div class="popBlackBg">
	                                    <div class="popDiv Pop">
	                                        <div class="popH">
	                                            <span class="icon cancel">
	                                                <i class="fa-solid fa-xmark"></i>
	                                            </span>
	                                        </div>
	                                        <div class="popM">
	                                            <h3 class="title">지원내역을 삭제 하시겠습니까?</h3> 
	                                        </div>
	                                        <div class="popB">
	                                            <div class="buttonWrap">
	                                                <button class="yes buttonGray">예</button>
	                                                <button class="no buttonGray">아니오</button>
	                                            </div> 
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>    <!-- .deletePop 끝 -->   
	                            <div class="estimatePop">
	                                <div class="popBlackBg">
	                                    <div class="popDiv Pop">
	                                        <div class="popH">
	                                            <h3 class="title">기업 평가하기</h3>
	                                            <span class="icon cancel">                                                
	                                                <i class="fa-solid fa-xmark"></i>
	                                            </span>
	                                        </div>         
	                                        <div class="popM">
	                                            <div class ="star_rating">
	                                                <span class="star on" value="1"> </span>
	                                                <span class="star" value="2"> </span>
	                                                <span class="star" value="3"> </span>
	                                                <span class="star" value="4"> </span>
	                                                <span class="star" value="5"> </span>
	                                            </div>
	                                        </div>                               
	                                        <div class="popB">
	                                            <button class="submit estimate">평가하기</button>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>    <!-- .estimatePop 끝 -->                      
	                        </div> <!-- .dataBodyCon 끝-->
	                    </div>
	                </div>
	                                  
	            </div> <!-- mainContainer 끝 -->                              
	        </main>    
	    </div> <!-- mainContent --> 	
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>
<script>
	$(document).ready(function()
	{		
			
		/* 삭제 */
	    $(".icon.delete").on("click",function(){
	        $(this).parent().siblings(".deletePop").show();
	    });

	    $(".icon.cancel").on("click",function(){
	        $(this).parents(".deletePop").hide();
	    });

	    /* 평점 */
	    $('.star_rating > .star').click(function() {
	        $(this).parent().children('span').removeClass('on');
	        $(this).addClass('on').prevAll('span').addClass('on');
	    });

	    $(".noticeEstimate").on("click",function(){
	        $(this).parents().siblings(".estimatePop").show();
	    });

	    $(".estimatePop .icon.cancel").on("click",function(){
	        $(this).parents(".estimatePop").hide();
	    });

	});
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