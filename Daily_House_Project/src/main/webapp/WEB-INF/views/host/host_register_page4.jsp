<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<%@ include file = "../../views/title.jsp"%> <!-- <head> -->

<%@ include file = "../../views/casahotel/casahotel_link.jsp" %>
<%@ include file = "../../views/islagrande/islagrande_link.jsp" %>

<%@ include file = "../../views/islagrande/islagrande_menubar.jsp" %> <!-- </head> <body> -->

<style>
	.lblTitle1{ font-size: 30px; font-weight: bold;}
	.lblTitle2{ font-size: 20px;}
	.lblTitle3{ font-size: 15px; font-weight: bold;}
</style>

<script>
$(function(){
	// 현재 클릭된 메뉴를 활성화
	$(".nav-item:eq(0)").attr("class", "nav-item");
	$(".nav-item:eq(5)").attr("class", "nav-item active");
	
	// host_register_page3으로 이동
	$("#btnPrev").click(function(e){
		e.preventDefault();
		$("#form").attr("action", "/cy/registerHost3Post");
		$("#form").submit();
// 		location.href = "/cy/registerHost3Post";
	});

	// room_location을 저장할 공간
	var room_location = "";
	var room_location_detail = "";
	
	// test Button
	$("#btnTest").click(function(){
		room_location = $("#roadAddrPart1").val();
		room_location_detail = $("#addrDetail").val();
		
		if(room_location == null || room_location == ""){
			alert("주소를 입력해주세요.");
			return;
		}
		
		console.log("room_location: " + room_location);
		console.log("room_location_detail: " + room_location_detail);
	});
});
</script>


<!-- 주소 api -->
<script language="javascript">
	function goPopup() {
		var pop = window.open("/popup/jusoPopup.jsp","pop","width=570, height=420, scrollbars=yes, resizable=yes");
	}
	function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr,jibunAddr,zipNo,admCd,
			rnMgtSn,bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,
			buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo) {
		
		document.form.roadFullAddr.value = roadFullAddr;
		document.form.roadAddrPart1.value = roadAddrPart1;
		document.form.roadAddrPart2.value = roadAddrPart2;
		document.form.addrDetail.value = addrDetail;
		document.form.zipNo.value = zipNo;
	}
</script>

<% 
	request.setCharacterEncoding("UTF-8");  //한글깨지면 주석제거
	//request.setCharacterEncoding("EUC-KR");  //해당시스템의 인코딩타입이 EUC-KR일경우에
	String inputYn = request.getParameter("inputYn"); 
	String roadFullAddr = request.getParameter("roadFullAddr"); 
%>
<!-- host_register_page1 START -->
<br><br><br><br>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<label class="lblTitle1">숙소의 위치를 알려주세요.</label><br>
			<div class="progress">
				<div class="progress-bar w-100"></div>
			</div><br>
			<label>4단계: 등록할 숙소의 상세 주소를 입력해주세요.</label><br><br>

				<!-- 위치등록 -->
				<form id="form" name="form" method="post">
				<input type="hidden" id="confmKey" name="confmKey" value=""/>
				<input type="hidden" id="returnUrl" name="returnUrl" value=""/>
				<input type="hidden" id="resultType" name="resultType" value=""/>
				<!-- 해당시스템의 인코딩타입이 EUC-KR일경우에만 추가 START-->
				<!-- <input type="hidden" id="encodingType" name="encodingType" value="EUC-KR"/> -->
				
				roomVo: ${roomVo}
				<input type="hidden" name="room_type_num" value="${roomVo.room_type_num}"/>
				<input type="hidden" name="room_people" value="${roomVo.room_people}"/>
				<input type="hidden" name="room_bed" value="${roomVo.room_bed}"/>
				<input type="hidden" name="room_bathroom" value="${roomVo.room_bathroom}"/>
				<input type="hidden" name="room_options" value="${roomVo.room_options}"/>
				<input type="hidden" name="room_title" value="${roomVo.room_title}"/>
				<input type="hidden" name="room_explain" value="${roomVo.room_explain}"/>
				<input type="hidden" name="room_price" value="${roomVo.room_price}"/>
				
				<div class="row">
					<div class="col-md-3">
						<button type="button" class="btn btn-primary btn-block" onClick="goPopup();">주소검색</button> 
					</div>
					<div class="col-md-3"></div>
					<div class="col-md-3"></div>
					<div class="col-md-3"></div>
				</div><br>
				
				<div class="row">
					<div class="col-md-2">
						<label class="lblTitle3">도로명 주소 전체</label>
					</div>
					<div class="col-md-10">
						<input type="text" id="roadFullAddr" name="roadFullAddr" style="width:100%;" placeholder="Enter Addr" required readonly/><br>
					</div></div>	
				<div class="row">
					<div class="col-md-2">
						<label class="lblTitle3">도로명 주소</label>
					</div>
					<div class="col-md-10">
						<input type="text" id="roadAddrPart1" name="roadAddrPart1" style="width:100%;" placeholder="Enter Addr" required readonly/><br>
					</div></div>
				<div class="row">
					<div class="col-md-2">
						<label class="lblTitle3">상세주소</label>
					</div>
					<div class="col-md-10">
						<input type="text" id="addrDetail" name="addrDetail" style="width:100%;" placeholder="Enter Addr" required readonly/><br>
					</div></div>
				<div class="row">
					<div class="col-md-2">
						<label class="lblTitle3">참고 주소</label>
					</div>
					<div class="col-md-10">
						<input type="text" id="roadAddrPart2" name="roadAddrPart2" style="width:100%;" placeholder="Enter Addr" required readonly/><br>
					</div></div>
				<div class="row">
					<div class="col-md-2">
						<label class="lblTitle3">우편 번호</label>
					</div>
					<div class="col-md-10">
						<input type="text" id="zipNo" name="zipNo" style="width:100%;" placeholder="Enter Addr" required readonly/>
					</div>
				</div><br>

				<!-- Button -->
				<br>
				<div class="row">
					<div class="col-md-3">
						<button type="button" class="btn btn-primary btn-block" id="btnPrev">Prev</button>
					</div>
					<div class="col-md-3"></div>
					<div class="col-md-3">
						<button type="button" class="btn btn-primary btn-block" id="btnTest" >TEST</button>
					</div>
					<div class="col-md-3" align="right">
						<button type="button" class="btn btn-primary btn-block" id="btnNext" >Complete</button>
					</div>
				</div>
				
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
</div><br><br><br>
<!-- host_register_page1 END -->

<%@ include file = "../../views/end.jsp"%> <!-- </body> -->