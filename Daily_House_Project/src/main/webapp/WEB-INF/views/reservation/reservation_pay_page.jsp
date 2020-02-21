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
	$("#payBtn").click(function() {
		// 결제금액 포인트가 차감되어야 하므로 tbl_user의 포인트 업데이트
		$("#reservation_pay").submit();
	});
});

$(function() {
	$("#pay").val(v);
});

</script>

 <section class="site-hero inner-page overlay" style="background-image: url(/casahotel/img/slider-5.jpg)" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center text-center">
          <div class="col-md-10 text-center" data-aos="fade-up">
            <h1>
            	<span class="heading">
            		Reservation Pay
            	</span>
            </h1>
            <h2>
            	<span style="font-size: 1em; color: white; font-family: 고딕;">
            		예약결제
            	</span>
            </h2>
          </div>
        </div>
      </div>
      <a class="mouse smoothscroll" href="#next">
        <div class="mouse-icon">
          <span class="mouse-wheel"></span>
        </div>
      </a>
</section>
userVo: ${userVo}<br>
testDto: ${testDto}
  <section class="section contact-section" id="next">
      <div class="container">
        <div class="row">
          <div class="col-md-7" data-aos="fade-up" data-aos-delay="100">
            
            <form action="/yo/reservation_insert" id="reservation_pay" method="post" class="bg-white p-md-5 p-4 mb-5 border">
              <input type="hidden" name="user_email" value="${userVo.user_email}">
              <input type="hidden" name="room_num" value="${testDto.room_num}">
	          <input type="hidden" name ="check_in" value="${testDto.check_in}">
	          <input type="hidden" name ="check_out" value="${testDto.check_out}">
	          <input type="hidden" name ="room_price" value="${testDto.room_price}">
	          <input type="hidden" name="v" value="${testDto.v}">
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="name">예약자</label>
                  <input type="text" id="name" class="form-control" value="${userVo.user_name}">
                </div>
              </div>
              
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="phone">연락처</label>
                  <input type="text" id="name" class="form-control" value="${userVo.user_phone}">
                </div>
              </div>
          
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="name">총 결제금액</label>
                  <input type="text" id="pay" class="form-control" value="${testDto.v * testDto.room_price}원">
                </div>
              </div>
              
              <div class="row">
                <div class="col-md-6 form-group">
                  <label for="adults" class="font-weight-bold text-black">결제방식</label>
                  <div class="field-icon-wrap">
                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                    <select name="" id="adults" class="form-control">
                      <option value="">신용카드</option>
                      <option value="">무통장입금</option>
                      <option value="">카카오페이</option>
                      <option value="">휴대폰</option>
                    </select>
                  </div>
                </div>
              </div>
              
              <div class="row">
                <div class="col-md-6 form-group">
                  <input id="payBtn" type="button" value="결제하기" class="btn btn-primary py-3 px-5" style="font-size:20px;">
                </div>
              </div>
            </form>

          </div>
          <div class="col-md-5" data-aos="fade-up" data-aos-delay="200">
            <div class="row">
              <div class="col-md-10 ml-auto contact-info">
                <p><span class="d-block">최대인원:</span>
                	<span style="font-size: 1em; font-family: 고딕;">${testDto.room_people}명</span>
                </p>
                <p><span class="d-block">금액/1박:</span>
                	<span style="font-size: 1em; font-family: 고딕;">${testDto.room_price}원</span>
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
</section>
 




<!-- end section -->

<%@ include file = "../../views/casahotel/casahotel_footer.jsp" %>				
				
<%@ include file = "../../views/casahotel/casahotel_script2.jsp" %>				
<%@ include file = "../../views/islagrande/islagrande_script2.jsp" %>				
				
<%@ include file = "../../views/end.jsp"%> <!-- </body> -->				