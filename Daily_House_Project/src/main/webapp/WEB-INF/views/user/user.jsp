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
	$("#btnUpdate").click(function(e) {
		console.log("눌러찌롱~");
		$("#user_name").css("color", "#ff0000");
		$("#user_pw").css("color", "#ff0000");
		$("#user_pw2").css("color", "#ff0000");
	});
// 		$("btnSubmit")
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
                  <input type="email" value="${userVo.user_email}"class="form-control" required readonly>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="name">Name</label>
                  <input type="text" value="${userVo.user_name}" id="user_name" name="user_name" placeholder="이름을 입력해주세요" class="form-control" required readonly>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="pw">Password</label>
                  <input type="password" id="user_pw" name="user_pw" class="form-control" required readonly>
                  <label class="text-black font-weight-bold" for="pw2">Password Check</label>
                  <input type="password"id="user_pw2" class="form-control" required readonly>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="phone">Phone</label>
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
                  <label class="text-black font-weight-bold" for="picture">Picture</label>
                  <input type="text" value="${userVo.user_pic}" id="user_pic" name="user_pic" class="form-control" required readonly >
                </div>
              </div>
                <hr>
              <div class="col-md-10 text-right" data-aos="fade-up" data-aos-delay="200">
	            <button type="button" class="btn btn-primary text-white py-3 px-5" id="btnUpdate">수정하기</button>
	            <button type="button" class="btn btn-primary text-white py-3 px-5" id="btnSubmit" style="display: none;">저장하기</button>
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