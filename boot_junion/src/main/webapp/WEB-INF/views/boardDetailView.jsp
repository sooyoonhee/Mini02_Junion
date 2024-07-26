<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
						<form id="boardForm" method="post" action="boardModifyView">  <!--  폼 시작 -->
							
							<input type='hidden' name='user_email' id='user_email' value='${logim_email}'>
							
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
		                                    추천수 ${boardDetailView.board_like_count}
		                                </h5>
		                            </div>
		                        </div>
		                        <div class="line2">
									<div class="rightb1box">
										<h5 class="r2">
											<a href="#" id="likeButton" class="r1">
												추천하기
											</a>
										</h5>
									</div>
									
		                            <div class="rightb2box">
		                                <div>
		                                    <h5 class="r2">
												<span >
													<a href="#" onclick="clip(); return false;">
														URL복사
													</a>
												</span>
		                                    </h5>
		                                </div>
		                            </div>
		                        </div>
		                    </div> <!-- 라스트라인 끝 -->
							
							<div id="uploadSection" class="lastline">  <!-- 파일이 없을 시 출력하지않기위해 id="uploadSection" 추가함-->
								<div class="uploadResult">
									<ul></ul>
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

								<button type="button" class="button" onclick="validateAndSubmit('boardModifyView')">
									<h5 class="but1">수정</h5>
								</button>
			
								<button type="button" class="button" onclick="validateAndSubmit('boardDelete')">
									<h5 class="but2">삭제</h5>
								</button>
			
			                    <button type="submit" formaction="boardList" class="button">
									<h5 class="but2">목록</h5>
								</button>

			                </div><!--버튼 끝 -->

							
						</form>   <!--폼 끝-->

						

						
						<!-- 댓글 시작-->
						<div class="combox">
							<!-- <input type="text" id="user_email" placeholder="작성자" > -->
							<input type="text" id="commentContent" class="commentbox" placeholder="내용을 입력해주세요">
                            <div class="buttonbox2">
                                <button onclick="commentWrite()" class="button">
                                    <h5 class="but2">등록</h5>
                                </button>
                            </div>
						</div>
						<div id="comment-list">
							<div class="divcom">
								<c:forEach items="${commentList}" var="comment">
									<div class="divcom1">
										<h5 class="comh1">${comment.user_email}</h5>
										<h5 class="comh2">${comment.commentContent}</h5>
										<div class="comh3">
											<fmt:formatDate value="${comment.commentCreatedTime}" pattern="yyyy-MM-dd HH:mm" />
										</div>
									</div>
								</c:forEach>
							</div>
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

<script>

	// 댓글스크립트 시작 //
const commentWrite = () => {
    const email = document.getElementById("user_email").value;
    const content = document.getElementById("commentContent").value;
    const no = "${boardDetailView.board_no}";

    // 내용이 비어 있거나 공백만 있을 때
    if (!content.trim()) {
        alert("내용이 없습니다.");
        return; // 함수 종료
    }

    $.ajax({
        type: "post",
        data: {
            user_email: email,
            commentContent: content,
            board_no: no
        },
        url: "/boardComment/boardSave",
        success: function() {
            console.log("작성성공");
            // 페이지 새로 고침
            location.reload();
        },
        error: function() {
            console.log("실패");
        }
    }); // end of ajax
} // 댓글스크립트 끝 //

		
	
	
$(document).ready(function () {  
    // 즉시 실행 함수
    (function() {
        console.log("@# document ready");
        var board_no = "<c:out value='${boardDetailView.board_no}'/>";
        console.log("@# board_no=>" + board_no);

        $.getJSON("/getFileList", {board_no: board_no}, function (arr) {
            console.log("@# arr=>" + arr);

            var str = "";
            var hasFiles = false; // 파일이 있는지 여부를 체크하는 변수

            $(arr).each(function (i, attach) {
                // image type
                if (attach.image) {
                    var fileCallPath = encodeURIComponent(attach.uploadPath + "/s_" + attach.uuid + "_" + attach.fileName);
                    str += "<li data-path='" + attach.uploadPath + "'";
                    str += " data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName + "' data-type='" + attach.image + "'"
                    str += " ><div>";
                    str += "<span>" + attach.fileName + "</span>";
                    // str += "<img src='/display?fileName=" + fileCallPath + "'>"; // 이미지 출력 처리(컨트롤러단)
                    // str += "<span data-file=\'" + fileCallPath + "\'data-type='image'> x </span>";
                    str += "</div></li>";
                    hasFiles = true; // 파일이 있음을 표시
                } else {
                    // var fileCallPath = encodeURIComponent(attach.uploadPath +"/"+ attach.uuid + "_" + attach.fileName);
                    str += "<li data-path='" + attach.uploadPath + "'";
                    str += " data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName + "' data-type='" + attach.image + "'"
                    str += " ><div>";
                    str += "<span>" + attach.fileName + "</span>";
                    // str += "<img src='./resources/img/attach.png'>"; // 이미지 출력 처리(컨트롤러단)
                    // str += "<span data-file=\'" + fileCallPath + "\'data-type='file'> x </span>";
                    str += "</div></li>";
                    hasFiles = true; // 파일이 있음을 표시
                }
            }); // end of arr each

			
            if (hasFiles) {
                $(".uploadResult ul").html(str);
            } else {   // 파일이 없을 때 uploadSection 숨기기
                $("#uploadSection").hide(); 
            }


        }); // end of getJSON

        $(".uploadResult").on("click", "li", function (e) {
            console.log("@# uploadResult click");

            var liObj = $(this);
            console.log("@# path 01=>", liObj.data("path"));
            console.log("@# uuid=>", liObj.data("uuid"));
            console.log("@# filename=>", liObj.data("filename"));
            console.log("@# type=>", liObj.data("type"));

            var path = encodeURIComponent(liObj.data("path") + "/" + liObj.data("uuid") + "_" + liObj.data("filename"));
            console.log("@# path 02=>", path);

            if (liObj.data("type")) { // 다운로드 할지 이미지 보여줄지 선택
                console.log("@# 01");
                console.log("@# view");
                self.location = "/download?fileName=" + path;
                // showImage(path);
            } else {
                console.log("@# 02");
                console.log("@# download");
                // 컨트롤러의 download 호출
                self.location = "/download?fileName=" + path;
            }
        }); // end of uploadResult click

        // 사진 눌렀을 때 큰 사진 보여주기 
        function showImage(fileCallPath) {
            // alert(fileCallPath);

            $(".bigPicture").css("display", "flex").show();
            $(".bigPic")
                .html("<img src='/display?fileName=" + fileCallPath + "'>")
                .animate({width: "100%", height: "100%"}, 1000);
        }

        $(".bigPicture").on("click", function (e) {
            $(".bigPic")
                .animate({width: "0%", height: "0%"}, 1000);
            setTimeout(function () {
                $(".bigPicture").hide();
            }, 1000); // end of setTimeout
        }); // end of bigPicture click
    })(); // 즉시 실행 함수
}); // document ready
	
	
	
	// 수정, 삭제 클릭시 자신이 쓴 글 맞는지 유효성검사 , 삭제시 팝업
	function validateAndSubmit(action) {
		const user_email = document.getElementById("user_email").value;
		const authorEmail = "${boardDetailView.user_email}";

		if (user_email !== authorEmail) {
			alert("작성자만 수정 및 삭제할 수 있습니다.");
			return;
		}
		if (action === 'boardDelete') {
			if (confirm("정말로 삭제하시겠습니까?")) {
				alert("삭제 되었습니다");
				const form = document.getElementById("boardForm");
				form.action = action;
				form.submit();
			}
		} else {
			const form = document.getElementById("boardForm");
			form.action = action;
			form.submit();
		}

    }
	
	
	  // URL복사
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


	$(document).ready(function () {
    $('#likeButton').on('click', function (e) {
        e.preventDefault(); // 기본 동작 방지

        const board_no = "${boardDetailView.board_no}";
        const user_email = "${logim_email}"; // 현재 로그인한 사용자의 이메일

        // AJAX 요청
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/boardLike",
            data: {
                board_no: board_no,
                user_email: user_email
            },
            success: function(response) {
                // 성공적으로 좋아요가 추가된 경우
                alert(response);
                // 좋아요 수를 업데이트
                let likeCountElement = $('.heartbox h5.heart');
                let currentLikeCount = parseInt(likeCountElement.text().replace('추천수 ', ''));
                likeCountElement.text('추천수 ' + (currentLikeCount + 1));
            },
            error: function(xhr, status, error) {
                // 이미 좋아요를 누른 경우
                if (xhr.status === 409) {
                    alert(xhr.responseText);
                } else {
                    alert('추천수 처리에 실패했습니다.');
                }
            }
        });
    });
});




	</script>
	
</html>








