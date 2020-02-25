<link rel="stylesheet" href="/modal/modal.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file = "../../views/title2.jsp"%> <!-- <head> -->					
					
<%@ include file = "../../views/casahotel/casahotel_link2.jsp" %>					
<%@ include file = "../../views/islagrande/islagrande_link.jsp" %>					
					
<%@ include file = "../../views/islagrande/islagrande_menubar.jsp" %> <!-- </head> <body> -->					

<!-- reservation page section -->
<script>
$(function() {
	
});


</script>

 <section class="site-hero inner-page overlay" style="background-image: url(/casahotel/img/slider-5.jpg)" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center text-center">
          <div class="col-md-10 text-center" data-aos="fade-up">
            <h1>
            	<span class="heading">
            		예약취소
            	</span>
            </h1>
            <!-- <h2>
            	<span style="font-size: 1em; color: white; font-family: 고딕;">
            		숙박예약
            	</span>
            </h2> -->
          </div>
        </div>
      </div>

      <a class="mouse smoothscroll" href="#next">
        <div class="mouse-icon">
          <span class="mouse-wheel"></span>
        </div>
      </a>
</section>
<%-- ${dto} --%>
   <section class="section contact-section" id="next">
      <div class="container">
        <div class="row">
          <div class="col-md-12" data-aos="fade-up" data-aos-delay="100">
            <form action="/yo/reservation_pay" id="reservation" method="post" class="bg-white p-md-5 p-4 mb-5 border">
              <!-- 이메일 -->
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold">이메일</label>
                  <input type="email" id="email" class="form-control" value="${dto.user_email}" readonly="readonly">
                </div>
              </div>
              <!-- 숙소명 -->
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold">숙소명</label>
                  <input type="email" id="email" class="form-control" value="${dto.room_title}" readonly="readonly">
                </div>
              </div>
				<div class="row">
				<!-- 체크인 -->
                <div class="col-md-6 form-group">
                  <label class="text-black font-weight-bold">체크인</label>
                  <input type="text" id="name" class="form-control" value="${dto.room_reserv_start_date}" readonly="readonly">
                </div>
               <!-- 체크아웃 -->
                <div class="col-md-6 form-group">
                  <label class="text-black font-weight-bold">체크아웃</label>
                  <input type="text" id="phone" class="form-control" value="${dto.room_reserv_end_date}" readonly="readonly">
                </div>
              </div>
				<!-- 주소 -->
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold">주소</label>
                  <input type="email" id="email" class="form-control" value="${dto.room_location}" readonly="readonly">
                </div>
              </div>
				<!-- 가격 -->
              <div class="row">
                <div class="col-md-6 form-group">
                <br>
                  <label class="text-black" style="font-size:30px;">환불 예정 금액 : ${dto.reserv_price} 원</label>
                  <%-- <input type="email" id="email" class="form-control" value="${dto.reserv_price}" readonly="readonly"> --%>
                </div>
                <div class="col-md-6 form-group" align="right">
                <br>
                  <input id="reservationBtn" type="button" value="예약취소하기" class="btn btn-primary py-3 px-5" style="font-size:20px;">
                </div>
              </div>
  
              <div class="col-md-6 form-group">
              	
			  </div>						
                 
              <div class="row mb-4">
                <div class="col-md-12 form-group">
                  
                </div>
              </div>
              <div class="row">
                
              </div>
            </form>

          </div>
          <%-- <div class="col-md-5" data-aos="fade-up" data-aos-delay="200">
            <div class="row">
              <div class="col-md-10 ml-auto contact-info">
                <p><span class="d-block">숙소명:</span> 
                	<span style="font-size: 1em; font-family: 고딕;">${testDto.room_title}</span>
                </p>
                <p><span class="d-block">주소:</span>
                	<span style="font-size: 1em; font-family: 고딕;">${testDto.room_location}</span>
                </p>
                <p><span class="d-block">Email:</span> 
                	<span style="font-size: 1em; font-family: 고딕;">${testDto.user_email}</span>
                </p>
              </div>
            </div>
          </div> --%>
        </div>
      </div>
</section>
<!-- end section -->

<%@ include file = "../../views/casahotel/casahotel_footer.jsp" %>				
				
<%@ include file = "../../views/casahotel/casahotel_script2.jsp" %>				
<%@ include file = "../../views/islagrande/islagrande_script2.jsp" %>				
				
<%@ include file = "../../views/end.jsp"%> <!-- </body> -->				