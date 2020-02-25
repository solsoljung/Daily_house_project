<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 데이터피커X -->					
<%@ include file = "../../views/title2.jsp"%> <!-- <head> -->					
					
<%@ include file = "../../views/casahotel/casahotel_link2.jsp" %>					
<%@ include file = "../../views/islagrande/islagrande_link.jsp" %>					
					
<%@ include file = "../../views/islagrande/islagrande_menubar.jsp" %> <!-- </head> <body> -->					
<!-- 데이터피커X -->					



<!-- section -->
<br>
<br>
<section class="section contact-section" id="next">
      <div class="container">
          <div class="col-md-12" data-aos="fade-up" data-aos-delay="100">
            <form action="/si/login_run" method="post" role="form" class="bg-white p-md-5 p-4 mb-5 border">
              <div class="row">
                <div class="col-md-12 form-group row text-center">
                  <label class="text-black font-weight-bold" style="font-size: 50px">OUR COMPANY</label>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <label class="text-black font-weight-bold" style="font-size: 12x">
아디다스는 독일에 기반을 둔 글로벌 컴퍼니입니다.<br>
현재 전 세계적으로 5만 7천 명 이상의 직원이 근무하고 있으며, 독일 본사에만 100개가 넘는 국적의 직원들이 함께 하고 있습니다.<br>
아디다스는 매년 9억 개 이상의 스포츠 용품 및 스포츠 라이프 스타일 제품을 생산하고 있으며,<br>
2017년에만 약 210억 유로 이상의 매출을 달성하였습니다.<br>
또한, 아디다스 코리아는 1982년 한국 진출 이후 매년 높은 성장을 거듭하고 있으며,<br>
현재 직영 매장 직원을 포함, 970명 이상의 직원들이 근무하고 있습니다.
</label>
<br>
                  <input type="email" id="email" name="user_email" 
                     value="test@naver.com"
                  class="form-control" placeholder="Email" required="required">
                </div>
              </div>
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="password">Password</label>
                  <input type="password" id="pw" name="user_pw" class="form-control" 
                     value="1"
                  placeholder="Password" required="required">
                </div>
              </div>
              <br>
              <div class="row">
              	<div class="col-md-12 text-left" data-aos="fade-up" data-aos-delay="200">
		            <button type="submit" class="btn btn-primary text-white py-3 px-5 pull-right">로그인</button>
		            <br>
		            <br>
		            <br>
		            <a href="/si/registerHost"><button type="button" style="margin-left: 15px" class="btn btn-primary text-white py-2 px-4 pull-right">회원가입</button></a>&nbsp;&nbsp;&nbsp;&nbsp;
		            <a href="/si/findPassword"><button type="button" class="btn btn-primary text-white py-2 px-4 pull-right">비밀번호 찾기</button></a>
	         	</div>
	          </div>
            </form>
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
