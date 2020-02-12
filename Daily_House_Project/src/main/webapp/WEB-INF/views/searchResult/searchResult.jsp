<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<%@ include file = "../../views/title.jsp"%> <!-- <head> -->

<%@ include file = "../../views/casahotel/casahotel_link.jsp" %>
<%@ include file = "../../views/islagrande/islagrande_link.jsp" %>

<%@ include file = "../../views/islagrande/islagrande_menubar.jsp" %> <!-- </head> <body> -->

<!-- section -->   
<br>
<br>
<br>
<br>
${list}
<section class="ftco-section ftco-room">
			<div class="container">
        <div class="row">
        
        <!-- 여기부터 -->
        <c:forEach begin="1" end="16">
        	<div class="col-md-3">
        		<div class="room-wrap ftco-animate">
        			<a href="room.html" class="img" style="background-image: url(/islagrande/images/room-1.jpg);"></a>
        			<div class="text pt-4 pl-lg-5">
        				<h2><a href="room.html">광안리 1분 거리</a></h2>
        				<p class="rate">
        					<span class="icon-star"></span>
        					<span class="icon-star"></span>
        					<span class="icon-star"></span>
        					<span class="icon-star"></span>
        					<span class="icon-star-half-full"></span>
        				</p>
        				<p class="d-flex price-details align-items-center pt-3">
        					<!-- <span>Starting From</span> -->
        					<span class="price">￦65,700<small>&nbsp;/&nbsp;&nbsp;&nbsp;1박</small></span>
        				</p>
        				<p><a href="#" class="btn-customize">지금 예약하기</a></p>
        			</div>
        		</div>
        	</div>
        	</c:forEach>
        	<!-- 여기까지 -->
        </div>
			</div>
		</section>


<!-- end section -->

<%@ include file = "../../views/casahotel/casahotel_footer.jsp" %>

<%@ include file = "../../views/casahotel/casahotel_script.jsp" %>
<%@ include file = "../../views/islagrande/islagrande_script.jsp" %>

<%@ include file = "../../views/end.jsp"%> <!-- </body> -->