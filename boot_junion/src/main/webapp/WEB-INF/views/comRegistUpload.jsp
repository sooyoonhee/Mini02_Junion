<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공고등록 페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/comRegistUpload.css">
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<!-- import js -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>

</head>
<body>
	<div class="container">
		<%@ include file="header.jsp" %>
			<main>
            <div class="mainInner">
                <!-- <form id="registUpload" method="post" action="registerNotice" class="post" name="notice"> -->
                <form id="registUpload" method="post" action="registerNotice" class="post" name="notice">
                    <div class="noitceImage">
                        <input type="file" name="uploadFile" id="file">
						<div class="uploadResult">
							<ul class="comNoticeImage">
							</ul>
						</div>
                        <label for="file" class="imgAddLabel">
							<div class="comImage">
								<div class="building">
								</div>                                
                            </div>
							<h3 style="cursor: pointer;">이미지 등록</h3>
                        </label>
                    </div>
					
                    <div class="postContainer">
                        <div class="postValue">
                            <h5 class="value">공고명 </h5>
                            <input type="text" class="postTitle" name="notice_title" placeholder="공고명을 입력해 주세요." required>
                        </div>
                        <div class="postValue">
                            <h5 class="value">기업명 </h5>
                            <input type="text" class="postCompany" name="com_name" placeholder=${com_name} disabled>
                        </div>

                        <div class="postValue">
                            <h5 class="value">포지션 </h5>
                            <input type="text" class="postPosition" name="notice_job" placeholder="모집하는 포지션을 입력해주세요." required>
                        </div>

                        <div class="postValue">
                            <h5 class="value">모집 인원 </h5>
                            <span>
                                <input type="number" class="people" name="notice_recruitNum" placeholder="모집 인원을 숫자만 입력해주세요." required>
                            </span>
                        </div>

                        <div class="location">
                            <h5 class="value"> 근무 지역 </h5>
                            <div class="workLocation">
                                <div class="search_box">
                                    <select onchange="categoryChange(this)" class="region" required>
										<option value>시/도 선택</option>
									    <option value="강원">강원</option>
									    <option value="경기">경기</option>
									    <option value="경남">경남</option>
									    <option value="경북">경북</option>
									    <option value="광주">광주</option>
									    <option value="대구">대구</option>
									    <option value="대전">대전</option>
									    <option value="부산">부산</option>
									    <option value="서울">서울</option>
									    <option value="울산">울산</option>
									    <option value="인천">인천</option>
									    <option value="전남">전남</option>
									    <option value="전북">전북</option>
									    <option value="제주">제주</option>
									    <option value="충남">충남</option>
									    <option value="충북">충북</option>
                                    </select>
									<input type="hidden" name="notice_area1" id="notice_area1" >
                                  </div>
                                  <div class="search_box">
                                    <select id="state" class="constituency" onchange="updateDistrict(this)" required>
                                      <option>군/구 선택</option>
                                    </select>
									<input type="hidden" name="notice_area2" id="notice_area2" >
                                  </div>
                            </div>
                        </div><!--accept-->

                        <div class="career">
                            <h5 class="value"> 희망 경력 </h5>
                            <div class="year">
								<input type="checkbox" class="checkboxCarrer" name="notice_career" value="신입">&nbsp;&nbsp;<label for="new">신입</label>
						        <input type="checkbox" class="checkboxCarrer" name="notice_career" value="1~3년">&nbsp;&nbsp;<label for="one">1~3년</label>
						        <input type="checkbox" class="checkboxCarrer" name="notice_career" value="3~5년">&nbsp;&nbsp;<label for="three">3~5년</label>
						        <input type="checkbox" class="checkboxCarrer" name="notice_career" value="5~7년">&nbsp;&nbsp;<label for="five">5~7년</label>
						        <input type="checkbox" class="checkboxCarrer" name="notice_career" value="경력무관">&nbsp;&nbsp;<label for="any">경력무관</label>
                            </div><!--year-->
                        </div><!--career-->

                        <div class="salay">
                            <h5 class="value">급여 </h5>
                            <span>
                                <select name="notice_pay1" class="pay">
                                    <option value="연봉" selected>연봉</option>
                                    <option value="월급">월급</option>
                                    <option value="면접 후 결정">면접 후 결정</option>
                                </select>
                            </span>
                            <span class="none">
                                <input type="number" class="postPay" name="notice_pay2" placeholder="급여를 입력해주세요." required> 만원
                            </span>
                            <div class="lowPay">(2024년 최저시급 9,860원)</div>
                        </div><!--salay-->

                        <div class="accept">
                            <h5 class="value"> 접수 기간 </h5>
                            <div class="day">
                                <span>
                                    <input type="date" id="currentDate" class="date" name="notice_startDate" required>
                                </span>
                                ~
                                <span>
                                    <input type="date" id="endDate" class="date" name="notice_endDate" required>
                                </span>
                            </div>
                        </div><!--accept-->

                        <div class="work">
                            <h5 class="value"> 근무 형태 </h5>
                            <div class="workType">
								<input type="checkbox" class="checkboxContact" name="notice_contactType" value="정규직">&nbsp;&nbsp;<label for="real">정규직</label>
						        <input type="checkbox" class="checkboxContact" name="notice_contactType" value="계약직">&nbsp;&nbsp;<label for="get">계약직</label>
						        <input type="checkbox" class="checkboxContact" name="notice_contactType" value="인턴직">&nbsp;&nbsp;<label for="inten"> 인턴직</label>
						        <input type="checkbox" class="checkboxContact" name="notice_contactType" value="프리랜서">&nbsp;&nbsp;<label for="pre">프리랜서</label>
                            </div>
                        </div><!--type(근무 형태)-->
                        <div class="workDepart">
                            <h5 class="value"> 근무 부서 </h5>
                            <span>
                                <input type="text" class="department" name="notice_department" placeholder="근무 부서를 입력해주세요." required>
                            </span>
                        </div>
                        <div class="postValue">
                            <h5 class="value"> 직책 </h5>
                            <span>
                                <input type="text" class="job" name="notice_position" placeholder="직책을 입력해주세요." required>
                            </span>
                        </div>

                        <div class="sectionTech">
                            <h5 class="sectionTitle">기술 스택 · 툴</h5>
							<div class="sectionBody">
							    <div class="Bodycon IT">
							        <div class="techName">개발</div>
							        <div class="itTech">
							            <button type="button" class="tech" data-tech="JAVA">JAVA</button>
							            <button type="button" class="tech" data-tech="iOS">iOS</button>
							            <button type="button" class="tech" data-tech="Android">Android</button>
							            <button type="button" class="tech" data-tech="PHP">PHP</button>
							            <button type="button" class="tech" data-tech="ASP">ASP</button>
							            <button type="button" class="tech" data-tech=".NET">.NET</button>
							            <button type="button" class="tech" data-tech="JavaScript">JavaScript</button>
							            <button type="button" class="tech" data-tech="Node.js">Node.js</button>
							            <button type="button" class="tech" data-tech="React.js">React.js</button>
							            <button type="button" class="tech" data-tech="Vue.js">Vue.js</button>
							            <button type="button" class="tech" data-tech="DB">DB</button>
							            <button type="button" class="tech" data-tech="C">C</button>
							            <button type="button" class="tech" data-tech="C++">C++</button>
							        </div>
							    </div>
							    <div class="Bodycon Design">
							        <div class="techName">디자인</div>
							        <div class="designTech">
							            <button type="button" class="tech" data-tech="Adobe XD">Adobe XD</button>
							            <button type="button" class="tech" data-tech="Sketch">Sketch</button>
							            <button type="button" class="tech" data-tech="Zepline">Zepline</button>
							            <button type="button" class="tech" data-tech="Premiere">Premiere</button>
							            <button type="button" class="tech" data-tech="After Effect">After Effect</button>
							            <button type="button" class="tech" data-tech="Lightroom">Lightroom</button>
							            <button type="button" class="tech" data-tech="InDesign">InDesign</button>
							        </div>
							    </div>
							    <div class="Bodycon Office">
							        <div class="techName">기획</div>
							        <div class="officeTech">
							            <button type="button" class="tech" data-tech="Excel">Excel</button>
							            <button type="button" class="tech" data-tech="Power Point">Power Point</button>
							            <button type="button" class="tech" data-tech="MS 오피스">MS 오피스</button>
							            <button type="button" class="tech" data-tech="Notion">Notion</button>
							            <button type="button" class="tech" data-tech="Google Apps">Google Apps</button>
							            <button type="button" class="tech" data-tech="Slack">Slack</button>
							            <button type="button" class="tech" data-tech="Asana">Asana</button>
							            <button type="button" class="tech" data-tech="Cloud">Cloud</button>
							        </div>
							    </div>
								<input type="hidden" name="notice_stack" id="notice_stack" value="${notice_stack}">
							</div> <!-- sectionConBody 끝 -->

                        </div> <!-- prizeWrap 끝 -->
                        
                        <!--상세 기술 영역-->
                        <div class="postValue">
                            <h5 class="value">주요 업무</h5>
                            <textarea class="workDesc" name="notice_jobInfo" placeholder="주요 업무를 입력해주세요." onkeyup="autoResize(this)" onkeydown="autoResize(this)" rows="3" style="overflow:hidden;" required></textarea>
                        </div>
                        <div class="postValue">
                            <h5 class="value">자격 요건</h5>
                            <textarea class="workRight" name="notice_condition" placeholder="자격 요건을 입력해주세요." onkeyup="autoResize(this)" onkeydown="autoResize(this)" rows="3" style="overflow:hidden;" required></textarea>
                        </div>
                        <div class="postValue">
                            <h5 class="value">우대사항</h5>
                            <textarea class="workGive" name="notice_prefer" placeholder="우대사항을 입력해주세요." onkeyup="autoResize(this)" onkeydown="autoResize(this)" rows="3" style="overflow:hidden;" required></textarea>
                        </div>
                        <div class="postValue">
                            <h5 class="value">혜택 및 복지</h5>
                            <textarea class="workBenefit" name="notice_benefit" placeholder="혜택 및 복지를 입력해주세요." onkeyup="autoResize(this)" onkeydown="autoResize(this)" rows="3" style="overflow:hidden;" required></textarea>
                        </div><!--상세 기술 영역-->
                    </div><!--postContainer-->
                    <div class="ok">
                        <input type="submit" value="등록" class="posting">
                    </div>
					<input type="hidden" name="com_email" value="${com_email}">
                </form><!--form-->
            </div>
        </main>
	</div>                                            
	<%@ include file="footer.jsp" %>
</body>
</html>
<script>
	$(document).ready(function() {
	    //버튼 클릭시 활성화
	    $(".itTech button.tech").click(function() {
	        $(this).toggleClass("active");
	    });

	    $(".designTech button.tech").click(function() {
	        $(this).toggleClass("active");
	    });

	    $(".officeTech button.tech").click(function() {
	        $(this).toggleClass("active");

	    });
	});//document).ready(function()

	function categoryChange(e) {
	    const state = document.getElementById("state");
	  
	    const gangwon = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
	    const gyeonggi = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
	    const gyeongsangnam = ["거제시", "김해시", "마산시", "밀양시", "사천시", "양산시", "진주시", "진해시", "창원시", "통영시", "거창군", "고성군", "남해군", "산청군", "의령군", "창녕군", "하동군", "함안군", "함양군", "합천군"];
	    const gyeongsangbuk = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
	    const gwangju = ["광산구", "남구", "동구", "북구", "서구"];
	    const daegu = ["남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군"];
	    const daejeon = ["대덕구", "동구", "서구", "유성구", "중구"];
	    const busan = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
	    const seoul = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
	    const ulsan = ["남구","동구","북구","중구","울주군"];
	    const incheon = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
	    const jeonnam = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
	    const jeonbuk = ["군산시", "김제시", "남원시", "익산시", "전주시", "정읍시", "고창군", "무주군", "부안군", "순창군", "완주군", "임실군", "장수군", "진안군"];
	    const jeju = ["서귀포시","제주시","남제주군","북제주군"];
		const chungnam = ["천안시","아산시","서산시","당진시","홍성군","보령시","논산시","공주시","계룡시","서천군","부여군","청양군","태안군","금산군","예산군"];
	    const chungbuk = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
	    
	  
		if (e.value == "강원") {
            add = gangwon;
        } else if (e.value == "경기") {
            add = gyeonggi;
        } else if (e.value == "경남") {
            add = gyeongsangnam;
        } else if (e.value == "경북") {
            add = gyeongsangbuk;
        } else if (e.value == "광주") {
            add = gwangju;
        } else if (e.value == "대구") {
            add = daegu;
        } else if (e.value == "대전") {
            add = daejeon;
        } else if (e.value == "부산") {
            add = busan;
        } else if (e.value == "서울") {
            add = seoul;
        } else if (e.value == "울산") {
            add = ulsan;
        } else if (e.value == "인천") {
            add = incheon;
        } else if (e.value == "전남") {
            add = jeonnam;
        } else if (e.value == "전북") {
            add = jeonbuk;
        } else if (e.value == "제주") {
            add = jeju;
        } else if (e.value == "충남") {
            add = chungnam;
        } else if (e.value == "충북") {
            add = chungbuk;
        }
	  
	    state.options.length = 1;

		// "전체" 옵션 추가
        let allOption = document.createElement("option");
        allOption.value = "전체";
        allOption.innerHTML = "전체";
        state.appendChild(allOption);

	    // 군/구 갯수;
	  
	      for (property in add) {
	          let opt = document.createElement("option");
	          opt.value = add[property];
	          opt.innerHTML = add[property];
	          state.appendChild(opt);
	      }
		  document.getElementById("notice_area1").value = e.value; // 시/도 값을 설정
	  }
	  
	  function updateDistrict(element) {
	          document.getElementById("notice_area2").value = element.value; // 군/구 값을 설정
	  }

	  function check_ok(){
		if(notice.title.value.length==0){
	        console.log("title")
			notice.title.focus();
			return;
		}

		reg_frm.submit();

	};//지역 선택

	
	function autoResize(textarea) {
	  textarea.style.height = 'auto';
	  textarea.style.height = textarea.scrollHeight + 'px';
	}
	
	document.addEventListener('DOMContentLoaded', (event) => {
		/*스택값*/
	    const techButtons = document.querySelectorAll('.tech');
	    const noticeStackInput = document.getElementById('notice_stack');

	    techButtons.forEach(button => {
	        button.addEventListener('click', () => {
	            const techValue = button.getAttribute('data-tech');
	            let currentStack = noticeStackInput.value.split(',').filter(Boolean); // 기존 스택 값들을 배열로 변환

	            if (!currentStack.includes(techValue)) {
	                currentStack.push(techValue);
	            } else {
	                currentStack = currentStack.filter(item => item !== techValue);
	            }

	            noticeStackInput.value = currentStack.join(','); // 배열을 다시 문자열로 변환하여 hidden input에 설정
	        });
	    });
	});


	
</script>
<script>
	document.addEventListener('DOMContentLoaded', function () {

	/*
		2024-07-16 하지수 
		접수기간 시작 날짜 오늘 부터 시작, + 이전 날짜는 선택할 수 없음
	*/
		var today = new Date();
		var year = today.getFullYear();
		var month = today.getMonth() + 1;
		var day = today.getDate();
		
		if(month < 10) month = '0' + month;
		if(day < 10) day = '0' + day;
		
		var dateString = year + '-' + month + '-' + day;

		// 오늘 날짜 설정 및 최소값 설정
		var startDateInput = document.getElementById('currentDate');
		var endDateInput = document.getElementById('endDate');
		
		startDateInput.value = dateString;
		startDateInput.min = dateString;
		
		// endDateInput.value = dateString;
		endDateInput.min = dateString; //날짜 설정 끝


	/*
		2024-07-16 하지수 
		체크박스 필수로 하나만 선택, 기본으로 첫번째 체크박스 자동체크 
	*/
		const careerCheckboxes = document.querySelectorAll('.checkboxCarrer');
		const contactCheckboxes = document.querySelectorAll('.checkboxContact');

		function onlyOne(checkboxes, checkbox) {
			checkboxes.forEach((item) => {
				if (item !== checkbox) item.checked = false;
			});
		}

		function handleCheckboxChange(checkboxes) {
			checkboxes.forEach((checkbox) => {
				checkbox.addEventListener('change', function () {
					if (checkbox.checked) {
						onlyOne(checkboxes, checkbox);
					} else {
						const isAnyChecked = Array.from(checkboxes).some((item) => item.checked);
						if (!isAnyChecked) {
							checkbox.checked = true;
						}
					}
				});
			});

			const isAnyChecked = Array.from(checkboxes).some((item) => item.checked);
			if (!isAnyChecked) {
				checkboxes[0].checked = true;
			} // 첫번째 체크박스 자동 체크
		}

		handleCheckboxChange(careerCheckboxes);
		handleCheckboxChange(contactCheckboxes); //체크박스 끝
	});

</script>


<script>
	// 이미지 업로드
	$(document).ready(function (e){
		var formObj = $("form[id='registUpload']");

		$("input[type='submit']").on("click", function(e){
			e.preventDefault();
			console.log("submit clicked");

			var str="";

			$(".uploadResult ul li").each(function (i, obj){
				console.log("@# obj=>"+$(obj));
				console.log("@# obj=>"+$(obj).data());
				console.log("@# obj=>"+$(obj).data("filename"));
				// return;

				var jobj = $(obj);
				// JavaScript개체의 속성에 대한 목록을 표시
				console.dir(jobj);
				console.log("================================");
				console.log(jobj.data("filename"));
				console.log(jobj.data("uuid"));
				console.log(jobj.data("path"));
				console.log(jobj.data("type"));

				str += "<input type='hidden' name='comNoticeAttachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
				str += "<input type='hidden' name='comNoticeAttachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
				str += "<input type='hidden' name='comNoticeAttachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
				str += "<input type='hidden' name='comNoticeAttachList["+i+"].image' value='"+jobj.data("type")+"'>";
			});//end of uploadResult ul li

			console.log(str);
			// return;
			// formObj.append(str).submit();
			formObj.append(str);
       	 	formObj[0].submit(); // 폼을 정상적으로 제출
		});//end of button submit

		//확장자(exe, sh, alz), 파일크기(5MB 미만) 조건
		//확장자가 exe|sh|alz 업로드 금지하기 위한 정규식
		var regex = new RegExp("(.*?)\.(exe|sh|alz)$");
		var maxSize = 5242880;//5MB

		function checkExtension(fileName, fileSize){
			if(fileSize >= maxSize){
				alert("파일 사이즈 초과");
				return false;
			}
			if(regex.test(fileName)){
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			return true;
		}

		$("input[type='file']").change(function (e){
			// 이미 업로드된 파일이 있는지 확인
			if ($(".uploadResult ul li").length > 0) {
				alert("하나의 파일만 업로드할 수 있습니다. 삭제하고 다시 업로드 해주세요.");
				$("input[type='file']").val(""); // 파일 입력 초기화
				return false;
			}

			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			//files : 파일정보
			var files = inputFile[0].files;

			if(files.length > 1) {
				alert("하나의 파일만 업로드할 수 있습니다.");
				$("input[type='file']").val(""); // 파일 입력 초기화
				return false;
			}

			for(var i=0; i<files.length; i++){
				console.log("@# files=>"+files[i].name);

				//파일크기와 종류중에서 거짓이면 리턴
				if(!checkExtension(files[i].name, files[i].size)){
					$("input[type='file']").val(""); // 파일 입력 초기화
					return false;
				}

				//파일 정보를 formData에 추가
				formData.append("uploadFile",files[i]);
			}

			$.ajax({
				 type: "post"
				,data: formData
				//컨트롤러단 호출
				,url: "registUploadAjaxAction"
                //processData : 기본은 key/value 를 Query String 으로 전송하는게 true
                //(파일 업로드는 false)
				,processData: false
                //contentType : 기본값 : "application / x-www-form-urlencoded; charset = UTF-8"
                //첨부파일은 false : multipart/form-data로 전송됨
				,contentType: false
				,success: function(result){
					alert("사진 업로드 완료");
					console.log(result);
					//파일정보들을 함수로 보냄
					showUploadResult(result);//업로드 결과 처리 함수 
				}
			});//end of ajax

			function showUploadResult(uploadResultArr){
				if(!uploadResultArr || uploadResultArr.length == 0){
					return;
				}

				var uploadUL = $(".uploadResult ul");
				uploadUL.empty(); // 기존 업로드된 파일 정보 제거
				var str="";

				$(uploadResultArr).each(function (i, obj){
					//image type
					if (obj.image) {
						console.log("@# obj.uploadPath=>"+obj.uploadPath);
						console.log("@# obj.uuid=>"+obj.uuid);
						console.log("@# obj.fileName=>"+obj.fileName);

						// var fileCallPath = obj.uploadPath + obj.uuid + "_" + obj.fileName;
						// var fileCallPath = encodeURIComponent(obj.uploadPath +"/"+ obj.uuid + "_" + obj.fileName);
						var fileCallPath = encodeURIComponent(obj.uploadPath +"/s_"+ obj.uuid + "_" + obj.fileName);
						// str += "<li><div>";

						str += "<li data-path='" + obj.uploadPath + "'";
						str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'>"
						str + "<div>";

						str += "<span style='display:none;'>"+obj.fileName+"</span>";
						str += "<img src='/registDisplay?fileName="+fileCallPath+"'>";//이미지 출력 처리(컨트롤러단)
						str += "</div>";
						str += "<div class='imgDelete'>";
						// str += "<span data-file=\'"+ fileCallPath +"\'data-type='image'><i class='fa-regular fa-trash-can'></i></span>";
						str += "<span style='cursor: pointer;' data-file=\'"+ fileCallPath +"\'data-type='image'>이미지 삭제</span>";
						str += "</div></li>";
					} else {
						// var fileCallPath = obj.uploadPath + obj.uuid + "_" + obj.fileName;
						var fileCallPath = encodeURIComponent(obj.uploadPath +"/"+ obj.uuid + "_" + obj.fileName);
						// str += "<li><div>";

						str += "<li data-path='" + obj.uploadPath + "'";
						str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'"
						str + " ><div>";

						str += "<span>"+obj.fileName+"</span>";
						// str += "<img src='./resources/img/attach.png'>";
						str += "<span data-file=\'"+ fileCallPath +"\'data-type='file'> [삭제] </span>";
						str += "</div></li>";
					}
				});//end of each

				//div class 에 파일 목록 추가
				uploadUL.append(str);
				$('.comImage').css({"display":"none"});
			}

			// $(".uploadResult").on("click","span",function(){
			$(".uploadResult").on("click","span[data-file]",function(){
				var targetFile = $(this).data("file");
				var type = $(this).data("type");
				var uploadResultItem = $(this).closest("li");

				console.log("@# targetFile=>"+targetFile);
				console.log("@# type=>"+type);
				console.log("@# uploadResultItem=>"+uploadResultItem);

				//컨트롤러 단에서 업로드된 실제파일 삭제
				$.ajax({
					 type: "post"
					,data: {fileName: targetFile, type: type}
					,url: "registDeleteFile"
					,success: function(result){
						alert("삭제 완료");
						//브라우저에서 해당 썸네일이나 첨부파일이미지 제거
						uploadResultItem.remove();

						if($(".uploadResult ul li").length === 0){
							$('.comImage').css({"display":"block"}); // 모든 파일이 삭제되면 보이기
						}
					}
				});//end of ajax
			});//end of click
		});//end of change 
	});//end of ready // 이미지 업로드 끝
</script>

