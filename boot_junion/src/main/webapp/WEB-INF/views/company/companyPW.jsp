<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
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
/* .popU
{
  display: flex;
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  background:rgba(0,0,0,0.6);
} */
.popCon
{
    background-color: #fff;
    width: 500px;
    height: 300px;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%,-50%);
    border-radius: 15px;
    padding: 20px;
    display: grid;
}

.popMain
{
    width: 460px;
    justify-content: center;
    margin-left: 20px;
}

.popH
{
    display: flex;
    justify-content: center;
    font-size: var(--font-size24);
}

.popH .icon
{
    margin-left: auto;
}


.popM
{
    margin-top: 30px;
}

.popX
{
    margin-top: 20px;
}

.popX .pwRE
{
    display: flex;
    margin-bottom: 15px;
    align-items: center;
}

.popMain .pwRE .disW
{
    margin-bottom: 10px;
}

.popX .pwRE .nowPw
{
    font-size: var(--font-size16);
    font-weight: 100;
}

.popX .pwRE .nowPwIn
{
    margin-left: auto;
    border-radius: 6px;
}

.popB
{
    display: flex;
    justify-content: center;
}

.popB .submit
{
    background-color: var(--main-color);
    justify-content: center;
    color: var(--color-white);
    border-radius: 6px;
    padding: 10px 30px;
    border: none;
}

.pwValue
{
    height: 30px;
    width: 250px;
    border-radius: 6px;
    border: 1px solid var(--border-color-gray);
    padding: 0 20px;
}
</style>
</head>
<body>
    
    <div class="popU">
        <form method="post" action="/passwordchange">
            <div class="popCon disF flexD">
                <div class="popMain">
                    <div class="popM">
                        <div class="popH mlauto">
                            <h5 class="title">비밀번호 변경</h5>
                        </div>
                        <div class="popX">
                            <div class="pwRE on">
                                <h5 class="nowPw">현재 비밀번호</h5>
                                <div class="nowPwIn">
                                    <input type="password" class="pwValue" id="user_pw_check" minlength="8" maxlength="20" required >
                                </div>
                            </div>
                            <div class="disW" id="passwordCheck"></div>
                            <div class="pwRE tw">
                                <h5 class="nowPw">변경할 비밀번호</h5>
                                <div class="nowPwIn">
                                    <input type="password" class="pwValue" id="changePassword" minlength="8" maxlength="20" placeholder="영문자, 숫자, 특수문자 포함 총 8~20자" required >
                                </div>
                            </div>
                            <div class="pwRE th">
                                <h5 class="nowPw">변경 비밀번호 확인</h5>
                                <div class="nowPwIn">
                                    <input type="password" class="pwValue" id="changePasswordCh" minlength="8" maxlength="20" placeholder="영문자, 숫자, 특수문자 포함 총 8~20자" required >
                                </div>
                            </div>
                            <div class="disW" id="resultPassword"></div>
                        </div><!--popX 내용-->
                    </div>
                    <div class="popB">
                        <button type="submit" class="submit tabBtn">전송</button>
                    </div>
                </div><!--popCon disF flexD-->
            </div><!--popMain-->
        </form>
    </div><!--popU-->
</body>
</html>
<script>
$(document).ready(function(){
    var sessionPassword = "${login_pw}";
    
    function validatePasswords() {
    // 비밀번호 자릿수 체크 + 숫자&특문포함 + 중복일치			
		var passwordRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{8,20}$/;
        // console.log(sessionPassword);
		// var nowPassword = document.getElementById('user_pw_check').val();
		var nowPassword = $('#user_pw_check').value;
		// var changePassword = document.getElementById('changePassword').value;
		var changePassword = $('#changePassword').value;
		// var changePasswordCh = document.getElementById('changePasswordCh').value;
		var changePasswordCh = $('#changePasswordCh').value;
		var resultPassword = document.getElementById('resultPassword');


        if (nowPassword === sessionPassword) {
                    if (passwordRegex.test(changePassword)) {
                        if (changePassword === changePasswordCh) {
                            resultPassword.innerHTML='비밀번호가 일치합니다.';
                            resultPassword.css('color', 'var(--main-color)');
                            return true;
                        } else {
                            resultPassword.innerHTML='변경 비밀번호가 일치하지 않습니다.';
                            resultPassword.style.color = 'red';
                            return false;
                        }
                    } else {
                        resultPassword.innerHTML = '비밀번호는 최소 8자리에서 20자리까지, 영문자, 숫자, 특수문자를 포함해야합니다.';
			            resultPassword.style.color = 'red';
                        return false;
                    }
                } else {
                    resultPassword.innerHTML='현재 비밀번호가 일치하지 않습니다.';
                    resultPassword.style.color = 'red';
                    return false;
                }
            }
            // $('#user_pw_check, #changePassword, #changePasswordCh').on('keyup', function() {
            $(nowPassword, changePassword, changePasswordCh).on('keyup', function() {
                var check = validatePasswords();
                console.log(check);
                // 입력 값의 변경을 실시간으로 확인하기 위해 keyup 이벤트를 사용

                if(check){
                    $.ajax({
                            type : "post",
                            url : "/comPwChange",
                            data : {changePassword : changePassword, changePasswordCh :changePasswordCh },
                            success : function(){
                                alert("비밀번호 변경이 완료되었습니다.");
                                window.close();
                            }
                    })//end of ajax
                }//if문
            });//end of keyup function
    });
</script>