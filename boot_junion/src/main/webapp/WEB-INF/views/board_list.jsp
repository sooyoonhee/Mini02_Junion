<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판 목록페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board_list.css">
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<!-- import js -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script src="js/index.js"></script>
</head>

<body>
	<%@ include file="header.jsp" %>
	<section> 
	         <div class="wrap">     
	             <div class="board">

	                 <div class="headbox">
	                     <h5 class="head">
	                         커뮤니티
	                     </h5>
	                 </div> 

	                 <div class="subbox">

	                     <div class="sub">
	                         <h5 class="s1">
	                             번호
	                         </h5>
	                     </div>
	                     <div class="sub">
	                         <h5 class="s1">
	                             제목
	                         </h5>
	                     </div>

	                     <div class="sub">
	                         <h5 class="s1">
	                             작성자
	                         </h5>
	                     </div>
	                     <div class="sub">
	                         <h5 class="s1">
	                             날짜
	                         </h5>
	                     </div>
	                     <div class="sub">
	                         <h5 class="s1">
	                             추천
	                         </h5>
	                     </div>
	                     <div class="sub">
	                         <h5 class="s1">
	                             조회
	                         </h5>
	                     </div>
	                 </div>

					 <!-- 반 복 문 시 작  -->
					 <c:forEach items="${list}" var="dto">


	                 <div class="listbox">
	                     <div class="list">
	                         <div class="ll">
	                             <div class="num">
	                                 <h5 class="l1">
	                                     ${dto.board_no}
	                                 </h5>
	                             </div>
	                             <div class="kate">
	                                 <a href="${pageContext.request.contextPath}/board_detail">
	                                     <h5 class="l1">
											${dto.board_title}
	                                     </h5>
	                                 </a>
	                             </div>

	                             <div class="writer">
	                                 <h5 class="l1">
	                                     ${dto.user_email} 
	                                 </h5>
	                             </div>
	                             <div class="date">
	                                 <h5 class="l1">
	                                     ${dto.create_date} 
	                                 </h5>
	                             </div>
	                             <div class="reco">
	                                 <h5 class="l1">
	                                     ${dto.board_hit} 
	                                 </h5>
	                             </div>
	                             <div class="hit">
	                                 <h5 class="l1">
	                                     ${dto.board_like} 
	                                 </h5>
	                             </div>
	                         </div>
	                     </div> <!-- 리스트 끝-->
						 
						 </c:forEach>  <!-- 반 복 문 끝  -->
						 
						

	              </div> <!-- 리스트박스 끝-->


	                 <div class="buttonbox">
						<a href="${pageContext.request.contextPath}/board_write">
	                     <button class="button">
	                         <h5 class="but1">글쓰기</h5>
	                     </button>
						 </a>
	                     </button>
	                 </div><!--버튼 끝 -->
	 
	 
					 
	                 <div class="pagingbox">
	                     <div class="paging">
	                         <h5 class="p1">페이징버튼입니다@@</h5>
	                     </div>

	                 </div>

	             </div> <!--보드 끝-->


	         </div> <!-- wrap 끝 -->
	     </section> <!--section 끝 -->

	
	
		<%@ include file="footer.jsp" %>
</body>
</html>
<script>
//	$(document).ready(function()
//	{					

//	});
</script>