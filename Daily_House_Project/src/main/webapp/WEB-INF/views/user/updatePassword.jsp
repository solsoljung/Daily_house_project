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
$(function(){
	$("#btnSubmit").click(function(e) {
		// 얻어온 값
		var pw1 = $("#pw").val().trim();
		var pw2 = $("#pw2").val().trim();
		// 테스트 내용
		var pattern1 = /[0-9]/;
		var pattern2 = /[a-zA-Z]/;
		var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/;

		if (!pattern1.test(pw1) || !pattern2.test(pw1) || !pattern3.test(pw1) || pw1.length < 6) {
			alert("비밀번호는 6자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다.");
			return false;
		}
		if (pw1 != pw2) {
			alert("비밀번호 불일치합니다.");
			return false;
		}
	});
});
</script>
<!-- section -->
<br>
<br>
<section class="section contact-section" id="next">
      <div class="container">
        <div class="row">
          <div class="col-md-7" data-aos="fade-up" data-aos-delay="100">
            <form action="/si/updatePassword" method="post" role="form" class="bg-white p-md-5 p-4 mb-5 border">
            	<input type="hidden" name="user_email" value="${userVo.user_email}">
             <div class="col-md-6 form-group">
               <label class="text-black font-weight-bold">비밀번호 변경</label>
             </div>
             <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="password">Password</label>
                  <input type="password" id="pw" name="user_pw" placeholder="6자 이상 영문,숫자,특수문자를 조합해서 입력해주세요." class="form-control" required maxlength="20">
                  <br>
                  <label class="text-black font-weight-bold" for="password">Password Check</label>
                  <input type="password" id="pw2" class="form-control" placeholder="Password Check" required maxlength="20">
	              <br>
                </div>
              </div>
	          <div class="col-md-12 text-right" data-aos="fade-up" data-aos-delay="200">
              	<div class="row">
	            	<input type="submit" id="btnSubmit" class="btn btn-primary text-white py-2 px-4" value="비밀번호 변경">&nbsp;&nbsp;&nbsp;&nbsp;
			        <a href="/si/userInformation"><button type="button" class="btn btn-primary text-white py-2 px-5" id="btnBack">취소</button></a>
		        </div>
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

<!-- 데이터피커X -->			
			
<%@ include file = "../../views/casahotel/casahotel_footer.jsp" %>			
			
<%@ include file = "../../views/casahotel/casahotel_script2.jsp" %>			
<%@ include file = "../../views/islagrande/islagrande_script2.jsp" %>			
			
<%@ include file = "../../views/end.jsp"%> <!-- </body> -->			
			
<!-- 데이터피커X -->			
