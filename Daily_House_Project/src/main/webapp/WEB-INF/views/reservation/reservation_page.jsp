<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<%@ include file = "../../views/title.jsp"%> <!-- <head> -->

<%@ include file = "../../views/casahotel/casahotel_link.jsp" %>
<%@ include file = "../../views/islagrande/islagrande_link.jsp" %>

<%@ include file = "../../views/islagrande/islagrande_menubar.jsp" %> <!-- </head> <body> -->

<!-- reservation page section -->
<script>
$(function() {
	$("#reservationBtn").click(function() {
		location.href = "/yo/reservation_pay";
	});
	
	$(".plus").click(function(){					
		var num = $(this).prev().val();			
		var plusNum = parseInt(num) + 1;			
					
		if(plusNum >= 20) {			
			$(this).prev().val(num);		
		} else {			
			$(this).prev().val(plusNum);		
		}			
					
		var url = "change_book_num.ajax";			
		var v = $(this).prev().data("num");			
		var sData = {			
				book_num : v,	
				book_amount : plusNum	
		};			
		$.post(url, sData, function(rData){			
			//$(this).prev().val(plusNum);		
		});			
					
		//값 바뀔 때마다 체크박스 데이터의 개수도 바꿔주는 것			
		var myAmount = $(this).parent().parent().next().next().children();			
		$(myAmount).data("num",plusNum);			
		});			
	$(".minus").click(function(){				
		var num = $(this).next().val();			
		var minusNum = parseInt(num) - 1;			
					
		if(minusNum < 0) {			
			$(this).next().val(num);		
		} else {			
			$(this).next().val(minusNum);		
		}			
					
		var url = "change_book_num.ajax";			
		var v = $(this).next().data("num");			
		var sData = {			
				book_num : v,	
				book_amount : minusNum	
		};			
		$.post(url, sData, function(rData){			
		});			
					
		//값 바뀔 때마다 체크박스 데이터의 개수도 바꿔주는 것			
		var myAmount = $(this).parent().parent().next().next().children();			
		$(myAmount).data("num",minusNum);			
	});				
});


</script>

 <section class="site-hero inner-page overlay" style="background-image: url(/casahotel/img/slider-5.jpg)" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center text-center">
          <div class="col-md-10 text-center" data-aos="fade-up">
            <h1>
            	<span class="heading">
            		Reservation
            	</span>
            </h1>
            <h2>
            	<span style="font-size: 1em; color: white; font-family: 고딕;">
            		숙박예약
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
                <div class="col-md-6 form-group">
                  <label class="text-black font-weight-bold" for="name">예약자</label>
                  <input type="text" id="name" class="form-control ">
                </div>
                <div class="col-md-6 form-group">
                  <label class="text-black font-weight-bold" for="phone">연락처</label>
                  <input type="text" id="phone" class="form-control ">
                </div>
              </div>
          
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="email">Email</label>
                  <input type="email" id="email" class="form-control ">
                </div>
              </div>

              <div class="row">
                <div class="col-md-6 form-group">
                  <label class="text-black font-weight-bold" for="checkin_date">입실날짜</label>
                  <input type="text" id="checkin_date" class="form-control">
                </div>
                <div class="col-md-6 form-group">
                  <label class="text-black font-weight-bold" for="checkout_date">퇴실날짜</label>
                  <input type="text" id="checkout_date" class="form-control">
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
							<input type="number" data-num="1" class="numBox" min="1" max="20" value="1" readonly="readonly"/>
							<a class="plus">+</a>			
						</li>				
					</ul>	          
					 
                </div>
                <div class="col-md-6 form-group block-27">
                  <label for="adults" class="font-weight-bold text-black">아동</label>
                  <div class="field-icon-wrap">																					
                  </div>
					<ul>					
						<li>				
							<a class="minus">-</a>
							<input type="number" data-num="1" class="numBox" min="1" max="20" value="1" readonly="readonly"/>
							<a class="plus">+</a>	
						</li>				
					</ul> 
                </div>
			</div>
  
              <div class="col-md-6 form-group">
              	
			  </div>						
                 
              <div class="row mb-4">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="message">기타사항</label>
                  <textarea name="message" id="message" class="form-control " cols="30" rows="8"></textarea>
                </div>
              </div>
              <div class="row">
                <div class="col-md-6 form-group">
                  <input id="reservationBtn" type="button" value="예약하기" class="btn btn-primary text-white py-3 px-5">
                </div>
              </div>
            </form>

          </div>
          <div class="col-md-5" data-aos="fade-up" data-aos-delay="200">
            <div class="row">
              <div class="col-md-10 ml-auto contact-info">
                <p><span class="d-block">주소:</span> <span style="font-size: 1em; font-family: 고딕;">해당 숙소 주소</span></p>
                <p><span class="d-block">연락처:</span> <span style="font-size: 1em; font-family: 고딕;">해당 숙소 번호</span></p>
                <p><span class="d-block">Email:</span> <span style="font-size: 1em; font-family: 고딕;">해당 숙소 이메일</span></p>
                <p><span class="d-block">금액/1박:</span> <span style="font-size: 1em; font-family: 고딕;">해당 숙소 금액</span></p>
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