<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<link rel="stylesheet" href="css/default.css">
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<!-- import js -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<!-- <script src="js/index.js"></script>   -->
</head>
<style>
:root 
{
  /* 컬러 모음 */
  --main-color:#FFA500;
  --color-black: #111;
  --color-white: #fff;
  --color-gray: #787878;
  --input-gray: #e5e5ec;
  --button-gray: #f7f7f7;
  --border-color-gray: #dadada;
  --font-size32: 32px;
  --font-size24: 24px;
  --font-size20: 20px;
  --font-size16: 16px;
  --font-size14: 14px;
  --font-size12: 12px;
}

section
{
    padding: 70px 30px;
    width: 500px;
}

section .noticeProfile
{
    margin-bottom: 20px;
    border-bottom: 1px solid var(--border-color-gray);
}

section .noticeProfile .comName
{

    font-size: var(--font-size16);
}
section .title
{

    font-size: var(--font-size20);
    font-weight: bold;
    margin-bottom: 10px;
}

section .sectionInner .list .profileList
{

    width: 500px;
    height: 40px;
    margin-bottom: 10px;
    padding: 5px 30px 5px 10px;
    border-radius: 6px;
    box-sizing: border-box;
    font-size: var(--font-size16);
}

section .sectionInner .name
{
    border: none;
}

section .sectionInner .user
{
    font-size: var(--font-size14);
    margin-bottom: 10px;
}

section .sectionInner .resumeButton
{
    display: flex;
    justify-content: center;
}

section .sectionInner .resumeButton .resume
{
    padding: 10px 40px;
    background-color: var(--main-color);
    font-size: var(--font-size14);
    border-radius: 6px;
    color: var(--color-white);
    border: none;
    cursor: pointer;
}

</style>
<body>
    <div class="container">
        <section>
            <div class="sectionInner">
                    <!-- <form method="post" action="/resumeUser"> -->
                        <input type="hidden" name="notice_num" id="notice_num">
                        <input type="hidden" name="com_email" id="com_email" value=${notice.com_email}>
                    <div class="noticeProfile">
                        <div class="comName">${notice.com_name}</div>
                        <div class="noticeTitle">
                            <h5 class="title">${notice.notice_title}</h5>
                        </div>
                    </div><!--noticeProfile : 공고 정보 출력-->
                    <div class="profile">
                        <div class="profileTitle">
                            <h5 class="title">지원 이력서</h5>
                        </div>
                        <div class="list">
                            <select name="resume_num" class="profileList" id="resume_num">
                            <!-- <select name="resume_num" id="resume_num" class="profileList"> -->
                                <option value="" selected>이력서를 선택해 주세요</option>
                                <c:forEach var="userProfile" items="${userProfile}">
                                    <option value="${userProfile.resume_num}">${userProfile.resume_title}
                                    <!-- <input type="hidden" name="${userProfile.resume_num}"> -->
                                    </option>
                                </c:forEach>
                            </select>
                            <div class="user">
                                지원자명  :${user_name}
                            </div>
                        </div><!--list-->
                    </div><!--profile : 이력서 영역-->
                    <div class="resumeButton">
                        <button type="button" class="resume" onclick="resumeOK()">지원하기</button>
                    </div>
                <!-- </form> -->
                </div><!--sectionInner-->
        </section>  
    </div><!--container-->
</body>
</html>
<script>
    // 24.07.12 하진
$(document).ready(function() {
    function check() {
        var selectedResume = $(".profileList").val();
        console.log(selectedResume);
    }

    function getQueryStringValue(key) {//현재 페이지 URL에서 쿼리스트링으로 넣은 notice_num 값을 가져오는 함수
        const urlParams = new URLSearchParams(window.location.search);
        return urlParams.get(key);
    }

    function insertQueryValue() {
        const queryValue = getQueryStringValue('notice_num');// 가져오고자 하는 쿼리스트링 이름
        if (queryValue) {// 쿼리스트링 이름이 있으면 함수 실행
            $('#notice_num').val(queryValue);
        }
    }

    insertQueryValue();// 함수 실행

});

//24.07.13 하진
function resumeOK(){
    var notice_num = document.getElementById("notice_num").value;
    console.log("submit!!"+notice_num);
    var resume_num = document.getElementById("resume_num").value;
    console.log("submit!!"+resume_num);

    if(resume_num){
        $.ajax({
                type : "POST",
                url : "/resumeUser",
                data : {notice_num : notice_num, resume_num : resume_num},
                success : function(){
                    // if(resumeResult == true){
                    //     console.log(resumeResult);
                    alert("지원이 완료되었습니다!");
                    window.close();
                    }
                //     else{
                //     alert("해당 이력서로 이미 지원한 공고입니다.");
                // }
            // }    
        });//end of ajax
    }else{
        alert("이력서를 선택해주세요.");
    }
}//end of resumeOK
</script>