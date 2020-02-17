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
	var passwordText = $("#password").text();
	var password2Text = $("#password2").text();
	var phoneText = $("#phone").text();
	var pictureText = $("#picture").text();
	
	$("#btnUpdate").click(function(e) {
		console.log("btnUpdate을 눌러찌롱~");
		$("#name").text(nameText + " - 수정");
		$("#password").text(passwordText + " - 수정");
		$("#password2").text(password2Text + " - 수정");
		$("#phone").text(phoneText + " - 수정");
		$("#picture").text(pictureText + " - 수정");
		$("#user_name").prop('readonly', false);
		$("#user_pw").prop('readonly', false);
		$("#user_pw2").prop('readonly', false);
		$("#user_picture").prop('readonly', false);
		$("#btnUpdate").css("display", "none");
		$("#btnSubmit").css("display", "block");
		$("#btnBack").css("display", "block");
	});
	$("#btnSubmit").click(function(e) {
		$("#name").text(nameText);
		$("#password").text(passwordText);
		$("#password2").text(password2Text);
		$("#phone").text(phoneText);
		$("#picture").text(pictureText);
		$("#user_name").prop('readonly', true);
		$("#user_pw").prop('readonly', true);
		$("#user_pw2").prop('readonly', true);
		$("#user_phone").prop('readonly', true);
		$("#user_picture").prop('readonly', true);
		$("#btnUpdate").css("display", "block");
		$("#btnSubmit").css("display", "none");
		$("#btnBack").css("display", "none");
		
		if (user_pw != user_pw2) {
			alert("비밀번호 불일치");
			return false;
		}
		$("#joinForm").submit();
	});
	
	$("#btnBack").click(function(e) {
		$("#name").text(nameText);
		$("#password").text(passwordText);
		$("#password2").text(password2Text);
		$("#phone").text(phoneText);
		$("#picture").text(pictureText);
		$("#user_name").prop('readonly', true);
		$("#user_pw").prop('readonly', true);
		$("#user_pw2").prop('readonly', true);
		$("#user_phone").prop('readonly', true);
		$("#user_picture").prop('readonly', true);
		$("#btnUpdate").css("display", "block");
		$("#btnSubmit").css("display", "none");
		$("#btnBack").css("display", "none");
	});
	
});

</script>

	

<section class="section contact-section" id="next">
      <div class="container">
        <div class="row">
          <div class="col-md-12" data-aos="fade-up" data-aos-delay="100">
            <form action="/si/userUpdate" method="post" role="form" class="bg-white p-md-5 p-4 mb-5 border" id="joinForm">
            <input hidden="">
                <div class="col-md-6 form-group">
                  <label class="text-black font-weight-bold">개인 정보</label>
                </div>
                <hr>
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="email">Email</label>
                  <input type="email" value="${userVo.user_email}" id="user_email" name="user_email" class="form-control" required readonly>
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
                  <label class="text-black font-weight-bold" for="pw" id="password">Password</label>
                  <input type="password" id="user_pw" name="user_pw" class="form-control" required readonly>
                  <label class="text-black font-weight-bold" for="pw2" id="password2">Password Check</label>
                  <input type="password" id="user_pw2" class="form-control" required readonly>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="phone" id="phone">Phone</label>
                  <input type="text" value="${userVo.user_phone}" id="user_phone" name="user_phone" placeholder="-없이 숫자만 입력해주세요." class="form-control" required readonly >
                </div>
              </div>
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="point">Point</label>
                  <input type="text" value="${userVo.user_point}" id="user_point" name="user_point" class="form-control" required readonly >
                </div>
              </div>
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="picture" id="picture" style="color: #ff0000;">Picture</label>
                  <input type="text" value="${userVo.user_pic}" id="user_pic" name="user_pic" class="form-control" required readonly >
                </div>
              </div>
                <hr>
              <div class="col-md-1 text-right" data-aos="fade-up" data-aos-delay="200">
	            <button type="button" class="btn btn-primary text-white py-3 px-5" id="btnUpdate">수정하기</button>
	            <button type="button" class="btn btn-primary text-white py-3 px-5" id="btnSubmit" style="display: none;">저장하기</button>
	            <button type="button" class="btn btn-primary text-white py-3 px-5" id="btnBack" style="display: none;">취소</button>
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