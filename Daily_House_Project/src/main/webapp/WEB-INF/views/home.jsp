<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 데이터피커X -->					
<%@ include file = "../views/title2.jsp"%> <!-- <head> -->					
					
<%@ include file = "../views/casahotel/casahotel_link2.jsp" %>					
<%@ include file = "../views/islagrande/islagrande_link.jsp" %>					
				
<%@ include file = "../views/islagrande/islagrande_menubar.jsp" %> <!-- </head> <body> -->					
<!-- 데이터피커X -->								


<!-- section -->

<%@ include file = "../views/casahotel/section/casahotel_Main_section.jsp" %>
<%@ include file = "../views/casahotel/section/casahotel_CheckAvailabilty_section.jsp" %>
<%@ include file = "../views/casahotel/section/casahotel_GreatOffers_section.jsp"%>

<section class="ftco-section testimony-section">
      <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section ftco-animate text-center">
          	<span class="subheading">Testimony</span>
            <p class="lead" style="font-size: 30px">최근 후기</p>
            <p>숙소에 직접 다녀간 게스트의 후기</p>
            
          </div>
        </div>
        <div class="row ftco-animate">
          <div class="col-md-12">
            <div class="carousel-testimony owl-carousel">
            <c:forEach items="${list}" var="HomeReviewDto">
              <div class="item">
                <div class="testimony-wrap p-4 pb-5 text-center">
                  <div class="user-img mb-5" style="background-image: url(/si/displayFile?fileName=/${HomeReviewDto.user_pic})">
                  
                    <span class="quote d-flex align-items-center justify-content-center">
                      <i class="icon-quote-left"></i>
                    </span>
                  </div>
                  <div class="text">
                    <p class="mb-5 pl-4 line">${HomeReviewDto.room_review_text}</p>
                    <p class="name">${HomeReviewDto.user_name}</p>
                    <br>
                    <span class="position">${HomeReviewDto.room_title}</span>
                  </div>
                </div>
              </div>
            </c:forEach>
            </div>
          </div>
        </div>
      </div>
    </section>

<!-- end section -->

<!-- 데이터피커X -->			
			
<%@ include file = "../views/casahotel/casahotel_footer.jsp" %>			
			
<%@ include file = "../views/casahotel/casahotel_script2.jsp" %>			
<%@ include file = "../views/islagrande/islagrande_script2.jsp" %>			
			
<%@ include file = "../views/end.jsp"%> <!-- </body> -->			
			
<!-- 데이터피커X -->