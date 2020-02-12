<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ include file = "../views/title.jsp"%> <!-- <head> -->

<%@ include file = "../views/casahotel/casahotel_link.jsp" %>
<%@ include file = "../views/islagrande/islagrande_link.jsp" %>

<%@ include file = "../views/islagrande/islagrande_menubar.jsp" %> <!-- </head> <body> -->

<!-- section --> 
<section class="home-slider js-fullheight owl-carousel">
      <div class="slider-item js-fullheight" style="background-image:url(images/bg_3.jpg);">
      	<div class="overlay"></div>
        <div class="container">
          <div class="row slider-text justify-content-center align-items-center">

            <div class="col-md-7 col-sm-12 text-center ftco-animate">
            	<h1 class="mb-3 mt-2 bread">Blog</h1>
	            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Blog</span></p>
            </div>

          </div>
        </div>
      </div>
    </section>
    
    

<!-- end section -->

<%@ include file = "../views/casahotel/casahotel_footer.jsp" %>

<%@ include file = "../views/casahotel/casahotel_script.jsp" %>
<%@ include file = "../views/islagrande/islagrande_script.jsp" %>

<%@ include file = "../views/end.jsp"%> <!-- </body> -->