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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/board_modify.css">
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

	<!-- 섹션-->
	        <section> 
	            <div class="wrap">     
	                <div class="board">
						<form method="post" action="boardModify" id="frm"> <!-- 폼 시작-->
						<input type='hidden' name='user_email' value='${logim_email}'>
							
						<input type="hidden" name="board_no" value="${pageMaker.board_no}">
						<input type="hidden" name="user_email" value="${boardModifyView.user_email}">
						<input type="hidden" name="pageNum" value="${pageMaker.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.amount}">


	                    <div class="headbox">
	                        <h5 class="head">
	                            게시글 수정
	                        </h5>
	                    </div> 
	                
						
						<div class="titlebox">
							<input class="title" type="text" name="board_title" id="title" value="${boardModifyView.board_title}">
						</div> <!-- 콘텐트박스 끝-->

						
						
						<!-- <div class="uploadDiv">
							<input type="file" name="uploadFile" multiple>
						</div>
						
						<div class="uploadResult">
							<ul>
								
							</ul>
						</div>
						
	                    <div class="uploadbox">
	                    </div>업로드 끝 -->
	                    
						
	                    <div class="contentbox">
							<textarea class="content" type="input" name="board_content" id="content" placeholder="내용을 입력해 주세요" >${boardModifyView.board_content}</textarea>
	                    </div> <!-- 콘텐트박스 끝-->
						


	                    <div class="buttonbox">
							<button onclick="check_ok();" class="button" type="button">
	                            <h5 class="but1">수정</h5>
	                        </button>
	                        <button formaction="boardList" class="button">
	                            <h5 class="but2">취소</h5>
	                        </button>
	                    </div><!--버튼 끝 -->

						</form>  <!-- 폼 끝-->
						
						
						
	                </div> <!--보드 끝-->



	            </div> <!-- wrap 끝 -->
	        </section> <!--section 끝 -->

		<%@ include file="footer.jsp" %>
</body>
</html>
<script> 
// 제목 내용 체크 스크립트 // 
function check_ok()
{
    // 이름 필수값
    if(frm.title.value.length == 0) 
    {
        alert("제목을 입력하세요");
        frm.title.focus();
        return;
    }

    // 이메일 필수값
    if(frm.content.value.length == 0) 
    {
        alert("내용을 입력하세요");
        frm.content.focus();
        return;
    }

    if(frm.title.value.length != 0 && frm.content.value.length != 0)
    {
        if(confirm("수정하시겠습니까?")) {
            alert("수정되었습니다");
            $('#frm').submit();
        }
    }
} // check_ok 끝   
// 제목 내용 체크 스크립트 // 
</script> 

<script>
	// 파일추가 스크립트 시작 // 
	$(document).ready(function (e) {
    var formObj = $("form[id='frm']");

    $("button[type='submit']").on("click", function(e) {
        e.preventDefault();
        console.log("submit clicked");

        var str = "";

        $(".uploadResult ul li").each(function (i, obj) {
            var jobj = $(obj);
            str += "<input type='hidden' name='attachList[" + i + "].fileName' value='" + jobj.data("filename") + "'>";
            str += "<input type='hidden' name='attachList[" + i + "].uuid' value='" + jobj.data("uuid") + "'>";
            str += "<input type='hidden' name='attachList[" + i + "].uploadPath' value='" + jobj.data("path") + "'>";
            str += "<input type='hidden' name='attachList[" + i + "].image' value='" + jobj.data("type") + "'>";
        });

        formObj.append(str).submit();
    });

    var regex = new RegExp("(.*?)\.(exe|sh|alz)$");
    var maxSize = 5242880;

    function checkExtension(fileName, fileSize) {
        if (fileSize >= maxSize) {
            alert("파일 사이즈 초과");
            return false;
        }
        if (regex.test(fileName)) {
            alert("해당 종류의 파일은 업로드할 수 없습니다.");
            return false;
        }
        return true;
    }

    $("input[type='file']").change(function (e) {
        var formData = new FormData();
        var inputFile = $("input[name='uploadFile']");
        var files = inputFile[0].files;

        for (var i = 0; i < files.length; i++) {
            if (!checkExtension(files[i].name, files[i].size)) {
                return false;
            }
            formData.append("uploadFile", files[i]);
        }

        $.ajax({
            type: "post",
            data: formData,
            url: "uploadAjaxAction",
            processData: false,
            contentType: false,
            success: function(result) {
                alert("Uploaded");
                showUploadResult(result);
            }
        });
    });

    function showUploadResult(uploadResultArr) {
        if (!uploadResultArr || uploadResultArr.length == 0) {
            return;
        }

        var uploadUL = $(".uploadResult ul");
        var str = "";

        $(uploadResultArr).each(function (i, obj) {
            if (obj.image) {
                var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
                str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'>";
                str += "<div>";
                str += "<span>" + obj.fileName + "</span>";
                str += "<span data-file='" + fileCallPath + "' data-type='image'>파일삭제</span>";
                str += "</div></li>";
            } else {
                var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
                str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'>";
                str += "<div>";
                str += "<span>" + obj.fileName + "</span>";
                str += "<span data-file='" + fileCallPath + "' data-type='file'>파일삭제</span>";
                str += "</div></li>";
            }
        });

        uploadUL.append(str);
    }

    $(".uploadResult").on("click", "span", function() {
        var targetFile = $(this).data("file");
        var type = $(this).data("type");
        var uploadResultItem = $(this).closest("li");

        $.ajax({
            type: "post",
            data: { fileName: targetFile, type: type },
            url: "deleteFile",
            success: function(result) {
                alert(result);
                uploadResultItem.remove();
            }
        });
    });
});



</script>