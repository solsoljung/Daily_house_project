<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 데이터피커X -->					
<%@ include file = "../../views/title2.jsp"%> <!-- <head> -->					
					
<%@ include file = "../../views/casahotel/casahotel_link2.jsp" %>					
<%@ include file = "../../views/islagrande/islagrande_link.jsp" %>
<style>
.page_link {
	cursor : pointer
}
</style>

<script>
$(function() {
// 	페이징 기능
	$(".page_link").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("data-page");
		$("input[name=page]").val(page);
		$("#frmPage").submit();
	});
});
</script>
<%@ include file = "../../views/islagrande/islagrande_menubar.jsp" %> <!-- </head> <body> -->					
<!-- 데이터피커X -->

<form id="frmPage" action="/boo/pointlist" method="get">
	<input type="hidden" name="page" value="${reviewPagingDto.page}">
</form>
<br>
<br>
<br>
<br>
<section class="ftco-section ftco-room">
	<div class="container">
		<h1>포인트 이용 내역</h1>
		<div class="row bg-white p-md-5 p-4 mb-5 border">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<div id="card-1">
						
							<c:forEach items="${pointList}" var="PointDto">
								<div class="card">
									<div class="card-header">
										 <a class="card-link collapsed" data-toggle="collapse" data-parent="#card-480417" href="#card-element-${PointDto.point_num}">
										 <table style="width: 100%;">
										 	<tr>
										 		<td style="width: 25%; color:black;">
										 			${PointDto.point_num}
										 		</td>
										 		<td style="width: 25%; color:black;">
										 			${PointDto.point_date}
										 		</td>
										 		<td
										 			<c:choose>
										 				<c:when test="${PointDto.point_code == 'R8'}">
										 					style="width: 25%; color: red;"
										 				</c:when>
										 				<c:when test="${PointDto.point_code == 'R6'}">
										 					style="width: 25%; color: red;"
										 				</c:when>
										 				<c:when test="${PointDto.point_code == 'R1'}">
										 					style="width: 25%; color: red;"
										 				</c:when>
										 				<c:otherwise>
										 					style="width: 25%; color: blue;"
										 				</c:otherwise>
										 			</c:choose>
										 		>
										 			Point:
										 			<c:choose>
										 				<c:when test="${PointDto.point_code == 'R8'}">
										 					-
										 				</c:when>
										 				<c:when test="${PointDto.point_code == 'R6'}">
										 					-
										 				</c:when>
										 				<c:when test="${PointDto.point_code == 'R1'}">
										 					-
										 				</c:when>
										 				<c:otherwise>
										 					+
										 				</c:otherwise>
										 			</c:choose>
										 			${PointDto.point_score}
										 		</td>
										 		<td style="width: 25%; color:black;">
										 			${PointDto.point_code_explain}
										 		</td>
										 	</tr>
										 </table>
										 </a>
									</div>
									<div id="card-element-${PointDto.point_num}" class="collapse">
										<div class="card-body">
										
											<c:choose>
								 				<c:when test="${PointDto.point_code == 'R1'}">
													<a href="/boo/detail?room_num=${PointDto.room_num}">${PointDto.room_title}</a><br>
													호스트 이메일 : ${PointDto.user_email}<br>
													지역 : ${PointDto.room_location} ${PointDto.room_location_detail}<br>
													방 평점 : ${PointDto.room_score}<br>
													방 가격 : ${PointDto.room_price}
								 				</c:when>
								 				<c:when test="${PointDto.point_code == 'R2'}">
													<a href="/boo/detail?room_num=${PointDto.room_num}">${PointDto.room_title}</a><br>
													호스트 이메일 : ${PointDto.user_email}<br>
													지역 : ${PointDto.room_location} ${PointDto.room_location_detail}<br>
													방 평점 : ${PointDto.room_score}<br>
													방 가격 : ${PointDto.room_price}
								 				</c:when>
								 				<c:when test="${PointDto.point_code == 'R3'}">
								 					<a href="/boo/detail?room_num=${PointDto.room_num}">${PointDto.room_title}</a> 곳에 리뷰를 남기셨습니다.
								 				</c:when>
								 				<c:when test="${PointDto.point_code == 'R4'}">
								 					회원 가입을 축하 드립니다 ^^
								 				</c:when>
								 				<c:when test="${PointDto.point_code == 'R5'}">
								 					<a href="/boo/detail?room_num=${PointDto.room_num}">${PointDto.room_title}</a> 곳에 예약 하셔서 마일리지가 적립 되었습니다.
								 				</c:when>
								 				<c:when test="${PointDto.point_code == 'R6'}">
								 					<a href="/boo/detail?room_num=${PointDto.room_num}">${PointDto.room_title}</a> 곳에 예약을 취소 하셔서 마일리지가 차감 되었습니다.
								 				</c:when>
								 				<c:when test="${PointDto.point_code == 'R7'}">
													<a href="/boo/detail?room_num=${PointDto.room_num}">${PointDto.room_title}</a><br>
													호스트 이메일 : ${PointDto.user_email}<br>
													지역 : ${PointDto.room_location} ${PointDto.room_location_detail}<br>
													방 평점 : ${PointDto.room_score}<br>
													방 가격 : ${PointDto.room_price}
								 				</c:when>
								 				<c:otherwise>
													<a href="/boo/detail?room_num=${PointDto.room_num}">${PointDto.room_title}</a><br>
													호스트 이메일 : ${PointDto.user_email}<br>
													지역 : ${PointDto.room_location} ${PointDto.room_location_detail}<br>
													방 평점 : ${PointDto.room_score}<br>
													방 가격 : ${PointDto.room_price}
								 				</c:otherwise>
								 			</c:choose>
								 			
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<!-- 페이징 -->
			<div class="col text-center">
				<div class="block-27">
					<ul>
					<c:if test="${reviewPagingDto.hasPrev == true}">
								<li>
									<a class="page_link" data-page="${reviewPagingDto.startPage - 1}">&lt;</a>
								</li>
							</c:if>
							<c:forEach begin="${reviewPagingDto.startPage}" end="${reviewPagingDto.endPage}" var="v">
								<li 
									<c:choose>
										<c:when test="${reviewPagingDto.page == v}">
											class="active"
										</c:when>
										<c:otherwise>
											class=""
										</c:otherwise>
									</c:choose>
								>
									<a class="page_link" data-page="${v}">${v}</a>
								</li>
							</c:forEach>
							<c:if test="${reviewPagingDto.hasNext == true}">
								<li>
									<a class="page_link" data-page="${reviewPagingDto.endPage + 1}">&gt;</a>
								</li>
							</c:if>
					</ul>
				</div>
          	</div>
          	<!-- 페이징 -->
          	
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
