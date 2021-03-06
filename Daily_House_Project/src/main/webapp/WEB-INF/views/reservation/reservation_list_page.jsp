<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file = "../../views/title2.jsp"%> <!-- <head> -->					
					
<%@ include file = "../../views/casahotel/casahotel_link2.jsp" %>					
<%@ include file = "../../views/islagrande/islagrande_link.jsp" %>					
					
<%@ include file = "../../views/islagrande/islagrande_menubar.jsp" %> <!-- </head> <body> -->

<!-- reservation page section -->
<script>
$(document).ready(function() {
	// 예약 내역 삭제 버튼
	$(".cancelBtn").click(function(e) {
		
		var reserv_num = $(this).parent().parent().eq(0).children().eq(0).attr("data-num");
		location.href = "/yo/reserv_cancle_page/" + reserv_num;
	}); // 내역 삭제 버튼
	
	function reservationList() {
		$("#reservationList").empty();
		var url = "/yo/reservation_list";
		$.getJSON(url, function(rData) {
			console.log(rData);
			var strHtml = "";
			$(rData).each(function() {
				strHtml += "<tr>";
				strHtml += "<td>" + this.reserv_num +"</td>";
				strHtml += "<td>" + this.room_num +"</td>";
				strHtml += "<td>" + this.user_email +"</td>";
				strHtml += "<td>" + this.room_reserv_start_date +"</td>";
				strHtml += "<td>" + this.room_reserv_end_date +"</td>";
				strHtml += "<td>" + this.reserv_price +"</td>";
				strHtml += "<td><button type='button' class='cancelBtn'";
				strHtml += " data-reserv_num='" + this.reserv_num + "'>삭제</button></td>";
				strHtml += "</tr>";
			});
			$("#reservationList").append(strHtml);
		});
	}
});
</script>
<section class="site-hero inner-page overlay" style="background-image: url(/casahotel/img/slider-3.jpg)" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center text-center">
          <div class="col-md-10 text-center" data-aos="fade-up">
            <h1>
            	<span class="heading">
            		Reservation List
            	</span>
            </h1>
            <h2>
            	<span style="font-size: 1em; color: white; font-family: 고딕;">
            		예약 및 결제내역
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
						<th>예약 번호</th>
						<th>방 번호</th>
						<th>예약 이메일</th>
						<th>입실 날짜</th>
						<th>퇴실 날짜</th>
						<th>결제 금액</th>
					</tr>
				</thead>
				<tbody>
				<jsp:useBean id="toDay" class="java.util.Date"></jsp:useBean>
				<fmt:formatDate value="${toDay}" pattern="yyyy-MM-dd" var="toDay"/>
				<c:forEach items="${list}" var="reservationVo">
						<tr id="reservationList">
							<td data-num="${reservationVo.reserv_num}">${reservationVo.reserv_num}</td>
							<td>${reservationVo.room_num}</td>
							<td>${reservationVo.user_email}</td>
							<td>${reservationVo.room_reserv_start_date}</td>
							<td>${reservationVo.room_reserv_end_date}</td>
							<td>${reservationVo.reserv_price}</td>
							<c:if test="${reservationVo.reserv_state == 'Y' && toDay < reservationVo.room_reserv_start_date}">
								<td>
									<input type="button" class="btn btn-primary cancelBtn" data-reserv_num="${reservationVo.reserv_num}" value="예약취소">
								</td>
							</c:if>
							<c:if test="${reservationVo.reserv_state == 'N'}">
								<td style="color:#7ab8df;">예약 취소 대기 중입니다.</td>
							</c:if>
							<c:if test="${reservationVo.reserv_state == 'R'}">
								<td style="color:#fb929e;">예약 취소된 방입니다.</td>
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

<!-- end section -->

<%@ include file = "../../views/casahotel/casahotel_footer.jsp" %>				
				
<%@ include file = "../../views/casahotel/casahotel_script2.jsp" %>				
<%@ include file = "../../views/islagrande/islagrande_script2.jsp" %>				
				
<%@ include file = "../../views/end.jsp"%> <!-- </body> -->				