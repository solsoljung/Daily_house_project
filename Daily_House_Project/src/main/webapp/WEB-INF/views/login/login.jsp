<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 데이터피커X -->					
<%@ include file = "../../views/title2.jsp"%> <!-- <head> -->					
					
<%@ include file = "../../views/casahotel/casahotel_link2.jsp" %>					
<%@ include file = "../../views/islagrande/islagrande_link.jsp" %>					
					
<%@ include file = "../../views/islagrande/islagrande_menubar.jsp" %> <!-- </head> <body> -->					
<!-- 데이터피커X -->					

<script>
$(document).ready(function() {
	var msg = "${msg}";
	
	if (msg == "fail") {
		alert("회원 정보가 없습니다.");
	}
	if (msg == "notFoundEmail") {
		alert("회원 정보가 없습니다.");
	}
	if (msg == "updatePassword") {
		alert("비밀번호가 변경되었습니다 다시 로그인해주세요.");
	}
});
</script>

<!-- section -->
<br>
<br>
<br>
<section class="section contact-section" id="next">
      <div class="container">
      <div class="container">
        <div class="row">
          <div class="col-md-7" data-aos="fade-up" data-aos-delay="100">
            <form action="/si/login_run" method="post" role="form" class="bg-white p-md-5 p-4 mb-5 border">
                <div class="col-md-6 form-group">
                  <label class="text-black font-weight-bold">로그인</label>
                </div>
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="email">Email</label>
                  <input type="email" id="email" name="user_email" class="form-control" placeholder="Email" required="required">
                </div>
              </div>
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="password">Password</label>
                  <input type="password" id="pw" name="user_pw" class="form-control" placeholder="Password" required="required">
                </div>
              </div>
              
              <br>
              <div class="col-md-8 text-left" data-aos="fade-up" data-aos-delay="200">
            	<div class="row">
		            <button type="submit" class="btn btn-primary text-white py-3 px-5">로그인</button>
	         	</div>
	          </div>
	          <br>
              <div class="col-md-8 text-left" data-aos="fade-up" data-aos-delay="500">
            	<div class="row">
		            <a href="/si/registerHost"><button type="button" class="btn btn-primary text-white py-2 px-4">회원가입</button></a>&nbsp;&nbsp;&nbsp;&nbsp;
		            <a href="/si/findPassword"><button type="button" class="btn btn-primary text-white py-2 px-4">비밀번호 찾기</button></a>
	         	</div>
	          </div>
            </form>
          </div>
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
