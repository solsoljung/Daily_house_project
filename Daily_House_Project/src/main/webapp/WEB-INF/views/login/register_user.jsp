<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<%@ include file="../title.jsp"%> <!-- <head> -->

<%@ include file="../casahotel/casahotel_link.jsp" %>
<%@ include file="../islagrande/islagrande_link.jsp" %>

<%@ include file="../islagrande/islagrande_menubar.jsp" %> <!-- </head> <body> -->

<script>
	var message = "${message}";
	if (message != "") {
		alert(message);
	}
</script>

<!-- reservation page section -->
<section class="site-hero inner-page overlay" style="background-image: url(/casahotel/img/slider-3.jpg)" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center text-center">
    <section class="section contact-section" id="next">
      <div class="container">
        <div class="row">
          <div class="col-md-7" data-aos="fade-up" data-aos-delay="100">
            
            <form action="/login/join_run" method="post" class="bg-white p-md-5 p-4 mb-5 border">
                <div class="col-md-6 form-group">
                  <label class="text-black font-weight-bold">회원가입 ${message}</label>
                </div>
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="email">Email</label>
                  <input type="email" id="email" class="form-control ">
                </div>
              </div>
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="password">Password</label>
                  <input type="password" id="pw" class="form-control ">
                </div>
              </div>
              <div class="row">
                <div class="col-md-6 form-group">
                  <label class="text-black font-weight-bold" for="name">Name</label>
                  <input type="text" id="name" class="form-control ">
                </div>
                <div class="col-md-6 form-group">
                  <label class="text-black font-weight-bold" for="phone">Phone</label>
                  <input type="text" id="phone" class="form-control ">
                </div>
              </div>
              <br>
              <div class="col-md-6 text-right" data-aos="fade-up" data-aos-delay="200">
	            <button type="submit" class="btn">회원가입</button>
	          </div>
          
            </form>

          </div>
          <div class="col-md-5" data-aos="fade-up" data-aos-delay="200">
            <div class="row">
              <div class="col-md-10 ml-auto contact-info">
                <p><span class="d-block">Address:</span> <span> 446-77 울산광역시 남구 삼산로35번길 19 (신정동)</span></p>
                <p><span class="d-block">Phone:</span> <span> (+02) 052 - 000 - 0000</span></p>
                <p><span class="d-block">Email:</span> <span> ooooo@oooo.ooo</span></p>
              </div>
            </div>
            
          </div>
        </div>
      </div>
    </section>


<!-- end section -->

<%@ include file = "../casahotel/casahotel_footer.jsp" %>

<%@ include file = "../casahotel/casahotel_script.jsp" %>
<%@ include file = "../islagrande/islagrande_script.jsp" %>

<%@ include file = "../end.jsp"%> <!-- </body> -->