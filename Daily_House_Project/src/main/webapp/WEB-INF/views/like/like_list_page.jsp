<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file = "../../views/title.jsp"%> <!-- <head> -->

<%@ include file = "../../views/casahotel/casahotel_link.jsp" %>
<%@ include file = "../../views/islagrande/islagrande_link.jsp" %>

<%@ include file = "../../views/islagrande/islagrande_menubar.jsp" %> <!-- </head> <body> -->

<!-- reservation page section -->

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
<div class="container-fluid">
	<div class="row">
	<div class="col-md-2">
	</div>
	<div class="col-md-8">
		<ul class="post-list list-unstyled">
			<li>
				<a href="#" class="d-flex">
				<span class="mr-3 image">
					<img src="/casahotel/img/img_1.jpg" alt="Image placeholder" class="img-fluid">
				</span>
				<div>
					<span>숙소 이름</span>
					<br>
					<span class="meta">숙소 주소</span>
					<br>
					<span>♥</span>
				</div>
				</a>
			</li>  
		</ul>
		<ul class="post-list list-unstyled">
			<li>
				<a href="#" class="d-flex">
				<span class="mr-3 image">
					<img src="/casahotel/img/img_1.jpg" alt="Image placeholder" class="img-fluid">
				</span>
				<div>
					<span>${RoomVo.room_title}</span>
					<br>
					<span class="meta">${RoomVo.room_location_detail}</span>
					<br>
					<span>♥</span>
				</div>
				</a>
			</li>  
		</ul>
		</div>
	</div>
</div>

</section>

<!-- end section -->

<%@ include file = "../../views/casahotel/casahotel_footer.jsp" %>

<%@ include file = "../../views/casahotel/casahotel_script.jsp" %>
<%@ include file = "../../views/islagrande/islagrande_script.jsp" %>

<%@ include file = "../../views/end.jsp"%> <!-- </body> -->