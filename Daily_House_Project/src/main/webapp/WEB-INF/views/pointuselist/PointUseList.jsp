<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 데이터피커X -->					
<%@ include file = "../../views/title2.jsp"%> <!-- <head> -->					
					
<%@ include file = "../../views/casahotel/casahotel_link2.jsp" %>					
<%@ include file = "../../views/islagrande/islagrande_link.jsp" %>

<%@ include file = "../../views/islagrande/islagrande_menubar.jsp" %> <!-- </head> <body> -->					
<!-- 데이터피커X -->
<br>
<br>
<br>
<br>
<section class="ftco-section ftco-room">
	<div class="container">
		<div class="row">
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
											타이틀 클릭시 이용할 방번호 : ${PointDto.room_num} <br>
											방 제목 : ${PointDto.room_title}<br>
											호스트 이메일 : ${PointDto.user_email}<br>
											지역 : ${PointDto.room_location} ${PointDto.room_location_detail}<br>
											방 평점 : ${PointDto.room_score}<br>
											방 가격 : ${PointDto.room_price}<br>
											최대 인원 수 : ${PointDto.room_people}<br>
											침대 수 : ${PointDto.room_bed}<br>
											화장실 수 : ${PointDto.room_bathroom}
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
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
