<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file = "../../views/title.jsp"%> <!-- <head> -->

<%@ include file = "../../views/casahotel/casahotel_link.jsp" %>
<%@ include file = "../../views/islagrande/islagrande_link.jsp" %>

<%@ include file = "../../views/islagrande/islagrande_menubar.jsp" %> <!-- </head> <body> -->

<!-- reservation page section -->
<script>
$(function() {
	$("#payBtn").click(function() {
		location.href = "/yo/reservation_list";
	});
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

  <section class="section contact-section" id="next">
      <div class="container">
        <div class="row">
          <div class="col-md-7" data-aos="fade-up" data-aos-delay="100">
            
            <form action="#" method="post" class="bg-white p-md-5 p-4 mb-5 border">
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="name">예약자</label>
                  <input type="text" id="name" class="form-control ">
                </div>
              </div>
              
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="phone">연락처</label>
                  <input type="text" id="name" class="form-control ">
                </div>
              </div>
          
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="name">총 결제금액</label>
                  <input type="text" id="pay" class="form-control ">
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
                  <input id="payBtn" type="button" value="결제하기" class="btn btn-primary text-white py-3 px-5">
                </div>
              </div>
            </form>

          </div>
          <div class="col-md-5" data-aos="fade-up" data-aos-delay="200">
            <div class="row">
              <div class="col-md-10 ml-auto contact-info">
                <p><span class="d-block">숙소명:</span> <span style="font-size: 1em; font-family: 고딕;">숙소 이름</span></p>
                <p><span class="d-block">최대인원:</span> <span style="font-size: 1em; font-family: 고딕;">인원</span></p>
                <p><span class="d-block">옵션:</span> <span style="font-size: 1em; font-family: 고딕;">숙소 옵션</span></p>
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