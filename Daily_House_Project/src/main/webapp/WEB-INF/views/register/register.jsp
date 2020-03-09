<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 데이터피커X -->
<%@ include file="../../views/title2.jsp"%>
<!-- <head> -->

<%@ include file="../../views/casahotel/casahotel_link2.jsp"%>
<%@ include file="../../views/islagrande/islagrande_link.jsp"%>

<%@ include file="../../views/islagrande/islagrande_menubar.jsp"%>
<!-- </head> <body> -->					
<!-- 데이터피커X -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script>

$(function(){
	
	//이메일 인증여부
	var isCerficate = false;

	$("#btnSubmit").click(function(e) {
		// 얻어온 값
		var pw1 = $("#pw").val().trim();
		var pw2 = $("#pw2").val().trim();
		var phone = $("#phone").val().trim();
		var name = $("#name").val().trim();
		// 테스트 내용
		var pattern1 = /[0-9]/;
		var pattern2 = /[a-zA-Z]/;
		var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/;

		if (isCerficate == false) {
			alert("이메일 인증을 해주세요.");
			return false;
		}
		if (!pattern1.test(pw1) || !pattern2.test(pw1) || !pattern3.test(pw1) || pw1.length < 6) {
			alert("비밀번호는 6자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다.");
			return false;
		}
		if (pw1 != pw2) {
			alert("비밀번호 불일치합니다.");
			return false;
		}
		if (name == "") {
			alert("이름을 입력해주세요.");
			return false;
		}
		if (!pattern1.test(phone) || phone.length < 11) {
			console.log(phone);
			alert("-없이 010포함한 번호 11자리를 입력해주세요.");
			return false;
		}
		$("#joinForm").submit();
	});
	
	$("#btn_list").click(function(){
		location.href = "/test/board/listAll";
	});
	
	//이메일 참고
	//https://dlgkstjq623.tistory.com/351
	
	//인증번호를 저장할 공간
	var dice = "";
	
	//이메일 인증번호 발급받기
	$("#btn_certification").click(function(){
		var user_id = $("input[name=user_email]").val();
		
		$('#email').prop('readonly', true);
		
		$.ajax({
			"type" : "post",
			"url" : "/certification/registerCertification",
			"headers" : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "post"
			},
			"dataType" : "text",
			"data" : JSON.stringify(user_id),
			"success" : function(rData) {
				alert("인증번호가 발송되었습니다.\n확인 후 인증번호를 입력바랍니다.");
				console.log("=================btn_certification=================");
				dice = rData;
			}
		}); // $.ajax()
	}); //$("#btn_certification1").click
	
	
	//이메일 인증번호 일치, 불일치 확인
	$("#btn_certification2").click(function(){
		var user_input = $("input[name=certification]").val();
		console.log("=================btn_certification2=================");
		var sData = {
				"dice" : dice,
				"user_input" : user_input
		};
		$.ajax({
			"type" : "post",
			"url" : "/certification/registerCertification2",
			"headers" : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "post"
			},
			"dataType" : "text",
			"data" : JSON.stringify(sData),
			"success" : function(rData) {
				console.log(rData);
				if(rData == "success"){
					$('#emailCertification').prop('readonly', true);
					isCerficate = true;
					alert("인증성공");
					
				}else if(rData == "fail"){
					$('#email').prop('readonly', false);
					alert("재인증을 해주세요");
				}
			}
		}); // $.ajax()
	});
});

</script>
	

<br>
<br>
<section class="section contact-section" id="next">
      <div class="container">
        <div class="row">
          <div class="col-md-3" data-aos="fade-up" data-aos-delay="100">
          </div>
          <div class="col-md-7" data-aos="fade-up" data-aos-delay="100">
            <form action="/si/register_run" method="post" role="form" class="bg-white p-md-5 p-4 mb-5 border" id="joinForm">
            	<input type="hidden" name="user_pic" value="user.jpg">
              <div class="col-md-6 form-group">
                <label class="text-black font-weight-bold">회원가입</label>
              </div>
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="email">Email</label>
                  <input type="email" id="email" name="user_email" placeholder="Email" class="form-control">
                  <button type="button" id="btn_certification" value="인증번호 받기" class="btn btn-primary text-white">인증번호 받기</button>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="email">Email 인증</label>
                  <input type="text" id="emailCertification" name="certification" placeholder="인증번호" class="form-control" required>
                  <button type="button" id="btn_certification2" value="인증번호 확인" class="btn btn-primary text-white">인증번호 확인</button>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="password">Password</label>
                  <input type="password" id="pw" name="user_pw" placeholder="6자 이상 영문,숫자,특수문자를 조합해서 입력해주세요." class="form-control" required maxlength="20">
                  <label class="text-black font-weight-bold" for="password">Password Check</label>
                  <input type="password" id="pw2" class="form-control" placeholder="Password Check" required maxlength="20">
                </div>
              </div>
              <div class="row">
                <div class="col-md-6 form-group">
                  <label class="text-black font-weight-bold" for="name">Name</label>
                  <input type="text" id="name" name="user_name" class="form-control" placeholder="Name" maxlength="12" required>
                </div>
                <div class="col-md-6 form-group">
                  <label class="text-black font-weight-bold" for="phone">Phone</label>
                  <!--  required꼭 적게 만듬  readonly꼭 수정 못하게함-->
                  <input type="text" id="phone" name="user_phone" placeholder="-없이 숫자만 입력해주세요." class="form-control" maxlength="11" required>
                </div>
              </div>
              <div class="col-md-8 text-right" data-aos="fade-up" data-aos-delay="200">
              <br>
	            <button type="button" class="btn btn-primary text-white py-3 px-5" id="btnSubmit">회원가입</button>
	          </div>
            </form>
          </div>
           <div class="col-md-3" data-aos="fade-up" data-aos-delay="100">
          </div>
<!--           <div class="col-md-5" data-aos="fade-up" data-aos-delay="200"> -->
<!--             <div class="row"> -->
<!--               <div class="col-md-10 ml-auto contact-info"> -->
<!--                 <p><span class="d-block">Address:</span> <span> 446-77 울산광역시 남구 삼산로35번길 19 (신정동)</span></p> -->
<!--                 <p><span class="d-block">Phone:</span> <span> (+02) 052 - 000 - 0000</span></p> -->
<!--                 <p><span class="d-block">Email:</span> <span> ooooo@oooo.ooo</span></p> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
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
