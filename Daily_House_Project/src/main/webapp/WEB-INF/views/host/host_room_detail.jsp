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
	
	#fileDrop {
	width: 100%;
	height: 100px;
	border: 1px dashed #fb929e;
	background-color: #F2F2F2;
	margin: auto;
</style>

<script src="/js/myscript.js"></script>
<script>
$(function(){
	// 현재 클릭된 메뉴를 활성화
	$(".nav-item:eq(0)").attr("class", "nav-item");
	$(".nav-item:eq(6)").attr("class", "nav-item active");
	
	// 수정완료 버튼 숨기기
	$("#btnConplete").hide();
	$("#btnAddress").hide();
	$(".addFile").hide();
	
	// room_location을 저장할 공간
	var room_location_full = "${roomDetailDto.room_location}" + " " + "${roomDetailDto.room_location_detail}";
	$("#roadFullAddr").val(room_location_full);
	
	// input[name]의 값을 체크하기 위한 변수들
	var room_location = "";
	var room_location_detail = "";
	
	var room_type_num = "";
	
	var script_data_options = [];
	
	// room_option_code
	var room_option_code = "${roomDetailDto.room_option_code}";
	
	split();
	function split() {			
		var res = room_option_code.split(",");	
// 		console.log("==============================res==============================");
// 		console.log(res);
		
		var data_options = [];
		$(".chb").each(function(){
			data_options.push($(this).attr("data-option"));
		});
// 		console.log("==========================data_options==========================");
// 		console.log(data_options);
		
		for(var i=0; i<res.length; i++){
// 			console.log("i"+i+ ": " + res[i]);
			for(var v=0; v<data_options.length; v++){
// 				console.log("v"+v+ ": " + data_options[v]);
				if(res[i] == data_options[v]){
					$(".chb").eq(v).prop("checked", true);
				}
			}
		}
	};	//function split()	
	
	
	// 수정하기
	$("#btnModify").click(function(){
		$("#btnAddress").show(600); // 주소검색 버튼 보이기
		$(this).hide(600); 			// 수정하기 버튼 숨기기
		$("#btnConplete").show(); 	// 수정완료 버튼 보이기
		
		$("input[name=room_title]").prop("readonly", false);
		$("textarea[name=room_explain]").prop("readonly", false);
		$("input[name=room_price]").prop("readonly", false);
		
		$(".romm_type_nums").prop("disabled", false);
		$(".plus").prop("disabled", false);
		$(".minus").prop("disabled", false);
		
		$(".chb").prop("disabled", false);		
		
		$(".room_states").prop("disabled", false);
		
		$(".pull").fadeIn(1000);    // 첨부파일 삭제링크(x) 나타내기
		$(".addFile").fadeIn(1000); // 파일첨부 나타내기
	});
	
	// select room_type_num
	$("#room_type_num").change(function() {
		$("input[name=room_type_num]").val($(this).val());
// 		console.log($("input[name=room_type_num]").val());
	});
	
	// select room_status
	$("#room_status").change(function() {
		$("input[name=room_status]").val($(this).val());
// 		console.log($("input[name=room_status]").val());
	});
	
	// 수정완료
	$("#btnConplete").click(function(e){
		e.preventDefault();
		room_location = $("#roadAddrPart1").val();
		room_location_detail = $("#addrDetail").val();
		if(room_location == null || room_location == ""){
			alert("주소를 입력해주세요.");
			return;
		}
		
		if($("input[name=room_title]").val() == null || $("input[name=room_title]").val() == ""){
			alert("숙소이름을 입력해주세요.");
			return;
		}
		if($("textarea[name=room_explain]").val() == null || $("textarea[name=room_explain]").val() == ""){
			alert("숙소이름을 입력해주세요.");
			return;
		}
		if($("input[name=room_price]").val() == null || $("input[name=room_price]").val() == ""){
			alert("숙소이름을 입력해주세요.");
			return;
		}
		
		$(".chb:checked").each(function() { 
			script_data_options.push($(this).attr("data-option"));
	    });
// 		console.log("script_data_options: " + script_data_options);
		$("input[name=room_option_code]").val(script_data_options);
		
		$("input[name=room_location]").val(room_location);
		$("input[name=room_location_detail]").val(room_location_detail);
		
		$("input[name=room_people]").val($("#room_people").val());
		$("input[name=room_bed]").val($("#room_bed").val());
		$("input[name=room_bathroom]").val($("#room_bathroom").val());
		
// 		console.log("room_location: " + $("input[name=room_location]").val());
// 		console.log("room_location_detail: " + $("input[name=room_location_detail]").val());
		
// 		console.log("room_title: " + $("input[name=room_title]").val());	
// 		console.log("room_explain: " + $("textarea[name=room_explain]").val());	
// 		console.log("room_price: " + $("input[name=room_price]").val());	
		
// 		console.log("room_option_code: " + $("input[name=room_option_code]").val());
		
// 		console.log("room_type_num: " + $("input[name=room_type_num]").val());
// 		console.log("room_people: " + $("input[name=room_people]").val());	
// 		console.log("room_bed: " + $("input[name=room_bed]").val());	
// 		console.log("room_bathroom: " + $("input[name=room_bathroom]").val());	
		
// 		console.log("room_status: " + $("input[name=room_status]").val());	
		
		$("#form").attr("action", "/cy/HostModifyRoom"); 
		$("#form").submit();
	}); // btnConplete
	
	
	$("#btnDelete").click(function(e){
		e.preventDefault();
		var status = "${roomDetailDto.room_status}";
		if(status == "Y"){
			alert("숙소 공개여부가 공개일 경우 삭제할 수 없습니다.");
			return;
		}
		
		// 예약이 있는지 없는지 알아낸 후 없다면 삭제
		var room_num = "${roomDetailDto.room_num}";
		var url = "/cy/isReserved/" + room_num;
		$.ajax({
			"type" : "post",
			"url" : url,
			"headers" : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "post"
			},
			"success" : function(rData) {
				console.log("rData: " + rData);
				if(rData > 0){
					alert("현재 예약된 숙소는 삭제할 수 없습니다.");
				}else{
					location.href = "/cy/deleteRoom?room_num=" + room_num;
				}
			}
		}); // $.ajax()
	});
	
	var listNum = "";
	
	
	// 첨부파일 START ===================================================================================
	getAttachList();
	
	// 사진파일 가져오기
	function getAttachList() {
		var url = "/cy/getAttach/${roomDetailDto.room_num}";
		$.getJSON(url, function(list) {
			
			listNum = list.length;
			console.log("listNum: " + listNum);
			
			if(list.length == null || list.length < 1){
				$("#lblUploadList").text("* 첨부파일이 없습니다.");
				return;
			}
			
			console.log("file list:", list);
			$(list).each(function() {
				var full_name = this;
				var underScoreIndex = full_name.indexOf("_");
				var file_name = full_name.substring(underScoreIndex + 1);
				var el = $("#attach_template").clone();
				el.removeAttr("id");
				el.find("span:first").text(file_name);
				var imgEl = el.find("img");
				if (checkImage(file_name) == true) {
					var thumbnailName = getThumbnailName(full_name); // myscript.js
					imgEl.attr("src", "/upload/displayFile?fileName=" + thumbnailName);
				} else {
					imgEl.attr("src", "/resources/images/file_image.png");
				}
				
				el.attr("data-filename", full_name);
				el.find("a").attr("href", full_name);
				
				el.css("display", "block");
				$("#uploadedList").append(el);
			});
		});
	} // function getAttachList()
	
	// 첨부 파일과 데이터 삭제 링크
	$("#uploadedList").on("click", ".attach-del", function(e) {
		e.preventDefault();
		var that = $(this);
		var fullName = that.attr("href");
		console.log("fullName:" + fullName);
		var url = "/upload/deleteFileAndData";
		var sendData = {"fileName" : fullName};
		$.get(url, sendData, function(rData) {
			console.log(rData);
			if (rData == "success") {
				that.parent().remove();
			}
		});
	});
	// 첨부파일 END ====================================================================================
	
	// room_price는 숫자만 입력할 수 있도록 설정
	$("input[name=room_price]").on("keyup", function() {
	    $(this).val($(this).val().replace(/[^0-9]/g,""));
	});
	
	// 수량 버튼 SRATR
	// .plus
	$(".plus").on("click", function(e){
		var num = $(this).parent().find(".numBox").val();
		var plusNum = Number(num) + 1;
		var max = 50;
		
		var target = $(this).parent().find(".numBox");
		if(plusNum > max) {
			target.val(num);
		} else {
		    target.val(plusNum);          
		}
	});
	
	// .minus
	$(".minus").on("click", function(e){
		var num = $(this).parent().find(".numBox").val();
		var minusNum = Number(num) - 1;
		   
		var target = $(this).parent().find(".numBox");
		if(minusNum <= 0) {
			target.val(num);
		} else {
			target.val(minusNum);          
		}
	});
	// 수량 버튼 END

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

<%-- roomDetailDto: ${roomDetailDto} --%>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<br><br>
			<label class="lblTitle2">* 숙소의 위치</label><br>
				<!-- 위치등록 -->
				<form id="form" name="form" method="post">
				<input type="hidden" id="confmKey" name="confmKey" value=""/>
				<input type="hidden" id="returnUrl" name="returnUrl" value=""/>
				<input type="hidden" id="resultType" name="resultType" value=""/>
				<!-- 해당시스템의 인코딩타입이 EUC-KR일경우에만 추가 START-->
				<!-- <input type="hidden" id="encodingType" name="encodingType" value="EUC-KR"/> -->
				
				<input type="hidden" name="room_num" value="${roomDetailDto.room_num}"/>
				
				<input type="hidden" name="room_location" value="${roomDetailDto.room_location}"/>
				<input type="hidden" name="room_location_detail"  value="${roomDetailDto.room_location_detail}"/>
				
				<input type="hidden" name="room_type_num" value="${roomDetailDto.room_type_num}"/>
				<input type="hidden" name="room_people" value="${roomDetailDto.room_people}"/>
				<input type="hidden" name="room_bed" value="${roomDetailDto.room_bed}"/>
				<input type="hidden" name="room_bathroom" value="${roomDetailDto.room_bathroom}"/>
				
				<input type="hidden" name="room_option_code" value="${roomDetailDto.room_option_code}"/>
				
				<input type="hidden" name="room_status" value="${roomDetailDto.room_status}"/>
				
				<input type="hidden" name="pics" value="${roomDetailDto.pics}"/>
				
				<div class="row">
					<div class="col-md-10"></div>
					<div class="col-md-2">
						<button type="button" class="btn btn-primary btn-block" onClick="goPopup();" 
						style="font-size:15px;" id="btnAddress">주소검색</button>
					</div>
				</div><br>
				
				<div class="row">
					<div class="col-md-2">
						<label class="lblTitle3">도로명 주소 전체</label>
					</div>
					<div class="col-md-10">
						<input type="text" id="roadFullAddr" name="roadFullAddr" style="width:100%;" placeholder="Enter Addr" required readonly
						value=""
						/><br>
					</div></div>	
				<div class="row">
					<div class="col-md-2">
						<label class="lblTitle3">도로명 주소</label>
					</div>
					<div class="col-md-10">
						<input type="text" id="roadAddrPart1" name="roadAddrPart1" style="width:100%;" placeholder="Enter Addr" required readonly
						value="${roomDetailDto.room_location}"
						/><br>
					</div></div>
				<div class="row">
					<div class="col-md-2">
						<label class="lblTitle3">상세주소</label>
					</div>
					<div class="col-md-10">
						<input type="text" id="addrDetail" name="addrDetail" style="width:100%;" placeholder="Enter Addr" required readonly
						value="${roomDetailDto.room_location_detail}"
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
					<label class="lblTitle2">* 숙소 이름</label>
					<input type="text" class="form-control" name="room_title" readonly="readonly"
						value="${roomDetailDto.room_title}"			
					/><br><br>
					
					<label class="lblTitle2">* 숙소 소개</label>
					<textarea rows="10" cols="50" name="room_explain" style="width:100%;" maxlength="350" readonly="readonly">
${roomDetailDto.room_explain}</textarea><br><br>
					
					<label class="lblTitle2">* 가격</label>
					<div class="row">
						<div class="col-md-3">
							<input type="text" class="form-control" name="room_price" readonly="readonly"
								value="${roomDetailDto.room_price}"			
							/>
						</div>
						<div class="col-md-3"></div>
						<div class="col-md-3"></div>
						<div class="col-md-3"></div>
						</div>
					<br><br>
					
					<!-- 첨부 파일 목록 템플릿 : clone해서 사용 -->
					
					<div id="attach_template" style="display:none;" data-filename="">
						<img class="img-thumbnail"><br>
						<span></span>
						<a href="#" class="attach-del">
						<span class="pull" style="display:none;">x</span></a>
					</div>
					
					<div class="form-group">
						<label for="uploadedList" class="lblTitle2" id="lblUploadList">* 첨부파일</label>
						<div id="uploadedList">
						
						</div>
					</div>
					
					
					<!-- 파일 첨부 -->
					<div class="form-group">
						<label for="fileDrop" class="lblTitle2 addFile">첨부할 파일을 드래그, 드롭하세요</label>
						<div id="fileDrop" class="addFile"></div>
					</div>
					
					<!-- 썸네일 이미지 -->
					<div class="form-group addFile" id="uploadedList" style="display: inline;" >
					
					</div>
					
					
					</div><br><br>
				
				<!-- 건물 유형 -->
				<div class="form-group">
					<label class="lblTitle2">* 건물 유형</label>
					<select class="browser-default custom-select" id="room_type_num">
				        <option selected="" disabled="disabled" >하나를 선택해주세요.</option>
				        <c:forEach items="${roomTypeList}" var="roomTypeVo">
					        <option value="${roomTypeVo.room_type_num}" disabled="disabled" class="romm_type_nums" 
					        	<c:if test="${roomTypeVo.room_type_num eq roomDetailDto.room_type_num}">selected</c:if>
					        >${roomTypeVo.room_type_explain}</option>
				        </c:forEach>
				     </select>
				</div><br><br><br>
				
				<!-- 인원수 -->
				<div class="form-group">
					<div class="row">
						<div class="col-md-3">
							<label class="lblTitle2">* 최대 숙박 인원</label>
						</div>
						<div class="col-md-3">
							<button type="button" class="minus" style="border: none; background: none;" disabled="disabled" >-</button>
							
							<input type="number" class="numBox" min="1" max="20" value="${roomDetailDto.room_people}" 
							readonly="readonly" id="room_people"/>
									
							<button type="button" class="plus" style="border: none; background: none;" disabled="disabled" >+</button>
						</div>
						<div class="col-md-3"></div>
						<div class="col-md-3"></div>
					</div>
				</div><br>
				
				<!-- 침대수 -->
				<div class="form-group">
					<div class="row">
						<div class="col-md-3">
							<label class="lblTitle2">* 침대</label>
						</div>
						<div class="col-md-3">
							<button type="button" class="minus" style="border: none; background: none;" disabled="disabled"  >-</button>
							
							<input type="number" class="numBox" min="1" max="20" value="${roomDetailDto.room_bed}"
							readonly="readonly" id="room_bed"/>
									
							<button type="button" class="plus" style="border: none; background: none;" disabled="disabled" >+</button>
						</div>
						<div class="col-md-3"></div>
						<div class="col-md-3"></div>
					</div>
				</div><br>
				
				<!-- 욕실수 -->
				<div class="form-group">
					<div class="row">
						<div class="col-md-3">
							<label class="lblTitle2">* 욕실</label>
						</div>
						<div class="col-md-3">
							<button type="button" class="minus" style="border: none; background: none;" disabled="disabled" >-</button>
								
							<input type="number" class="numBox" min="1" max="20" value="${roomDetailDto.room_bathroom}"
							readonly="readonly" id="room_bathroom"/>
							
							<button type="button" class="plus" style="border: none; background: none;" disabled="disabled" >+</button>
						</div>
						<div class="col-md-3"></div>
						<div class="col-md-3"></div>
					</div>
				</div><br>

				<!-- roomOptionList -->
				<label class="lblTitle2">* 편의시설</label>
					<div class="checkbox"  >
					<c:forEach items="${roomOptionList}" var="roomOptionVo">
						<label class="lblTitle2" ><input type="checkbox" class="chb" disabled="disabled" 
						data-option="${roomOptionVo.room_option_code}"/> ${roomOptionVo.room_option_explain}</label><br>
					</c:forEach>
					</div><br> 
				
				<!-- 숙소 공개, 비공개 여부	-->
				<div class="form-group">
					<label class="lblTitle2">* 숙소 공개여부</label>
					<select class="browser-default custom-select" id="room_status">
				        <option selected="" disabled="disabled" >하나를 선택해주세요.</option>
					        <option value="Y" disabled="disabled" class="room_states" 
					        	<c:if test="${roomDetailDto.room_status eq 'Y'}">selected</c:if>
					        >공개</option>
					        <option value="N" disabled="disabled" class="room_states" 
					        	<c:if test="${roomDetailDto.room_status eq 'N'}">selected</c:if>
					        >비공개</option>
				     </select>
				</div><br><br>

				<!-- Button -->
				<br>
				<div class="row">
					<div class="col-md-8">
					</div>
					<div class="col-md-2" align="right">
						<button type="button" class="btn btn-primary btn-block py-3 px-4" style="font-size:15px; margin-top: 10px" id="btnConplete">완료</button>
						<button type="button" class="btn btn-primary btn-block py-3 px-4" style="font-size:15px;" id="btnModify">수정</button>
					</div>
					<div class="col-md-2" align="right">
						<button type="button" class="btn btn-primary btn-block py-3 px-4"  
							style="font-size:15px; margin-top: 9px" id="btnDelete">삭제</button>
					</div>
				</div>
				
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
</div><br><br><br>
<!-- host_register_page1 END -->

<%@ include file = "../../views/end.jsp"%> <!-- </body> -->