<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file = "../../views/title2.jsp"%> <!-- <head> -->					
					
<%@ include file = "../../views/casahotel/casahotel_link2.jsp" %>					
<%@ include file = "../../views/islagrande/islagrande_link.jsp" %>					
					
<%@ include file = "../../views/islagrande/islagrande_menubar.jsp" %> <!-- </head> <body> -->

<!-- reservation page section -->
<script>
$(document).ready(function() {
	$(".card-link").click(function(e){
		var that = $(this).children("span");
		var message_num = $(this).attr("data-num");
		console.log(message_num);
		
		var url = "/sol/openDateUpdate/" + message_num;
		
		$.ajax({
			"type" : "put",
			"url" : url,
			"headers" : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "put"
			},
			"success" : function(rData) {
				console.log(rData);
				if(rData == "success"){
					console.log("성공입나더ㅏ");
					that.fadeOut('1000');
				}
			}
		}); // $.ajax()
	});
	
	$(".btnReply").click(function(){
		var sender = $(this).attr("data-sender");
		var receiver = $(this).attr("data-receiver");
		$("input[name=sender]").val(sender);
		$("input[name=receiver]").val(receiver);
		$("#frmReply").submit();
	});
});
</script>
<section class="site-hero inner-page overlay" style="background-image: url(/casahotel/img/slider-3.jpg)" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center text-center">
          <div class="col-md-10 text-center" data-aos="fade-up">
            <h1>
            	<span class="heading">
            		나의 메세지
            	</span>
            </h1>
            <h2>
            	<!-- <span style="font-size: 1em; color: white; font-family: 고딕;">
            		예약 및 결제내역
            	</span> -->
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
			<div class="col-md-2"></div><br><br>
		</div>
	</div>
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
${messageList}
<!-- 여기여기 -->
<c:if test="${empty messageList}">
<br>
<br>
<br>
<h4 align="center" style="font-family:Arial;">메세지가 없습니다.</h4>
<br>
<br>
<br>
</c:if>
<div class="container-fluid">
	<div class="row">
	<form id="frmReply" action="/sol/reply" method="post">
		<input type="hidden" name="receiver">
		<input type="hidden" name="sender">
	</form>
	<div class="col-md-2">
	</div>
		<div class="col-md-8">
			<div id="card-174818">
			<c:forEach items="${messageList}" var="vo">
				<div class="card">
					<div class="card-header">
						 <a class="card-link" data-toggle="collapse" data-parent="#card-174818" data-num="${vo.message_num}" href="#card-element-${vo.message_num}">
						 ${vo.sender} 님에게서 온 메세지 입니다.
						 
						 <c:if test="${empty vo.open_date}">
						 <span class="badge badge-info badge-pill" id="message" style="cursor:pointer">N</span>
						 </c:if>
						 </a>
					</div>
					<div id="card-element-${vo.message_num}" class="collapse">
						<div class="card-body">
							보낸 사람 : ${vo.sender}<br>
							내용&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: ${vo.message_text}<br>
							보낸 날짜 : ${vo.send_date}<br>
							읽은 날짜 : ${vo.open_date}<br>
					<input type="button" class="btn btn-primary btnReply" data-sender="${vo.sender}" data-receiver="${vo.receiver}" value="답장">
						</div>
					</div>
				</div>
			</c:forEach>
			</div>
		</div>
		<div class="col-md-2">
	</div>
	</div>
</div>
<!-- 여기여기 -->
</section>
<section>
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div><br><br>
		</div>
	</div>
</section>

<!-- end section -->

<%@ include file = "../../views/casahotel/casahotel_footer.jsp" %>				
				
<%@ include file = "../../views/casahotel/casahotel_script2.jsp" %>				
<%@ include file = "../../views/islagrande/islagrande_script2.jsp" %>				
				
<%@ include file = "../../views/end.jsp"%> <!-- </body> -->				