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
        <div class="row">
          <div class="col-md-7" data-aos="fade-up" data-aos-delay="100">
            <form action="/si/foundPassword" method="post" role="form" class="bg-white p-md-5 p-4 mb-5 border">
                <div class="col-md-6 form-group">
                  <label class="text-black font-weight-bold">비밀번호 찾기</label>
                </div>
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="email">Email</label>
                  <input type="email" id="email" name="user_email" placeholder="Email" class="form-control">
                </div>
               </div>
              <br>
              <div class="col-md-8 text-right" data-aos="fade-up" data-aos-delay="200">
	            <input type="submit" class="btn btn-primary text-white py-3 px-5" value="비밀번호 찾기">
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
