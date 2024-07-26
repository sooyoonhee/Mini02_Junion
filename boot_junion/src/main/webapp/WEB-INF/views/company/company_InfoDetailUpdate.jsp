<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CompanyInfoDetailUpdate</title>
<!--    <link rel="stylesheet" href="css/default.css">-->
<!--    <link rel="stylesheet" href="css/company_InfoDetailUpdate.css">-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/company_InfoDetailUpdate.css">
    <!-- import font-awesome, line-awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
    <!-- import pretendard font -->
    <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
    <!-- import js -->
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <script src="js/index.js"></script>     
    <meta charset="utf-8"/>
    <style>
        .company
        {
            display: flex;
            width: 100%;
        }
    </style>

</head>
<body>
   <%@ include file="../header.jsp" %>
<!-- 섹션-->
        <section style="padding-top: 90px;">    
                  
            <div class="wrap">

                
                <div class="left">
                    <div class="toptitle">
                        <h3 class="toptitle1" >상세 정보 수정</h3>
                        
                    </div>  

                    <!-- 컴퍼니 시작-->
                <form id="comInfoUpdate" method="post" action="modifyDetail">
                    <input type="hidden" name="com_email" value="${login_email}">
                    <div class="company">
                        <label for="photo">
                            <div class="imgg">기업 사진 수정하기</div>
                            <div class="uploadResult">
                                <ul class="comInfoImage">
                                </ul>
                            </div>
                        </label>
                        <input type="file" name="uploadFile" id="photo" accept="image/*,.txt">
                    </div>
                    <div class="main">
                        <div class="sub1">
                            <div class="namaing">
                                <h5 class="title">
                                    기업명
                                </h5>
                                <div class="write">
                                    <input  type="text" name="com_name" class="comname" placeholder="${companyInfo.com_name}">
                                </div>
                            </div>
       
                        

                            <div class="comadd">
                                <h5 class="title">창립일 </h5>
                                <div class="comadressyear">
                                    <input  type="date" name="com_year" class="comadress">
                                    <!-- <input  type="date" name="com_year" class="comadress"> -->
                                </div>
                            </div>
                        </div>
                        
                    </div>


                    <!-- 컬럼 시작-->


                <div class="column"> 


                    <div class="col1">
                        <div class="columnA">
                            <h5 class="title">회사 소개</h5>
                        </div>
                        <div class="columnAA">
                            <textarea name="com_content" class="detailtext" placeholder="${companyInfo.com_content}"></textarea>
                        </div>
                    </div>

                    <div class="sectionCon techWrap">
	                    <div class="sectionTitleWrap modify">
	                        <h3 class="sectionTitle tech">기술 스택 · 툴</h3>
                            <div class="sectionNotice">기술 스택· 툴 선택 후 저장 버튼을 눌러주세요</div>
	                        <button class="saveTech" type="button">저장</button>
	                    </div>                    
	                    <div class="sectionConBody tech">
	                        <div class="Bodycon tech">
								<input type="hidden" class="techValue" id="techValue" name="com_stack"> <!-- com_stack value 저장장소-->
	                            <div class="techCon">
	                                <div class="buttonTitle">기술</div>
	                                <div class="buttonWrap">	                                    
										<c:forEach var="dto" items="${stack_name}">
											<input type="button" class="tech" name="com_stack" value="${dto.stack_name}">
										</c:forEach>
	                                </div>
	                            </div>    
	                            <div class="techCon">
	                                <div class="buttonTitle">디자인</div>
	                                <div class="buttonWrap">
	                                    <c:forEach var="dto" items="${stack_name2}">
											<input type="button" class="tech" name="com_stack" value="${dto.stack_name}">
										</c:forEach>
	                                </div>
	                            </div>
	                            <div class="techCon">
	                                <div class="buttonTitle">기획</div>
	                                <div class="buttonWrap">
	                                    <c:forEach var="dto" items="${stack_name3}">
											<input type="button" class="tech" name="com_stack" value="${dto.stack_name}">
										</c:forEach>
	                                </div>
	                            </div>                        
	                        </div>                        
	                    </div> <!-- sectionConBody 끝 -->
	                </div> <!-- techWrap 끝 -->

                    <div class="col7">
                        <div class="columnA">
                            <h5 class="title">회사 위치</h5>
                        </div>
                        <!-- <div class="columnBB"> -->
                            <!-- <div class="detail">
                                <div id="map" clss="map"></div> -->
                                <!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=de7cac757fedb4da8958fa692849033d"></script>
                                <script>
                                    var container = document.getElementById('map');
                                    var options = {
                                        center: new kakao.maps.LatLng(33.450701, 126.570667),
                                        level: 3
                                    };
                            
                                    var map = new kakao.maps.Map(container, options);
                                </script>
                            </div> -->
                                <div class="mapLocation">
                                    <input  type="" name="com_location" class="maptext" placeholder="${companyInfo.com_location}">
                                </div>
                        <!-- </div> -->
                    </div>

                    <div class="col8">
                        <div class="columnA">
                                <h5 class="title">
                                    기업정보
                                </h5>
                            </div>
                            <div class="content">
                                
                                <div class="contentDetail">
                                    <div class="comname1">
                                        <h5 class="name">
                                            매출액 (2024년)
                                        </h5>
                                    </div>
                                    <div class="comname2">
                                        <input type="text" name="com_sale" class="cominfotext" placeholder="${companyInfo.com_sale}">
                                    </div>
                                </div>

                                <div class="contentDetail">
                                    <div class="comname1">
                                        <h5 class="name">
                                            기업유형
                                        </h5>
                                    </div>
                                    <div class="comname2">
                                        <select name="com_type" id="com_type" class="cominfotext">
                                            <option name="com_type" value="" selected>유형을 선택해주세요</option>
                                            <option name="com_type" value="합명회사">합명회사</option>
                                            <option name="com_type" value="합자회사">합자회사</option>
                                            <option name="com_type" value="유한책임회사">유한책임회사</option>
                                            <option name="com_type" value="주식회사">주식회사</option>
                                            <option name="com_type" value="유한회사">유한회사</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="contentDetail">
                                    <div class="comname1">
                                        <h5 class="name">
                                            평균연봉
                                        </h5>
                                    </div>
                                    <div class="comname2">
                                        <input type="text" name="com_salary" class="cominfotext" placeholder="${companyInfo.com_salary}">
                                    </div>
                                </div>

                                <div class="contentDetail">
                                    <div class="comname1">
                                        <h5 class="name">
                                            대표자명
                                        </h5>
                                    </div>
                                    <div class="comname2">
                                        <input type="text" name="com_CEO" class="cominfotext" placeholder="${companyInfo.com_CEO}">
                                    </div>
                                </div>

                                <div class="contentDetail">
                                    <div class="comname1">
                                        <h5 class="name">
                                            홈페이지
                                        </h5>
                                    </div>
                                    <div class="comname2">
                                        <input type="url" name="com_site" class="cominfotext" placeholder="${companyInfo.com_site}">
                                    </div>
                                </div>

                                <div class="contentDetail">
                                    <div class="comname1">
                                        <h5 class="name">
                                            가입 사원수 (인원)
                                        </h5>
                                    </div>
                                    <div class="comname2">
                                        <input type="number" name="com_employee" class="cominfotext" placeholder="단위 : 명">
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                        <div class="submit">    
                            <input type="button" value="수정 취소" class="ytn" onclick="location.href='companyInfoManagement'">
                            <input type="submit" class="btn" value="수정 완료">
                        </div>
                            
                    </div>



                </div><!-- 컬럼 끝-->
                </div> <!-- left 끝-->
                <!-- <div class="right">
                    
                </div> right 끝 -->
            </form>
            </div> <!-- wrap 끝-->
        </section> <!--section 끝 -->


		<%@ include file="../footer.jsp" %>
    </div>
</html>
<script>
	$(document).ready(function()
	{	
	    $('.Bodycon.tech input.tech').click(function(){//기술 스택 선택시 값을 넣는 쿼리
	        $(this).toggleClass('active');
	    });	
		
		var buttons = $('.Bodycon.tech input.tech');
		var techValue = $('#techValue');		
		var submit = $('button.saveTech');
		// 제출 버튼 클릭 시
		submit.on('click', function() {
        // 'on' 클래스가 있는 버튼들의 값을 배열에 저장
        var buttonValues = [];
        buttons.filter('.active').each(function() {
            buttonValues.push($(this).val());
        });

        // AJAX 요청을 통해 서버로 데이터 전송
        $.ajax({
            url: "/companyInfoDetailUpdate", // 실제 서버 엔드포인트 URL
            type: "POST",  
            async: false,          
            data: JSON.stringify({com_stack: buttonValues}),
            success: function(response) {
                // 선택된 값을 wishJob 입력 필드에 쉼표로 구분된 문자열로 표시
                techValue.val(buttonValues.join(', '));
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

  
	});

</script>
<script>
	// 이미지 업로드
	$(document).ready(function (e){
		var formObj = $("form[id='comInfoUpdate']");

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

				str += "<input type='hidden' name='companyAttachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
				str += "<input type='hidden' name='companyAttachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
				str += "<input type='hidden' name='companyAttachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
				str += "<input type='hidden' name='companyAttachList["+i+"].image' value='"+jobj.data("type")+"'>";
			});//end of uploadResult ul li

			console.log(str);
			// return;
			formObj.append(str).submit();
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
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			//files : 파일정보
			var files = inputFile[0].files;

			for(var i=0; i<files.length; i++){
				console.log("@# files=>"+files[i].name);

				//파일크기와 종류중에서 거짓이면 리턴
				if(!checkExtension(files[i].name, files[i].size)){
					return false;
				}

				//파일 정보를 formData에 추가
				formData.append("uploadFile",files[i]);
			}

			$.ajax({
				 type: "post"
				,data: formData
				//컨트롤러단 호출
				,url: "comUploadAjaxAction"
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
						str += "<img src='/comDisplay?fileName="+fileCallPath+"'>";//이미지 출력 처리(컨트롤러단)
						str += "</div>";
						str += "<div class='imgDelete'>";
						// str += "<span data-file=\'"+ fileCallPath +"\'data-type='image'><i class='fa-regular fa-trash-can'></i></span>";
						str += "<span data-file=\'"+ fileCallPath +"\'data-type='image'>이미지 삭제</span>";
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
			}

			$(".uploadResult").on("click","span",function(){
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
					,url: "comInfoDeleteFile"
					,success: function(result){
						alert(result);
						//브라우저에서 해당 썸네일이나 첨부파일이미지 제거
						uploadResultItem.remove();
					}
				});//end of ajax
			});//end of click
		});//end of change 
	});//end of ready // 이미지 업로드 끝
</script>