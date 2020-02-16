<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 데이터피커X -->					
<%@ include file = "../../views/title2.jsp"%> <!-- <head> -->					
					
<%@ include file = "../../views/casahotel/casahotel_link2.jsp" %>					
<%@ include file = "../../views/islagrande/islagrande_link.jsp" %>					
					
<%@ include file = "../../views/islagrande/islagrande_menubar.jsp" %> <!-- </head> <body> -->					
<!-- 데이터피커X -->					

<style>
	.lblTitle1{ font-size: 30px; font-weight: bold;}
	.lblTitle2{ font-size: 20px;}
	.lblTitle3{ font-size: 15px; font-weight: bold;}
</style>

<script>
$(function(){
	// 현재 클릭된 메뉴를 활성화
	$(".nav-item:eq(0)").attr("class", "nav-item");
	$(".nav-item:eq(6)").attr("class", "nav-item active");
	
	// room_location을 저장할 공간
	var room_location = "";
	var room_location_detail = "";
	
	// host_register_page2으로 이동
	$("#btnNext").click(function(e){
		e.preventDefault();
		room_location = $("#roadAddrPart1").val();
		room_location_detail = $("#addrDetail").val();
		if(room_location == null || room_location == ""){
			alert("주소를 입력해주세요.");
			return;
		}
		
		$("input[name=room_location").val(room_location);
		$("input[name=room_location_detail]").val(room_location_detail);
		
		$("#form").attr("action", "/cy/registerHost2Post");
		$("#form").submit();
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

roomDetailDto: ${roomDetailDto}

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<label class="lblTitle1">숙소의 위치</label><br>
				<!-- 위치등록 -->
				<form id="form" name="form" method="post">
				<input type="hidden" id="confmKey" name="confmKey" value=""/>
				<input type="hidden" id="returnUrl" name="returnUrl" value=""/>
				<input type="hidden" id="resultType" name="resultType" value=""/>
				<!-- 해당시스템의 인코딩타입이 EUC-KR일경우에만 추가 START-->
				<!-- <input type="hidden" id="encodingType" name="encodingType" value="EUC-KR"/> -->
<%-- 				<input type="hidden" name="room_location" value="${roomVo.room_location}"/> --%>
<%-- 				<input type="hidden" name="room_location_detail"  value="${roomVo.room_location_detail}"/> --%>
				
				<div class="row">
					<div class="col-md-10">
						
					</div>
					<div class="col-md-2">
						<button type="button" class="btn btn-primary btn-block" onClick="goPopup();" style="font-size:15px;">주소검색</button>
					</div>
				</div><br>
				
				<div class="row">
					<div class="col-md-2">
						<label class="lblTitle3">도로명 주소 전체</label>
					</div>
					<div class="col-md-10">
						<input type="text" id="roadFullAddr" name="roadFullAddr" style="width:100%;" placeholder="Enter Addr" required readonly
						value="울산광역시 남구 삼산로 143번길 35, 1(달동)"
						/><br>
					</div></div>	
				<div class="row">
					<div class="col-md-2">
						<label class="lblTitle3">도로명 주소</label>
					</div>
					<div class="col-md-10">
						<input type="text" id="roadAddrPart1" name="roadAddrPart1" style="width:100%;" placeholder="Enter Addr" required readonly
						value="울산광역시 남구 삼산로 143번길 35"
						/><br>
					</div></div>
				<div class="row">
					<div class="col-md-2">
						<label class="lblTitle3">상세주소</label>
					</div>
					<div class="col-md-10">
						<input type="text" id="addrDetail" name="addrDetail" style="width:100%;" placeholder="Enter Addr" required readonly
						value="1"
						/><br>
					</div></div>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-10">
						<input type="hidden" id="roadAddrPart2" name="roadAddrPart2" style="width:100%;" placeholder="Enter Addr" required readonly/><br>
					</div></div>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-10">
						<input type="hidden" id="zipNo" name="zipNo" style="width:100%;" placeholder="Enter Addr" required readonly/>
					</div>
				</div><br>
				<!-- 위치등록 -->
				
				<!-- 사진 및 소개 등록 -->
				<div class="form-group">
					<label class="lblTitle1">숙소 이름</label>
					<input type="text" class="form-control" name="room_title"
						<c:if test="${not empty roomDetailDto.room_title}">value="${roomDetailDto.room_title}"</c:if>					
					/><br><br>
					
					<label class="lblTitle1">숙소 소개</label>
					<textarea rows="10" cols="50" name="room_explain" style="width:100%;" maxlength="350"><c:if test="${not empty roomDetailDto.room_explain}">
${roomDetailDto.room_explain}</c:if></textarea><br><br>
					
					<label class="lblTitle1">가격</label>
					<div class="row">
						<div class="col-md-3">
							<input type="text" class="form-control" name="room_price"
								<c:if test="${roomDetailDto.room_price != 0}">value="${roomDetailDto.room_price}"</c:if>				
							/>
						</div>
						<div class="col-md-3"></div>
						<div class="col-md-3"></div>
						<div class="col-md-3"></div>
						</div>
					<br><br>
					
					<!-- 파일 첨부 -->
					<div class="form-group">
						<label for="fileDrop" class="lblTitle1">첨부 파일</label>
						<div id="fileDrop"></div>
					</div>
					
					<!-- 썸네일 이미지 -->
					<div class="form-group" id="uploadedList">
					
					</div>
					
				</div><br><br>
				
				
				<!-- 건물 유형 -->
				<div class="form-group">
					<label class="lblTitle2">건물 유형을 선택하세요</label>
<!-- 					<select class="browser-default custom-select" id="room_type_num"> -->
<!-- 				        <option selected="">하나를 선택해주세요.</option> -->
<%-- 				        <c:forEach items="${roomTypeList}" var="roomTypeVo"> --%>
<%-- 					        <option value="${roomTypeVo.room_type_num}" --%>
<%-- 					        	<c:if test="${roomDetailDto.room_type_num eq roomTypeVo.room_type_num}">selected</c:if> --%>
<%-- 					        >${roomTypeVo.room_type_explain}</option> --%>
<%-- 				        </c:forEach> --%>
				       
<!-- 				     </select> -->
				</div><br><br><br>
				
				<!-- 인원수 -->
				<div class="form-group">
					<label class="lblTitle2">숙소에 얼마나 많은 인원이 숙박할 수 있나요?</label>
					<br>
					
					<div class="row">
						<div class="col-md-3">
							<label class="lblTitle3">최대 숙박 인원</label>
						</div>
						<div class="col-md-3">
							<button type="button" class="minus" style="border: none; background: none;">-</button>
							
							<input type="number" class="numBox" min="1" max="20" value="4" 
							readonly="readonly" id="room_people"/>
									
							<button type="button" class="plus" style="border: none; background: none;">+</button>
						</div>
						<div class="col-md-3"></div>
						<div class="col-md-3"></div>
					</div>
				</div><br><br><br>
				
				<!-- 침대수 -->
				<div class="form-group">
					<label class="lblTitle2">게스트가 사용할 수 있는 침대는 몇 개인가요?</label>
					<br>
					
					<div class="row">
						<div class="col-md-3">
							<label class="lblTitle3">침대</label>
						</div>
						<div class="col-md-3">
							<button type="button" class="minus" style="border: none; background: none;">-</button>
							
							<input type="number" class="numBox" min="1" max="20" value="1"
							readonly="readonly" id="room_bed"/>
									
							<button type="button" class="plus" style="border: none; background: none;">+</button>
						</div>
						<div class="col-md-3"></div>
						<div class="col-md-3"></div>
					</div>
				</div><br><br><br>
				
				<!-- 욕실수 -->
				<div class="form-group">
					<label class="lblTitle2">욕실 수를 선택해주세요.</label>
					<br>
					
					<div class="row">
						<div class="col-md-3">
							<label class="lblTitle3">욕실</label>
						</div>
						<div class="col-md-3">
							<button type="button" class="minus" style="border: none; background: none;">-</button>
								
							<input type="number" class="numBox" min="1" max="20" value="1"
							readonly="readonly" id="room_bathroom"/>
							
							<button type="button" class="plus" style="border: none; background: none;">+</button>
						</div>
						<div class="col-md-3"></div>
						<div class="col-md-3"></div>
					</div>
				</div><br><br>



				<!-- Button -->
				<br>
				<div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-3"></div>
					<div class="col-md-3" align="right">
						<button type="button" class="btn btn-primary btn-block py-3 px-3" id="btnUpdate" style="font-size:20px;" >수정</button>
					</div>
					<div class="col-md-3" align="right">
						<button type="button" class="btn btn-primary btn-block py-3 px-3" id="btnDelete" style="font-size:20px;" >삭제</button>
					</div>
				</div>
				
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
</div><br><br><br>
<!-- host_register_page1 END -->

<%@ include file = "../../views/end.jsp"%> <!-- </body> -->