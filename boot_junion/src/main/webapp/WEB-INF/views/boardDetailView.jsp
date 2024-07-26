<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판 상세페이지</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/board_detail.css">
    <!-- import font-awesome, line-awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
    <!-- import pretendard font -->
    <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
    <!-- import js -->
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<!--   <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>-->
</head>

<body>
	<%@ include file="header.jsp" %>

	<!-- 섹션-->
	        <section> 
	            <div class="wrap">     
	                <div class="board">
						<form method="post" action="boardModifyView"> <!--  폼 시작 -->
							
							
							<input type="hidden" name="board_no" value="${pageMaker.board_no}">
							<input type="hidden" name="pageNum" value="${pageMaker.pageNum}">
							<input type="hidden" name="amount" value="${pageMaker.amount}">
						
		                    <div class="titlebox">
		                        <h5 class="title">
		                            ${boardDetailView.board_title}
		                        </h5>
		                    </div> 
		                    <div class="namebox">
		                        <h5 class="name">
		                            ${boardDetailView.user_email} ${boardDetailView.board_no}번째글
		                        </h5>
		                    </div> <!-- 네임 끝 -->
		                    <div class="lastline">
		                        <div class="line1">
		                            <div class="datebox">
		                                <h5 class="date">
		                                    ${boardDetailView.create_date}
		                                </h5>
		                            </div>
		                            <div class="selectbox">
		                                <h5 class="select">
		                                    조회수 ${boardDetailView.board_hit}
		                                </h5>
		                            </div>
		                            <div class="heartbox">
		                                <h5 class="heart">
		                                    좋아요 ${boardDetailView.board_like}
		                                </h5>
		                            </div>
		                        </div>
		                        <div class="line2">
		                            <div class="rightb1box">
		                                <a href="#">
		                                    <h5 class="r1">
		                                        좋아요
		                                    </h5>
		                                </a>
		                            </div>
		                            <div class="rightb2box">
		                                <a href="#">
		                                    <h5 class="r2">
												<span class="button gray medium">
													<a href="#" onclick="clip(); return false;">
														URL복사
													</a>
												</span>
		                                    </h5>
		                                </a>
		                            </div>
		                        </div>
		                    </div> <!-- 라스트라인 끝 -->
							<div class="lastline">
								<div class="bigPicture">
									<div class="bigPic">

									</div>
								</div>
								<div class="uploadResult">
									<ul>

									</ul>
								</div>
							</div>
	
			                <div class="boardcontent">
			                    <div class="contentbox">
			                        <h5 class="content">
										${boardDetailView.board_content}
			                        </h5> 
			                    </div> 
			                </div><!-- 콘텐트 끝-->

							
							
							 
								
								
			                <div class="buttonbox">
								
			                    <button type="submit" formaction="boardModifyView" class="button">
			                        	<h5 class="but1">수정</h5>
			                    </button>
								
			                    <button type="submit" formaction="boardDelete" class="button">
			                        	<h5 class="but2">삭제	</h5>
			                    </button>
								
								
			                    <button type="submit" formaction="boardList" class="button">
			                        	<h5 class="but2">목록</h5>
			                    </button>
			                </div><!--버튼 끝 -->
	
						</form>   <!--폼 끝-->
						<!-- 첨부파일 출력 -->

						

						
						<!-- 댓글 시작-->
						<div>
							<input type="text" id="user_email" placeholder="작성자">
							<input type="text" id="commentContent" placeholder="내용">
							<button onclick="commentWrite()">댓글작성</button>
						</div>
						<div id="comment-list">
							<table>
								<tr>
									<th>댓글번호</th>
									<th>작성자</th>
									<th>내용</th>
									<th>작성시간</th>
								</tr>
								<c:forEach items="${commentList}" var="comment">
									<tr>
										<td>${comment.commentNo}</td>
										<td>${comment.user_email}</td>
										<td>${comment.commentContent}</td>
										<td>${comment.commentCreatedTime}</td>
									</tr>
								</c:forEach>
							</table>
						</div>
						<!-- 댓글 끝-->
						
	                </div> <!--보드 끝-->  <!-- 최소 여기에는 값 넣어야지 css 쓸 수 있음-->


	            </div> <!-- wrap 끝 -->
	        </section> <!--section 끝 -->
			
			<!-- url복사 -->
			<div class="hid">
				<textarea></textarea>
			</div>	
		<%@ include file="footer.jsp" %>
</body>

<script> // 댓글스크립트 시작 //
		const commentWrite = () => {
			const email = document.getElementById("user_email").value;
			const content = document.getElementById("commentContent").value;
			const no = "${boardDetailView.board_no}";

			$.ajax({
				 type: "post"
				,data: {
					 user_email: email
					,commentContent: content
					,board_no: no
				}
				,url: "/boardComment/boardSave"
				,success: function(commentList){
					console.log("작성성공");
					console.log(commentList);

					let output = "<table>";
						output += "<tr><th>댓글번호</th>";
						output += "<th>작성자</th>";
						output += "<th>내용</th>";
						output += "<th>작성시간</th></tr>";
						for (let i in commentList){
							output += "<tr>";
							output += "<td>"+commentList[i].commentNo+"</td>";
							output += "<td>"+commentList[i].user_email+"</td>";
							output += "<td>"+commentList[i].commentContent+"</td>";
							// output += "<td>"+commentList[i].commentCreatedTime+"</td>";
							let commentCreatedTime = commentList[i].commentCreatedTime.substring(0, 10)+" ";
							// commentCreatedTime += commentList[i].commentCreatedTime.substring(12, 13)+" ";
							commentCreatedTime += parseInt(commentList[i].commentCreatedTime.substring(12, 13))+9;
							commentCreatedTime += commentList[i].commentCreatedTime.substring(13, 16);
							output += "<td>"+commentCreatedTime+"</td>";
							output += "</tr>";
						}
						output += "</table>";
						console.log("@# output=>"+output);

						document.getElementById("comment-list").innerHTML = output;
						document.getElementById("user_email").value = "";
						document.getElementById("commentContent").value = "";
				}
				,error: function(){
					console.log("실패");
				}
			});//end of ajax
		} // 댓글스크립트 끝 //
	</script>
	<script>
		$(document).ready(function (){  // 사진보여주기 스크립트 시작 // 
			// 즉시실행함수
			(function(){
				console.log("@# document ready");
				var board_no = "<c:out value='${boardDetailView.board_no}'/>";
				console.log("@# board_no=>"+board_no);

				$.getJSON("/getFileList", {board_no: board_no}, function (arr){
					console.log("@# arr=>"+arr);

					var str="";

					$(arr).each(function (i, attach){
						//image type
						if (attach.image) {
							var fileCallPath = encodeURIComponent(attach.uploadPath +"/s_"+ attach.uuid + "_" + attach.fileName);
							str += "<li data-path='" + attach.uploadPath + "'";
							str += " data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName + "' data-type='" + attach.image + "'"
							str + " ><div>";
							str += "<span>"+attach.fileName+"</span>";
							//str += "<img src='/display?fileName="+fileCallPath+"'>";       //이미지 출력 처리(컨트롤러단)
							// str += "<span data-file=\'"+ fileCallPath +"\'data-type='image'> x </span>";
							str += "</div></li>";
						} else {
							// var fileCallPath = encodeURIComponent(attach.uploadPath +"/"+ attach.uuid + "_" + attach.fileName);
							str += "<li data-path='" + attach.uploadPath + "'";
							str += " data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName + "' data-type='" + attach.image + "'"
							str + " ><div>";
							str += "<span>"+attach.fileName+"</span>";
							// str += "<img src='./resources/img/attach.png'>";           //이미지 출력 처리(컨트롤러단)
							// str += "<span data-file=\'"+ fileCallPath +"\'data-type='file'> x </span>";
							str += "</div></li>";						
						}
					});//end of arr each

					$(".uploadResult ul").html(str);
				});//end of getJSON

				$(".uploadResult").on("click", "li", function (e){
					console.log("@# uploadResult click");
					
					var liObj = $(this);
					console.log("@# path 01=>",liObj.data("path"));
					console.log("@# uuid=>",liObj.data("uuid"));
					console.log("@# filename=>",liObj.data("filename"));
					console.log("@# type=>",liObj.data("type"));
					
					var path = encodeURIComponent(liObj.data("path") +"/"+ liObj.data("uuid") + "_" + liObj.data("filename"));
					console.log("@# path 02=>",path);

					if (liObj.data("type")) {        // 다운로드 할지 이미지 보여줄지 선택
						console.log("@# 01");
						console.log("@# view");
						self.location="/download?fileName="+path;

						// showImage(path);
					} else {
						console.log("@# 02");
						console.log("@# download");

						//컨트롤러의 download 호출
						self.location="/download?fileName="+path;
					}
				});//end of uploadResult click

				
				
				
				         // 사진 눌렀을때 큰 사진 보여주기 
				function showImage(fileCallPath){
					// alert(fileCallPath);

					$(".bigPicture").css("display","flex").show();
					$(".bigPic")
						.html("<img src='/display?fileName="+fileCallPath+"'>")
						.animate({width: "100%", height: "100%"}, 1000);
				}

				$(".bigPicture").on("click", function (e){
					$(".bigPic")
						.animate({width: "0%", height: "0%"}, 1000);
					setTimeout(function (){
						$(".bigPicture").hide();
					}, 1000);//end of setTimeout
				});//end of bigPicture click
			})();
		});  // 사진보여주기 스크립트 시작 // 
	</script>
	
	
	
	
	
	
	
	<script type="text/javascript">  // URL복사
	function clip()
	{

		var url = '';
		var textarea = document.createElement("textarea");
		document.body.appendChild(textarea);
		url = window.document.location.href;
		textarea.value = url;
		textarea.select();
		document.execCommand("copy");
		document.body.removeChild(textarea);
		alert("URL이 복사되었습니다.")
	}
	</script>
	
	
	
	
	
</html>








