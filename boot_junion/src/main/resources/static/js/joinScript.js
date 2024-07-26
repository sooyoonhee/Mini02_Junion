// 회원가입 유효성 검사

	// 이메일 필수값
	if(joinIndividual.user_email.value.length ==0) 
	{
		alert("이메일을 입력하세요!");
		joinIndividual.user_emai.focus();
		return;
	}
	// 비밀번호 자릿수 체크 + 숫자&특문포함 + 중복일치 
	
	var passwordRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{8,20}$/;
	var newPassword = document.getElementById('user_pw').value;
	var confirmPassword = document.getElementById('user_pw_check').value;
	var resultPassword = document.getElementById('resultPassword');

	if(passwordRegex.test(newPassword)) 
	{
		if(newPassword == confirmPassword) 
		{
			resultPassword.innerHTML = '비밀번호가 일치하며 유효합니다';
			resultPassword.style.color = 'var(--main-color)';
		}
		else 
		{
			resultPassword.innerHTML = '비밀번호가 일치하지않습니다';
			resultPassword.style.color = 'red';
		}
	}
	else 
	{
		resultPassword.innerHTML = '비밀번호는 최소 8자리에서 20자리까지, 영문자, 숫자, 특수문자를 포함해야합니다.';
			resultPassword.style.color = 'red';
	}



