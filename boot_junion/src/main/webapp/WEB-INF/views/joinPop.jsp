<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>개인_회원가입</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<!-- import js -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
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
	--font-size16: 16px;
	--font-size14: 14px;
	--font-size12: 12px;
}

.popupJoin
{
    display: block;
    position: fixed;
    top:0;
    left: 0;
    width: 100vw;
    height: 100vh;
    overflow: hidden;
    background: rgba(0,0,0,0.5);
}

.popupJoin.B 
{
    display: none;
}

.popupJoin .popupJoinCon
{
    position: absolute;
    width: 500px;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    padding: 24px;
    background: #fff;
    border-radius: 15px;
    padding-bottom: 28px;
}

.popupJoinCon h2
{
    font-size: var(--font-size24);
    text-align: center;
    margin: 3px;
    margin-bottom: 10px;
}
.popupJoin .tabH button
{
    min-width: 120px;
	padding: 10px 20px;
    background-color: var(--color-white);
    border: solid 1px var(--input-gray);
    border-radius: 6px;   
    cursor: pointer;
    font-size: var(--font-size12);

}
.popupJoin .tabH
{
    display: flex;
    justify-content: center;
    border-bottom: solid 1px var(--border-color-gray);
    margin: 20px 0;
    gap: 20px;
	padding-bottom: 20px;
}

.popupJoinCon
{
    display: block;
    max-width: 1200px;
}

.popupJoin .tabConTech 
{
    display: block;
    max-width: 1200px;
}

.popupJoin .tabConTech .po, .popupJoin .tabConTech .tech
{
    margin: 10px 10px 5px 0;
    border: 1px solid var(--input-gray);
    border-radius: 6px;
    padding: 12px 20px;
    width: initial;
    cursor: pointer;
    font-size: var(--font-size14);
}

.popupJoin .tabConTech .po.on, .popupJoin .tabConTech .tech.on 
{
    background-color: var(--color-black);
    color: var(--color-white);
}

.popupJoin .tabOk
{
    display: flex;
    justify-content: center;
    margin-top: 40px;
	gap: 10px;
}

.popupJoin .tabOk button, .popupJoin .tabOk input
{
    min-width: 120px;
	padding: 10px 20px;
    background-color: var(--color-white);
    border: solid 1px #e5e5ec;
    border-radius: 6px;
    color: var(--color-black);
    font-size: var(--font-size14);
    cursor: pointer;
}

.popupJoin .tabOk button:hover, 
.popupJoin .tabOk input:hover 
{
	background-color: var(--color-black);
	color: var(--color-white);
	border: solid 1px var(--color-black);	
}

.popupJoinCon .tabConTech.two, .tabConTech.three, .tabConTech.five, .tabConTech.six 
{
    display: none;
}

.popupJoin .tabH button.active
{
    background-color: var(--color-black);
    color: var(--color-white);
}

.tabConTech button.tech.active
{
    background-color: var(--main-color);
    color: var(--color-white);
    border: 0;
}

.popupJoinConX
{
    display: flex;
    justify-content: center;
}

.popupJoinConX h2
{
    margin-left: auto;
}

.popupJoinConX i 
{
    margin-left: auto;
    font-size: 24px;
    cursor: pointer;
}
/* 회원가입_개인_2단계 끝 */

</style>
</head>
<body>            
    <div class="popupJoin A">
        <div class="popupJoinCon">
            <div class="popupJoinConX">
                <h2>희망 직무</h2>
                <i class="fa-solid fa-xmark closebtn"></i>
            </div>    
            <div class="tabH">
                <button id="tabFour" class="tabCon active">개발</button>
                <button class="tabCon" id="tabFive">디자인</button>
                <button class="tabCon" id="tabSix">기획</button>
            </div> <!--희망직무 탭 선택 -->
            <input type="hidden" id="cInput">
            <div class="tabConTech four">
                <c:forEach var="dto" items="${stack_name}">
                    <input type="button" class="tech" name="user_stack" value="${dto.stack_name}">
                </c:forEach>                
            </div> <!-- tabConTech four 끝-->
            <div class="tabConTech five">
                <c:forEach var="dto" items="${stack_name2}">
                    <input type="button" class="tech" name="user_stack" value="${dto.stack_name}">
                </c:forEach> 
            </div> <!--tabConTech five 끝-->
            <div class="tabConTech six">
                <c:forEach var="dto" items="${stack_name3}">
                    <input type="button" class="tech" name="user_stack" value="${dto.stack_name}">
                </c:forEach> 
            </div> <!--tabConTech six 끝-->
            <div class="tabOk">
                <button class="techOk closebtn" type="button">저장</button>
                <input type="button" value="전달" onclick="setParentText()">                
                <button class="techOk closebtn" type="button" onclick="window.close()">확인</button>
            </div>
            </div>
        </div> <!--회원가입_개인2 popupJoinCon 끝-->
    </div> <!--회원가입_개인2 popupJoin A 끝-->    
</body>

</html>
<script>
function setParentText()
{
    opener.document.getElementById("pInput").value = document.getElementById("cInput").value
}
(function () {
    $.get("/joinPop", function(data) {
        // 요청이 성공적으로 처리되었을 때 실행되는 콜백 함수
        console.log("Received data:", data);
        // 여기서 데이터를 원하는 방식으로 처리할 수 있습니다.
    });
})();

   
$(document).ready(function()
{
    // 2단계 주요기술 탭 선택시 발동
    var buttons2 = $('.tabConTech .tech');
    var cInput = $('#cInput');
    var submit2 = $('button.techOk');

    // 버튼 클릭 시 'on' 클래스 토글
    buttons2.on('click', function() {
        $(this).toggleClass('on');
    });

    // 제출 버튼 클릭 시
    submit2.on('click', function() {
        // 'on' 클래스가 있는 버튼들의 값을 배열에 저장
        var buttonValues2 = [];
        buttons2.filter('.on').each(function() {
            buttonValues2.push($(this).val());
        });

        // AJAX 요청을 통해 서버로 데이터 전송
        $.ajax({
            url: "/joinIndividualTwo", // 실제 서버 엔드포인트 URL
            type: "POST",  
            async: false,          
            data: JSON.stringify({user_stacks: buttonValues2}),
            success: function(response) {
                // 선택된 값을 wishJob 입력 필드에 쉼표로 구분된 문자열로 표시
                cInput.val(buttonValues2.join(', '));
            },
            error: function(response) {
                // 요청 중 오류 발생 시 처리
                console.error(response);
            }
        });

        // buttons2.filter('.on').each(function() {
        // 	$(this).removeClass('on');
        // });			
    });

    $('.tabH .tabCon').click(function(){ 
        // buttons.filter('.on').each(function() {
        //     $(this).removeClass('on');
        // });
        $(this).addClass('active');
        $('.tabH .tabCon').not(this).removeClass('active');
    });
    

    // 회원가입 2단계 개인 주요기술 팝업 탭 (하지수)

    $('#tabFour').click(function () {
        $('#tabFour').addClass('active');
        $('#tabFive').removeClass('active');
        $('#tabSix').removeClass('active');
        $(".tabConTech.four").show();
        $(".tabConTech.five").hide();
        $(".tabConTech.six").hide();
        console.log("4번작동");
    });
    

    $('#tabFive').click(function () {
        $('#tabFive').addClass('active');
        $('#tabFour').removeClass('active');
        $('#tabSix').removeClass('active');
        $(".tabConTech.four").hide();
        $(".tabConTech.five").show();
        $(".tabConTech.six").hide();
    });

    $('#tabSix').click(function () {
        $('#tabSix').addClass('active');
        $('#tabFour').removeClass('active');
        $('#tabFive').removeClass('active');
        $(".tabConTech.four").hide();
        $(".tabConTech.five").hide();
        $(".tabConTech.six").show();
    });

    //버튼 클릭시 활성화
    $(".tabConTech input.tech").click(function() {
        $(this).toggleClass("active");
    });

    $(".tabConTech input.tech").click(function() {
        $(this).toggleClass("active");
    });

    $(".tabConTech input.tech").click(function() {
        $(this).toggleClass("active");

    });
}); //document.ready 끝
</script>