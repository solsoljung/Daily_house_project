<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 데이터피커X -->					
<%@ include file = "../../views/title2.jsp"%> <!-- <head> -->					
					
<%@ include file = "../../views/casahotel/casahotel_link2.jsp" %>					
<%@ include file = "../../views/islagrande/islagrande_link.jsp" %>

<%@ include file = "../../views/islagrande/islagrande_menubar.jsp" %> <!-- </head> <body> -->					
<!-- 데이터피커X -->
<!-- start section -->
<br><br><br><br>
<section class="section contact-section" id="next">
  <div class="container">
    <div class="row">
      <div class="col-md-7" data-aos="fade-up" data-aos-delay="100">
      
        <form action="/sol/sendReply" method="post" class="bg-white p-md-5 p-4 mb-5 border">
          <div class="row">
            <div class="col-md-12 form-group">
              <label for="email">받는 사람</label>
              <input type="email" id="receiver" value="${messageVo.receiver}" name="receiver" class="form-control" readonly="readonly">
            </div>
          </div>
          <div class="row">
            <div class="col-md-12 form-group">
              <label for="email">보내는 사람</label>
              <input type="email" id="sender" name="sender" value="${messageVo.sender}" class="form-control" readonly="readonly">
            </div>
          </div>
          <div class="row">
            <div class="col-md-12 form-group">
              <label for="message">Write Message</label>
              <textarea id="message_text" name="message_text" class="form-control " cols="30" rows="8"></textarea>
            </div>
          </div>
          <div class="row">
            <div class="col-md-6 form-group">
              <input type="submit" value="Send Message" class="btn btn-primary">
            </div>
          </div>
        </form>
      </div>
      <div class="col-md-5" data-aos="fade-up" data-aos-delay="200">
        <div class="row">
          <div class="col-md-10 ml-auto contact-info">
          	<p><span>메세지 보내기</span></p>
          	<p>
          		<span>
          			<c:choose>
   						<c:when test="${receiverInfo.user_pic == null}">
   							<img src="/images/profile/user.jpg" height="100">
   						</c:when>
   						<c:otherwise>
               				<img src="/si/displayFile?fileName=/${receiverInfo.user_pic}" height="100">  
   						</c:otherwise>
   					</c:choose>
          		</span>
          	</p>
            <p><span class="d-block">이름:</span> <span> ${receiverInfo.user_name}</span></p>
            <p><span class="d-block">문의 전화:</span> <span> ${receiverInfo.user_phone }</span></p>
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