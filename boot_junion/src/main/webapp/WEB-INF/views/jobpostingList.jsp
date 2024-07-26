<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title> 공고관리 목록페이지 </title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jobpostingList.css">
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
	
	
<!------------------------------------------------ 헤더 시작 ------------------------>


<div class="container">
	<%@ include file="nav_company.jsp" %>
    
    <div class="mainContent">
        <header>
			<div class="userWrapper">
				<img src="images/people.svg"alt="">
				<div class="dorpdowmMain">
					<div class="dropdown">
						<div class="dropdownSub" id="dropdownSub">
							<h4 class="name" name="com_name" style="cursor: pointer;">${login_name}</h4>
							<div class="dropdownContent" id="dropdownContent">
								<a href="#"><div>기업 정보 관리</div></a>
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
		<!--------------------------------------------- 헤더 끝 ------------------------>  
		  <main>
            <div class="containe">
                <div class="toptitle">
                    <h3>채용공고 / 지원자관리</h3>
                </div>
            
				<div class="tabWrap">
                    <div class="tabCon All" onclick="showTab('all')">
                        <h3 class="tabTitle">
                            <a href="#">전체</a>
                        </h3>
                        <h3 class="tabNum">
                            <a href="#">${totalCount.totalCount}</a>
                        </h3>
                    </div>
                    <div class="tabCon proposal" onclick="showTab('proposal')">
                        <h3 class="tabTitle">
                            <a href="#">진행중인 공고</a>
                        </h3>
                        <h3 class="tabNum">
                            <a href="#">${totalCount.onCount}</a>
                        </h3>
                    </div>                    
                    <div class="tabCon post" onclick="showTab('post')">
                        <h3 class="tabTitle">
                            <a href="#">마감된 공고</a>
                        </h3>
                        <h3 class="tabNum">
                            <a href="#">${totalCount.offCount}</a>
                        </h3>
                    </div>
                </div>
				
				
				
				
					
<!--	                <div class="filterall">
	                    <button class="filter">최근등록일순</button>
	                    <button class="filter">채용유형</button>
	                </div>-->
					<div class="dtbox">
						<input type="checkbox" id="allCheck" name="allCheck" class="allCheck">
						<div class = "deletebox">
	                    	<button class="deleteData" onclick="deleteValue();">삭제</button>
						</div>
					</div>
						<!-- 전체 공고 -->
						<c:if test="${totalCount.totalCount > 0}">
						    <div id="all" class="job-section">
						        <c:forEach items="${jobpostingList}" var="dto">
						            <div class="box">
						                <div class="left">
											<div class=boxbox>
						                    	<input type="checkbox" class="checkbox" name="RowCheck" value="${dto.notice_num}">
											</div>
						                    <div>
						                        <div class="job-title">
						                            <a href="jobpostingSupport">${dto.notice_title}</a> / ${dto.notice_num}
						                        </div>
						                        <div class="dates">${dto.notice_startDate} ~ ${dto.notice_endDate} </div>
						                        <div class="end">공고 : ${dto.notice_final}</div>
						                    </div>
						                </div>
						                <div class="right">
						                    <div class="applicant-count">지원자 ${supportCount.t_count}</div>
						                </div>
						            </div>
						        </c:forEach>
						    </div>
						</c:if>

						<!-- 진행중인 공고 -->
						<c:if test="${totalCount.onCount > 0}">
						    <div id="proposal" class="job-section" style="display: none;">
						        <c:forEach items="${jobpostingList}" var="dto">
						            <c:if test="${dto.notice_final == '진행중'}">
						                <div class="box">
						                    <div class="left">
												<div class=boxbox>
													<input type="checkbox" class="checkbox" name="RowCheck" value="${dto.notice_num}">
												</div>
						                        <div>
						                            <div class="job-title">
						                               <a href="jobpostingSupport">${dto.notice_title}</a> / ${dto.notice_num}
						                            </div>
						                            <div class="dates">${dto.notice_startDate} ~ ${dto.notice_endDate} </div>
						                            <div class="end">공고 : ${dto.notice_final}</div>
						                        </div>
						                    </div>
						                    <div class="right">
						                        <div class="applicant-count">지원자 ${supportCount.t_count}</div>
						                    </div>
						                </div>
						            </c:if>
						        </c:forEach>
						    </div>
						</c:if>

						<!-- 마감된 공고 -->
						<c:if test="${totalCount.offCount > 0}">
						    <div id="post" class="job-section" style="display: none;">
						        <c:forEach items="${jobpostingList}" var="dto">
						            <c:if test="${dto.notice_final == '마감'}">
						                <div class="box">
						                    <div class="left	">
												<div class=boxbox>
													<input type="checkbox" class="checkbox" name="RowCheck" value="${dto.notice_num}">
												</div>
						                        <div>
						                            <div class="job-title">
						                                <a href="jobpostingSupport">${dto.notice_title}</a> / ${dto.notice_num}
						                            </div>
						                            <div class="dates">${dto.notice_startDate} ~ ${dto.notice_endDate} </div>
						                            <div class="end">공고 : ${dto.notice_final}</div>
						                        </div>
						                    </div>
						                    <div class="right">
						                        <div class="applicant-count">지원자 ${supportCount.t_count}</div>
						                    </div>
						                </div>
						            </c:if>
						        </c:forEach>
						    </div>
						</c:if>	
				

            </div> <!-- container끝 -->
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



<!-- ------------------------------------------- 스크립트 시작 ------------------------------->
<script>
	
	// Delete 구문 시작
	
	$(function(){
		var chkObj = document.getElementsByName("RowCheck");
		var rowCnt = chkObj.length;
		
		$("input[name='allCheck']").click(function(){
			var chk_listArr = $("input[name='RowCheck']");
			for(var i =0; i<chk_listArr.length; i++) 
			{
				chk_listArr[i].checked = this.checked;
			}
		});
		$("input[name='RowCheck']").click(function(){
			if($("input[name='RowCheck']:checked").length == rowCnt) 
			{
				$("input[name='allCheck']")[0].checked = true;
			}
			else 
			{
				$("input[name='allCheck']")[0].checked = false;
			}	
		});
	});	

	function deleteValue() 
	{
		var url="jobpostingDelete";
		var valueArr = new Array();
		var list = $("input[name='RowCheck']");
		for(var i=0; i < list.length; i++) 
		{
			if(list[i].checked) 
			{
				valueArr.push(list[i].value);
			}
		}
		if(valueArr.length ==0) 
		{
			alert("선택된 글이 없습니다.");
		}
		else 
		{
			var chk = confirm("정말 삭제하시겠습니까?");
			$.ajax
			({
				url:url,
				type:'POST',
				traditional : true,
				data: 
				{
					valueArr : valueArr
				},
				success : function(jdata) 
				{
					if(jdata =1) 
					{
						alert("삭제성공");
						location.replace("jobpostingList")
					}
					else 
					{
						alert("삭제실패");
					}
				}
			});// ajax 끝
		}
		
	}
		
		
		$(document).ready(function()
		{					
			/* 삭제 */
		     $(".icon.delete").click(function(){
		         $(this).parent().siblings(".deletePop").show();
		     });

		     $(".icon.cancel").on("click",function(){
		         $(this).parents(".deletePop").hide();
		     });
					
		});
	
	// Delete 구문 끝
	
	
	// 탭 메뉴 클릭 시 해당 섹션 보여주는 함수
	   function showTab(tabName) {
	       // 모든 섹션 숨기기
	       document.querySelectorAll('.job-section').forEach(function(section) {
	           section.style.display = 'none';
	       });

	       // 클릭한 탭의 섹션만 보이기
	       document.getElementById(tabName).style.display = 'block';
	   }

	   // 페이지 로드 시 전체 탭을 기본으로 선택
	   document.addEventListener('DOMContentLoaded', function() {
	       showTab('all');
	   });
	


	   // CSS JS ---------------------------------------------------
	   // 24-07-09 이재원
	   // 체크박스 삭제 기능
	   // 전체삭제 / 부분삭제 둘다 가능	
	   $(document).ready(function()
	   {
	       /*
	           2024-06-25 이재원 
	           메뉴 눌렀을 때 메뉴 활성화 : active
	       */
	       $('.navMenu ul li').click(function(){
	           $(this).addClass('active');
	           $('.navMenu ul li').not(this).removeClass('active');
	       });

	       
	       /*
	           2024-06-25 이재원 
	           글자수 제한 + 넘는건 ...처리
	       */
	       $('.cardConBottom > .title').each(function()
	       {
	           var length = 21; //표시할 글자 수 정하기
	       
	           $(this).each(function()
	           {

	               if($(this).text().length >= length)
	               {
	                   $(this).text($(this).text().substr(0, length) + '...');	//지정한 글자수 이후 표시할 텍스트 '...'
	               }
	           });

	       });

	       /*
	           2024-06-25 이재원 
	           탭 메뉴 : 전체 , 포지션 제안, 관심기업
	       */

	       $('.tabCon.All').click(function(){
	           $('.cardConWrap').css({"display":"none"});
	           $('.cardConWrap.All').css({"display":"flex"});
	       });

	       $('.tabCon.proposal').click(function(){
	           $('.cardConWrap').css({"display":"none"});
	           $('.cardConWrap.proposal').css({"display":"flex"});
	       });

	       $('.tabCon.post').click(function(){
	           $('.cardConWrap').css({"display":"none"});
	           $('.cardConWrap.post').css({"display":"flex"});
	       });

	       


	   });
	   // CSS JS ---------------------------------------------------

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