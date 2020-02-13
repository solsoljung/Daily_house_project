<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<%@ include file = "../../views/title.jsp"%> <!-- <head> -->

<%@ include file = "../../views/casahotel/casahotel_link.jsp" %>
<%@ include file = "../../views/islagrande/islagrande_link.jsp" %>

<%@ include file = "../../views/islagrande/islagrande_menubar.jsp" %> <!-- </head> <body> -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script>

$(function(){
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
				console.log("dice: " + dice);
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
					alert("인증성공");
				}else if(rData == "fail"){
					alert("인증실패");
				}
			}
		}); // $.ajax()
	});
});

</script>
	

<section class="section contact-section" id="next">
      <div class="container">
        <div class="row">
          <div class="col-md-7" data-aos="fade-up" data-aos-delay="100">
            <form action="/si/register_run" method="post" role="form" class="bg-white p-md-5 p-4 mb-5 border">
                <div class="col-md-6 form-group">
                  <label class="text-black font-weight-bold">회원가입</label>
                </div>
                
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="email">Email</label>
                  <input type="email" id="email" name="user_email" placeholder="Email" required="required" class="form-control">
                  <br>
                  <button type="button" id="btn_certification" value="인증번호 받기" class="btn btn-primary text-white">인증번호 받기</button>
                  <br>
                  <br>
                  <label class="text-black font-weight-bold" for="email">Email Check</label>
                  <input type="email" id="email" name="user_email" placeholder="인증번호" required="required" class="form-control">
                  <br>
                  <button type="button" id="btn_certification2" value="인증번호 확인" class="btn btn-primary text-white">인증번호 확인</button>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="password">Password</label>
                  <input type="password" id="pw" name="user_pw" class="form-control" placeholder="Password" required="required">
                  <label class="text-black font-weight-bold" for="password">Password Check</label>
                  <input type="password" id="pw2" class="form-control" placeholder="Password Check" required="required">
                </div>
              </div>
              <div class="row">
                <div class="col-md-6 form-group">
                  <label class="text-black font-weight-bold" for="name">Name</label>
                  <input type="text" id="name" name="user_name" class="form-control" placeholder="Name" required="required">
                </div>
                <div class="col-md-6 form-group">
                  <label class="text-black font-weight-bold" for="phone">Phone</label>
                  <input type="text" id="phone" name="user_phone" placeholder="-없이 숫자만 입력해주세요." class="form-control" required="required">
                </div>
              </div>
              <br>
              <div class="col-md-10 text-right" data-aos="fade-up" data-aos-delay="200">
	            <button type="submit" class="btn btn-primary text-white py-3 px-5">회원가입</button>
	            <a href="/si/goHome"><button type="button" class="btn btn-primary text-white py-3 px-5">홈으로</button></a>
	          </div>
            </form>
          </div>
          
          <div class="col-md-5" data-aos="fade-up" data-aos-delay="200">
            <div class="row">
              <div class="col-md-10 ml-auto contact-info">
                <p><span class="d-block">Address:</span> <span> 446-77 울산광역시 남구 삼산로35번길 19 (신정동)</span></p>
                <p><span class="d-block">Phone:</span> <span> (+02) 052 - 000 - 0000</span></p>
                <p><span class="d-block">Email:</span> <span> ooooo@oooo.ooo</span></p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

<!-- end section -->

<%@ include file = "../../views/casahotel/casahotel_footer.jsp" %>

<%@ include file = "../../views/casahotel/casahotel_script.jsp" %>
<%@ include file = "../../views/islagrande/islagrande_script.jsp" %>

<%@ include file = "../../views/end.jsp"%> <!-- </body> -->
