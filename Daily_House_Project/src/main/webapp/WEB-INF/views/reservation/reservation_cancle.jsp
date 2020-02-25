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
<%-- userVo: ${userVo}<br>
testDTo: ${testDto}
   <section class="section contact-section" id="next">
      <div class="container">
        <div class="row">
          <div class="col-md-7" data-aos="fade-up" data-aos-delay="100">
            <form action="/yo/reservation_pay" id="reservation" method="post" class="bg-white p-md-5 p-4 mb-5 border">
	          <input type="hidden" name="room_num" value="${testDto.room_num}">
	          <input type="hidden" name ="check_in" value="${testDto.check_in}">
	          <input type="hidden" name ="check_out" value="${testDto.check_out}">
	          <input type="hidden" name="room_title" value="${testDto.room_title}">
	          <input type="hidden" name="room_price" value="${testDto.room_price}">
	          <input type="hidden" name="room_people" value="${testDto.room_people}">
	          <input type="hidden" name="v" value="">
              <div class="row">
                <div class="col-md-6 form-group">
                  <label class="text-black font-weight-bold" for="name">예약자</label>
                  <input type="text" id="name" class="form-control" value="${userVo.user_name}">
                </div>
                <div class="col-md-6 form-group">
                  <label class="text-black font-weight-bold" for="phone">연락처</label>
                  <input type="text" id="phone" class="form-control" value="${userVo.user_phone}">
                </div>
              </div>
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="email">Email</label>
                  <input type="email" id="email" class="form-control" value="${userVo.user_email}">
                </div>
              </div>

              <div class="row">
                <div class="col-md-6 form-group">
                  <label class="text-black font-weight-bold" for="checkin_date">입실날짜</label>
                  <input type="text" id="dateCheckIn" class="form-control" value="${testDto.check_in}" readonly>
                </div>
                <div class="col-md-6 form-group">
                  <label class="text-black font-weight-bold" for="checkout_date">퇴실날짜</label>
                  <input type="text" id="dateCheckOut" class="form-control" value="${testDto.check_out}" readonly>
                </div>
              </div>

              <div class="row">
                <div class="col-md-6 form-group block-27">
                  <label for="adults" class="font-weight-bold text-black">어른</label>
                  <div class="field-icon-wrap">																				
				  </div>  
					<ul>					
						<li>				
							<a class="minus">-</a>
							<input type="number" data-num="1" class="numBox" min="1" max="20" value="1" readonly="readonly" style="text-align:center;text-size:20px;"/>
							<a class="plus">+</a>			
						</li>				
					</ul>	          
					 
                </div>
			</div>
  
              <div class="col-md-6 form-group">
              	
			  </div>						
                 
              <div class="row mb-4">
                <div class="col-md-12 form-group">
                  
                </div>
              </div>
              <div class="row">
                <div class="col-md-6 form-group">
                  <input id="reservationBtn" type="button" value="예약하기" class="btn btn-primary py-3 px-5" style="font-size:20px;">
                </div>
              </div>
            </form>

          </div>
          <div class="col-md-5" data-aos="fade-up" data-aos-delay="200">
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
          </div>
        </div>
      </div> --%>
</section>
<!-- end section -->

<%@ include file = "../../views/casahotel/casahotel_footer.jsp" %>				
				
<%@ include file = "../../views/casahotel/casahotel_script2.jsp" %>				
<%@ include file = "../../views/islagrande/islagrande_script2.jsp" %>				
				
<%@ include file = "../../views/end.jsp"%> <!-- </body> -->				