<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file = "../../views/title.jsp"%> <!-- <head> -->

<%@ include file = "../../views/casahotel/casahotel_link.jsp" %>
<%@ include file = "../../views/islagrande/islagrande_link.jsp" %>

<%@ include file = "../../views/islagrande/islagrande_menubar.jsp" %> <!-- </head> <body> -->


<!-- section -->
<section class="section contact-section" id="next">
     <div class="container">
       <div class="row">
         <div class="col-md-7" data-aos="fade-up" data-aos-delay="100">
           <form action="/si/register_succes" method="post" class="bg-white p-md-5 p-4 mb-5 border">
               <div class="col-md-6 form-group">
                 <label class="text-black font-weight-bold">${userVo.user_name}님 Daily house 가입을</label>
                 <label class="text-black font-weight-bold">환 영 합 니 다.</label>
               </div>
              <br>
              <div class="col-md-6 text-right" data-aos="fade-up" data-aos-delay="200">
	            <button type="submit" class="btn">확인</button>
	          </div>
           </form>
         </div>
       </div>
     </div>
</section>

<!-- end section -->

<%@ include file = "../../views/casahotel/casahotel_footer.jsp" %>

<%@ include file = "../../views/casahotel/casahotel_script.jsp" %>
<%@ include file = "../../views/islagrande/islagrande_script.jsp" %>

<%@ include file = "../../views/end.jsp"%> <!-- </body> -->
