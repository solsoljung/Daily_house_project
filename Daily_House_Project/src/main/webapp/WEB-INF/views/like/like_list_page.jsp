<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file = "../../views/title.jsp"%> <!-- <head> -->

<%@ include file = "../../views/casahotel/casahotel_link.jsp" %>
<%@ include file = "../../views/islagrande/islagrande_link.jsp" %>

<%@ include file = "../../views/islagrande/islagrande_menubar.jsp" %> <!-- </head> <body> -->

<!-- reservation page section -->
<style>
#heartDiv {
	margin-left: 210px;
	font-size: 40px;
}
</style>
<script>
$(document).ready(function() {
	$("#heartDiv").click(function() {
		
	});
	

	$("#reservBtn").click(function() {
		location.href = "/yo/reservation";
	});


});
</script>
<section class="site-hero inner-page overlay" style="background-image: url(/casahotel/img/slider-6.jpg)" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center text-center">
          <div class="col-md-10 text-center" data-aos="fade-up">
            <h1>
            	<span class="heading">
            		Like List
            	</span>
            </h1>
            <h2>
            	<span style="font-size: 1em; color: white; font-family: 고딕;">
            		찜목록
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
<div class="container">
<div class="row">
	<c:forEach items="${likeList}" var="LikeDto">
	
	<div class="col-md-3">	
	<div class="row mb-5">
	</div>
		<div class="room-wrap ftco-animate">
		
				<a href="room.html" class="img" style="background-image: url(/islagrande/images/room-1.jpg);">
					<span id="heartDiv">♥</span>
				</a>
				<div class="text pt-4 pl-lg-5">
				<h2><a data-num="${LikeDto.room_num}" class="room-title">${LikeDto.room_title}</a></h2>
				<p class="d-flex price-details align-items-center pt-3">
					<span class="price">￦${LikeDto.room_price}<small>&nbsp;/&nbsp;&nbsp;&nbsp;1박</small></span>
				</p>
				<p><a data-num="${LikeDto.room_num}" class="room-title btn-customize" id="reservBtn">지금 예약하기</a></p>
			</div>
		</div>
	</div>
	</c:forEach>
</div>
</div>
</section>

<!-- end section -->

<%@ include file = "../../views/casahotel/casahotel_footer.jsp" %>

<%@ include file = "../../views/casahotel/casahotel_script.jsp" %>
<%@ include file = "../../views/islagrande/islagrande_script.jsp" %>

<%@ include file = "../../views/end.jsp"%> <!-- </body> -->