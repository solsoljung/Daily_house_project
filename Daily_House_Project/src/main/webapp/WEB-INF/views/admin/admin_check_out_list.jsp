<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 데이터피커X -->					
<%@ include file = "../../views/title2.jsp"%> <!-- <head> -->					
					
<%@ include file = "../../views/casahotel/casahotel_link2.jsp" %>					
<%@ include file = "../../views/islagrande/islagrande_link.jsp" %>					
					
<%@ include file = "../../views/islagrande/islagrande_menubar.jsp" %> <!-- </head> <body> -->					
<!-- 데이터피커X -->

<!-- 시작 -->
<script>
$(function() {
	
	$(".btnApprove").click(function() {
		var that = $(this);
		var room_num = $(this).attr("data-room_num");
		var reserv_num = $(this).attr("data-reserv_num");
		var host_email = $(this).attr("data-host_email");
		var user_email = $(this).attr("data-user_email");
		var reserv_price = $(this).attr("data-reserv_price");
		var sendData = {
				"room_num" : room_num,
				"reserv_num" : reserv_num,
				"host_email" : host_email,
				"user_email" : user_email,
				"reserv_price" : reserv_price
		};
		
		var url = "/yo/approveCheckout";

		$.ajax({
			"type" : "post",
			"url" : url,
			"headers" : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "post"
			},
			"dataType" : "text",
			"data" : JSON.stringify(sendData),
			"success" : function(rData) {
				console.log(rData);
				if(rData == "success"){
					var deleteTarget = that.parent().parent();
					deleteTarget.fadeOut('1000');
				}
			}
		}); 
	});
});
</script>

<section class="site-hero inner-page overlay" style="background-image: url(/casahotel/img/slider-3.jpg)" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center text-center">
          <div class="col-md-10 text-center" data-aos="fade-up">
            <h1>
            	<span class="heading">
            		숙박 완료 승인
            	</span>
            </h1>
            <h2>
            	<!-- <span style="font-size: 1em; color: white; font-family: 고딕;">
            		예약 및 결제내역
            	</span> -->
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
<section>
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div><br><br>
		</div>
	</div>
</section>
<section>
	<div class="container">
		<div class="row">
          <div class="col-md-7" data-aos="fade-up" data-aos-delay="100">
          	<div class="row">
                <div class="col-md-6 form-group">
                </div>
            </div>
          </div>
        </div>
	</div>
</section>
<section>
<div class="container-fluid">
	<div class="row">
	<div class="col-md-2">
	</div>
		<div class="col-md-8">
			<table class="table">
				<thead>
					<tr>
						<th>방번호</th>
						<th>예약번호</th>
						<th>호스트 이메일</th>
						<th>유저 이메일</th>
						<th>입실 날짜</th>
						<th>퇴실 날짜</th>
						<th>결제 금액</th>
						<th>승인 가능</th>
					</tr>
				</thead>
				<tbody>
				<jsp:useBean id="toDay" class="java.util.Date"></jsp:useBean>
				<fmt:formatDate value="${toDay}" pattern="yyyy-MM-dd" var="toDay"/>
				<c:forEach items="${list}" var="vo">
						<tr id="reservationList">
							<td>${vo.room_num}</td>
							<td>${vo.reserv_num}</td>
							<td>${vo.host_email}</td>
							<td>${vo.user_email}</td>
							<td>${vo.room_reserv_start_date}</td>
							<td>${vo.room_reserv_end_date}</td>
							<td>${vo.reserv_price}</td>
							<c:if test="${toDay > vo.room_reserv_end_date}">
								<td>
<input type="button" class="btnApprove btn btn-primary" data-room_num="${vo.room_num}" data-host_email="${vo.host_email}" 
data-reserv_num="${vo.reserv_num}" data-user_email="${vo.user_email}" data-reserv_price="${vo.reserv_price}" value="승인">
								</td>
							</c:if>
						</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>
</section>
<section>
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div><br><br>
		</div>
	</div>
</section>
<!-- 끝 -->

<%@ include file = "../../views/casahotel/casahotel_script2.jsp" %>			
<%@ include file = "../../views/islagrande/islagrande_script2.jsp" %>	

<%@ include file = "../../views/end.jsp"%> <!-- </body> -->