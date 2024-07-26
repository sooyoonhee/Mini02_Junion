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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/joinManagementList.css">
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
	                    <div class="Maintab tabCon completeApply">
	                        <h3 class="tabTitle">
	                            <a href="joinManagementList">전체보기</a>
	                        </h3>
	                        <h3 class="tabNum">
	                            <a href="joinManagementList">${total}</a>
	                        </h3>
	                    </div>
	                    <div class="Maintab tabCon find">
	                        <h3 class="tabTitle">
	                            <a href="noticeStatus?noticeCheck=열람&notice_status=전체">열람</a>
	                        </h3>
	                        <h3 class="tabNum">
	                            <a href="noticeStatus?noticeCheck=열람&notice_status=전체">${check}</a>
	                        </h3>
	                    </div> 
	                    <div class="Maintab tabCon noFind">
	                        <h3 class="tabTitle">
	                            <a href="noticeStatus?noticeCheck=미열람&notice_status=전체">미열람</a>
	                        </h3>
	                        <h3 class="tabNum">
	                            <a href="noticeStatus?noticeCheck=미열람&notice_status=전체">${uncheck}</a>
	                        </h3>
	                    </div> 	                                        
	                </div>
					
	                <div class="dataWrap">
	                    <div class="dataHeader">
	                        <input type="checkbox" class="all" id="allCheck" name="allCheck" style="margin-left:0;">
	                        <button class="deleteData" onclick="deleteValue();">지원 취소하기</button>							
							<form action="noticeStatus" method="post" style="margin-left: auto;">
								<select name="notice_status" id="notice_status">								
									<option value="1" disabled selected>진행여부</option>
									<option value="전체" <c:out value="${notice_status eq '전체' ? 'selected' : ''}"/>>전체보기</option>
									<option value="공고중" <c:out value="${notice_status eq '공고중' ? 'selected' : ''}"/>>공고중</option>
									<option value="공고마감" <c:out value="${notice_status eq '공고마감' ? 'selected' : ''}"/>>공고마감</option>
								</select>
								<select name="noticeCheck" id="noticeCheck">
									<option value="1" disabled selected>열람여부</option>
									<option value="전체" <c:out value="${noticeCheck eq '전체' ? 'selected' : ''}"/>>전체보기</option>
									<option value="열람" <c:out value="${noticeCheck eq '열람' ? 'selected' : ''}"/>>열람</option>
									<option value="미열람" <c:out value="${noticeCheck eq '미열람' ? 'selected' : ''}"/>>미열람</option>
								</select>
								<button class="search">검색하기</button>
							</form>	              
	                    </div>
	                    <div class="dataBody">

							<c:forEach items="${joinManagementList}" var="dto">
								<div class="dataBodyCon">																	
									<input type="checkbox" class="checkbox" name="RowCheck" value="${dto.notice_num}">
									<h5 class="companyName">${dto.com_name}</h5>
									<div class="resumeDiv">
										<h3 class="resumeTitle">${dto.notice_title}</h3>
										<div class="resumeOption">
											<div class="optionCon location">${dto.notice_area1} ${dto.notice_area2}</div>
											<div class="optionCon career">${dto.notice_career}</div>
											<div class="optionCon findList">
												<a href="resumeInfo?resume_num=${dto.resume_num}">
													<span class="icon">
														<i class="fa-regular fa-file-lines"></i>
													</span>
													<span class="title">${dto.resume_title}</span>
												</a>                                        
											</div>
											<div class="optionCon applyDate">지원일자: ${dto.joincompany_date}</div>
										</div>
									</div>
									<div class="leftDataWrap">                                
										<div class="noticeDiv">
											<button class="noticeStatus" <c:if test="${dto.notice_status == '공고중'}">style='background-color: #FFA500; color:white; border:0;'</c:if>>
												${dto.notice_status}
											</button>
											<button class="noticeCheck">${dto.noticeCheck}</button>
											<button class="noticeEstimate">평가하기</button>
										</div>
										<span class="icon delete">
											<i class="fa-regular fa-trash-can" ></i>
										</span>
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
														<h3 class="title">지원내역을 취소 하시겠습니까?</h3> 
													</div>
													<div class="popB">
														<div class="buttonWrap">
															<button class="yes buttonGray" onclick="deleteValue();">예</button>
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
													<form action="comStar" method="post" id="starFrm">         
														<div class="popM">
															<div class ="star_rating">
																<input type="hidden" name="com_email" value="${dto.com_email}">
																<input type="hidden" name="notice_num" value="${dto.notice_num}">
																<input type="radio" id="com_star1" class="com_star" name="com_star" value="1">
																<label class="star" for="com_star1"></label>																											
																<input type="radio" id="com_star2" class="com_star" name="com_star" value="2">
																<label class="star" for="com_star2" value="2"></label>
																<input type="radio" id="com_star3" class="com_star" name="com_star" value="3">
																<label class="star" for="com_star3" value="3"></label>
																<input type="radio" id="com_star4" class="com_star" name="com_star" value="4">
																<label class="star" for="com_star4" value="4"></label>
																<input type="radio"  id="com_star5"class="com_star" name="com_star" value="5">
																<label class="star" for="com_star5" value="5"></label>
															</div>
														</div>                               
														<div class="popB">
															<button class="submit estimate">평가하기</button>
														</div>
													</form>
												</div>
											</div>
										</div>    <!-- .estimatePop 끝 -->
									</div>
								</div>								
							</c:forEach>
	                    </div>
						<!--<h3>${pageMaker}</h3>-->
						<div class="div_page">
							<ul>
								<c:if test="${pageMaker.prev}">
									<!-- <li>Previous</li> -->
									<li class="paginate_button">
										<a href="${pageMaker.startpage - 1}">
											Previous
										</a>
									</li>
								</c:if>
								<c:forEach var="num" begin="${pageMaker.startpage}" end="${pageMaker.endpage}">									
									<li class="paginate_button" ${pageMaker.cri3.pageNum == num ? "style='border:2px solid #FFA500; font-weight: 900';'" : ""}>
										<a href="${num}">
											${num}
										</a>
									</li>
								</c:forEach>
								<c:if test="${pageMaker.next}">
									<!-- <li>next</li> -->
									<li class="paginate_button">
										<a href="${pageMaker.endpage + 1}">
											Next
										</a>
									</li>
								</c:if>
							</ul>
						</div> <!-- div_page-->
						<!-- 데이터를 가지고 컨트롤러단으로 가기때문에 listWithPaging-->
						<!-- <form action="listWithPaging" method="get" id="actionForm"> -->
						<!-- <form action="list" method="get" id="actionForm"> -->
						<form method="get" id="actionForm">
							<!-- 페이지 번호를 "pageNum" 이라는 이름으로 가져감 이건 굳이 보일필요는없기때문에 hidden type-->
							<input type="hidden" name="pageNum" value="${pageMaker.cri3.pageNum}">
							<input type="hidden" name="amount" value="${pageMaker.cri3.amount}">
						</form>
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
        $(this).siblings(".deletePop").show();
    });

    $(".icon.cancel").on("click",function(){
        $(this).parents(".deletePop").hide();
    });

    /* 평점 */
    $('.star_rating > .star').click(function() {
        $(this).parent().children('span').removeClass('on');
        $(this).addClass('on').prevAll('label').addClass('on');
        $(this).addClass('on').nextAll('label').removeClass('on');
    });

    $(".noticeEstimate").on("click",function(){
        $(this).parents().siblings(".estimatePop").show();			
    });

    $(".estimatePop .icon.cancel").on("click",function(){
        $(this).parents(".estimatePop").hide();
    });

	$(".Maintab").click(function(){
		$(".Maintab").not(this).removeClass('active');
		$(this).addClass('active');
	});

});

// 24-07-09 이재원
// 체크박스 삭제 기능
// 전체삭제 / 부분삭제 둘다 가능	
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
	var url="cancelJoin";
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
		var chk = confirm("정말 취소하시겠습니까?");
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
				if(jdata=1) 
				{
					alert("취소성공");
					location.replace("joinManagementList")
				}
				else 
				{
					alert("삭제실패");
				}
			}
		});// ajax 끝
	}	
}
</script>
<script>
	var actionForm = $("#actionForm");

	// 페이지번호 처리
	$(".paginate_button a").on("click", function(e){
		// 기본 동작 막음
		e.preventDefault();
		console.log("@# href=>"+$(this).attr("href"));

		// 게시글 클릭 후 뒤로가기 누른 후 다른 페이지 클릭할때 &boardNo= 번호 계속 누적되는거 방지
		var bno = actionForm.find("input[name='notice_num']").val();
		if(bno != "") 
		{
			actionForm.find("input[name='notice_num']").remove();
		}

		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		// actionForm.submit();

		// ★ 뒤로가기했다가 다른번호 누르면 페이징 기능 고장나는거 수정 form action="list"를 빼고 이렇게 속성
		actionForm.attr("action","joinManagementList").submit(); 
	}); // paginate_button 클릭 끝
	
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