<link rel="stylesheet" href="/modal/modal.css">
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
	
	// 데이트 피커
	//달력
	$('#datePickerStart').datepicker({
		    format: "yyyy-MM-dd",	
		    startDate: 'd',	
		    endDate: '+30d',	
		    autoclose : true,
		    clearBtn : false, 
		    datesDisabled : false,
		    daysOfWeekDisabled : false,
		    daysOfWeekHighlighted : [0,6],
		    disableTouchKeyboard : false,	
		    immediateUpdates: false,	
		    templates : {
		        leftArrow: '&laquo;',
		        rightArrow: '&raquo;'
		    }, 
		    showWeekDays : true ,
		    title: "CheckIn",
		    todayHighlight : true ,	
		    toggleActive : true,
		    weekStart : 0 ,
		    language : "ko"            
		    
		});//datepickerin end


		$('#datePickerEnd').datepicker({
 			format: "yyyy-MM-dd",	
		    startDate:'d',	
		    endDate: '+30d',	
		    autoclose : true,
		    clearBtn : false, 
		    datesDisabled : false,
		    daysOfWeekDisabled : false,
		    daysOfWeekHighlighted : [0,6],
		    disableTouchKeyboard : false,	
		    immediateUpdates: false,	
		    templates : {
		        leftArrow: '&laquo;',
		        rightArrow: '&raquo;'
		    }, 
		    showWeekDays : true ,
		    title: "CheckOut",
		    todayHighlight : true ,	
		    toggleActive : true,
		    weekStart : 0 ,
		    language : "ko"
		});//datepicker end
	
	// 날짜 사이 세기
	$("#btnTest").click(function() {
		var date1_val = $("#datePickerStart").val();
		var date2_val = $("#datePickerEnd").val();
		
		var arrDate1 = date1_val.split("-");
		var arrDate2 = date2_val.split("-");
		console.log(arrDate1);
		console.log(arrDate2);
		
		var date1_year = arrDate1[0];
		var date1_month = arrDate1[1];
		var date1_date = arrDate1[2];
		
		var date2_year = arrDate2[0];
		var date2_month = arrDate2[1];
		var date2_date = arrDate2[2];
		
		var v = 0;
		
		if (date1_month == date2_month && date1_date < date2_date) {
			v = parseInt(date2_date) - parseInt(date1_date);
			console.log(v);
		} else if ((date1_month < date2_month && date1_date < date2_date) 
				|| (date1_month < date2_month && date1_date > date2_date)) {
			if (date1_month == "01" || date1_month == "03" || date1_month == "05" 
									|| date1_month == "07" || date1_month == "08" 
									|| date1_month == "10" || date1_month == "12") {
				v = parseInt(date2_date) + (31 - parseInt(date1_date));
				console.log(v);
			} else if (date1_month == "04" || date1_month == "06" 
					|| date1_month == "09" || date1_month == "11") {
				v = parseInt(date2_date) + (30 - parseInt(date1_date));
				console.log(v);
			} else if (date1_month == "02") {
				if (date1_year % 4 == 0) {
					v = parseInt(date2_date) + (29 - parseInt(date1_date));
					console.log(v);
				} else if (date1_year % 100 == 0) {
					v = parseInt(date2_date) + (28 - parseInt(date1_date));
					console.log(v);
				} else if (date1_year % 400 == 0) {
					v = parseInt(date2_date) + (29 - parseInt(date1_date));
					console.log(v);
				} else {
					v = parseInt(date2_date) + (28 - parseInt(date1_date));
					console.log(v);
				}
			}
		}
 	});
	
	
	$("#reservationBtn").click(function() {
		location.href = "/yo/reservation_pay";
	});

	
	// 인원수 빼고 더하기
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
${userVo}
   <section class="section contact-section" id="next">
      <div class="container">
        <div class="row">
          <div class="col-md-7" data-aos="fade-up" data-aos-delay="100">
            <form action="/yo/reservation_pay" method="post" id="reservation" class="bg-white p-md-5 p-4 mb-5 border">
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
                  <input type="text" id="datePickerStart" class="form-control">
                </div>
                <div class="col-md-6 form-group">
                  <label class="text-black font-weight-bold" for="checkout_date">퇴실날짜</label>
                  <input type="text" id="datePickerEnd" class="form-control">
                </div>
              </div>
              <div>
              	<button type="button" id="btnTest">클릭</button>
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