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
										 <table style="width: 100%">
										 	<tr>
										 		<td>
										 			${PointDto.point_num}
										 		</td>
										 		<td>
										 			${PointDto.point_date}
										 		</td>
										 		<td>
										 			${PointDto.point_score}
										 		</td>
										 		<td>
										 			${PointDto.point_code_explain}
										 		</td>
										 	<tr>
										 </table>
										 </a>
									</div>
									<div id="card-element-${PointDto.point_num}" class="collapse">
										<div class="card-body">
											${PointDto.room_title} ${PointDto.room_num}
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
