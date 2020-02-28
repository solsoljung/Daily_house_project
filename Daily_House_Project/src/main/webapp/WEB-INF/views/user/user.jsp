<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 데이터피커X -->					
<%@ include file = "../../views/title2.jsp"%> <!-- <head> -->					
					
<%@ include file = "../../views/casahotel/casahotel_link2.jsp" %>					
<%@ include file = "../../views/islagrande/islagrande_link.jsp" %>					
					
<%@ include file = "../../views/islagrande/islagrande_menubar.jsp" %> <!-- </head> <body> -->					
<!-- 데이터피커X -->					

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<script>

$(function(){
	var nameText = $("#name").text();
	var phoneText = $("#phone").text();
	
	var user_name = "${userVo.user_name}";
	var user_phone = "${userVo.user_phone}";
	
	$("#fileButton").click(function() {
			$("#input_img").trigger("click");
	});
	
	// 미리보기!
	var sel_file;
	$("#input_img").on("change", handleImgFileSelect);
	
	
	
	
	// 수정 버튼
	$("#btnUpdate").click(function(e) {
		// 타이틀에 " - 수정" 추가
		$("#name").text(nameText + " - 수정");
		$("#phone").text(phoneText + " - 수정");
		// 내용 수정 가능하게 전환
		$("#user_name").prop('readonly', false);
		$("#user_phone").prop('readonly', false);
		// 수정 버튼 숨기고 저장,취소,사진수정 버튼 표시
		$("#fileButton").css("display", "block");
		$("#btnUpdate").css("display", "none");
		$("#btnSubmit").css("display", "block");
		$("#btnBack").css("display", "block");
	});
	//저장 버튼
	$("#btnSubmit").click(function(e) {
		console.log("폼전송");
		$("#joinForm").submit();
	});
	// 취소버튼
	$("#btnBack").click(function(e) {
		// 타이틀에 "-수정" 제거
		$("#name").text(nameText);
		$("#phone").text(phoneText);
		// 내용 수정 불가하게 전환 + 수정전의 내용으로 되돌림
		$("#user_name").prop('readonly', true).val(user_name);
		$("#user_phone").prop('readonly', true).val(user_phone);
		// 수정 버튼 보이고 저장,취소,사진수정 버튼 숨김
		$("#fileButton").css("display", "none");
		$("#btnUpdate").css("display", "block");
		$("#btnSubmit").css("display", "none");
		$("#btnBack").css("display", "none");
	});
	
	// 첨부 파일 삭제 링크
	$("#uploadedList").on("click", ".attach-del", function(e) {
		e.preventDefault();
		var that = $(this);
		var fullName = that.attr("href");
		console.log("fullName:" + fullName);
		var url = "/upload/deleteFile";
		var sendData = {"fileName" : fullName};
		$.get(url, sendData, function(rData) {
			console.log(rData);
			if (rData == "success") {
				v--;
				console.log("v-: " + v);
				that.parent().remove();
			}
		});
	});
});
// 미리보기
function handleImgFileSelect(e) {
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	filesArr.forEach(function(f){
		if (!f.type.match("image.*")){
			alert("학장자는 이미지 확장자만 가능합니다.");
			return;
		}
		sel_file = f;
		var reader = new FileReader();
		reader.onload = function(e) {
			$("#img").attr("src", e.target.result);
		}
		reader.readAsDataURL(f);
	});
}
</script>
<br>
<br>
<section class="section contact-section" id="next">
      <div class="container">
        <div class="row">
          <div class="col-md-12" data-aos="fade-up" data-aos-delay="100">
            <form action="/si/userUpdate" method="post" enctype="multipart/form-data" role="form" class="bg-white p-md-5 p-4 mb-5 border" id="joinForm">
            <input type="hidden" name="user_email" value="${userVo.user_email}">
            <input type="hidden" name="user_pic" value="${userVo.user_pic}">
            <input type="hidden" name="user_point" value="${userVo.user_point}">
                <div class="col-md-6 form-group">
                  <label class="text-black font-weight-bold">개인 정보</label>
                </div>
                <hr>
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="email">Email</label>
                  <br>
                  <label class="text-black font-weight-bold" for="email">${userVo.user_email}</label>
                  <hr>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="point">Point</label>
                  <br>
                  <label class="text-black font-weight-bold" for="point">${userVo.user_point}</label>
                  <hr>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="picture" id="picture" style="color: #ff0000;">Profile</label>
                  <br>
                  <c:choose>
				   	<c:when test="${null == userVo.user_pic}">
                 	 <img src="/images/profile/user.jpg" height="180">
				   	</c:when>
				   	<c:otherwise>
					 <div class="img_wrap">
		              	<img src="/si/displayFile?fileName=/${userVo.user_pic}" id="img" height="180"/>
		             </div>
					</c:otherwise>
				  </c:choose>
                  <br>
                  <br>
                  <input type="file" id="input_img" name="file" class="btn btn-primary text-white" style="display: none;">
                  <button type="button" class="btn btn-primary text-white py-2 px-5" id="fileButton" style="display: none;" >프로필 사진수정</button>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="name" id="name">Name</label>
                  <input type="text" value="${userVo.user_name}" id="user_name" name="user_name" placeholder="이름을 입력해주세요" class="form-control" required readonly>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="phone" id="phone">Phone</label>
                  <input type="text" value="${userVo.user_phone}" id="user_phone" name="user_phone" placeholder="-없이 숫자만 입력해주세요." class="form-control" required readonly >
                  <br>
                </div>
              </div>
	          <div class="col-md-12 text-right" data-aos="fade-up" data-aos-delay="200">
              	<div class="row">
		        	<button type="button" class="btn btn-primary text-white py-2 px-5" id="btnUpdate">수정하기</button>
			        <button type="submit" class="btn btn-primary text-white py-2 px-5" id="btnSubmit" style="display: none;">저장하기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			        <button type="button" class="btn btn-primary text-white py-2 px-5" id="btnBack" style="display: none;">취소</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		            <a href="/si/updatePasswordHost"><button type="button" class="btn btn-primary text-white py-2 px-5" id="btnUpdate">비밀번호 변경</button></a>
		        </div>
		      </div>
            </form>
          </div>
        </div>
      </div>
    </section>

<!-- end section -->

<!-- 데이터피커X -->			
			
<%@ include file = "../../views/casahotel/casahotel_footer.jsp" %>			
			
<%@ include file = "../../views/casahotel/casahotel_script2.jsp" %>			
<%@ include file = "../../views/islagrande/islagrande_script2.jsp" %>			
			
<%@ include file = "../../views/end.jsp"%> <!-- </body> -->			
			
<!-- 데이터피커X -->			