<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 데이터피커X -->					
<%@ include file = "../../views/title2.jsp"%> <!-- <head> -->					
					
<%@ include file = "../../views/casahotel/casahotel_link2.jsp" %>					
<%@ include file = "../../views/islagrande/islagrande_link.jsp" %>					
					
<%@ include file = "../../views/islagrande/islagrande_menubar.jsp" %> <!-- </head> <body> -->					
<!-- 데이터피커X -->					

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
	.lblTitle1{ font-size: 30px; font-weight: bold;}
	.lblTitle2{ font-size: 20px;}
	.lblTitle3{ font-size: 15px; font-weight: bold;}
	
	#fileDrop {
	width: 100%;
	height: 200px;
	border: 1px dashed #fb929e;
	background-color: #F2F2F2;
	margin: auto;
</style>

<script src="/js/myscript.js"></script>
<script>
$(function(){
	// 현재 클릭된 메뉴를 활성화
	$(".nav-item:eq(0)").attr("class", "nav-item");
	
	// 수정완료 버튼 숨기기
	$("#btnConplete").hide();
	
	// 수정하기
	$("#btnModify").click(function(){
		$(this).hide(600); 							  // 수정하기 버튼 숨기기
		$("#btnConplete").show(); 					  // 수정완료 버튼 보이기
		
		$(".room_admin").prop("disabled", false);
	});
	
	// select room_admin_check
	$("#room_admin_check").change(function() {
		$("input[name=room_admin_check]").val($(this).val());
		console.log($("input[name=room_admin_check]").val());
	});
	
	// 수정완료
	$("#btnConplete").click(function(e){
		e.preventDefault();
		
		$("#form").attr("action", "/cy/AdminRoomDetailUpdate"); 
		$("#form").submit();
	}); // btnConplete
	
	
	// 목륵으로 이동
	$("#btnList").click(function(e){
		e.preventDefault();
		
		var now_admin_check = "${roomDetailDto.room_admin_check}";
		if(now_admin_check == 'N'){
			location.href = "/cy/AdminRoomListN";
		}else if(now_admin_check == 'Y'){
			location.href = "/cy/AdminRoomListY";
		}
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
// 				el.find("span:first").text(file_name);
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
	
});
</script>

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
				<input type="hidden" name="room_num" value="${roomDetailDto.room_num}">
				<input type="hidden" name="room_admin_check" >
				
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
					
					<div class="form-group">
						<label for="newUploadedList" class="lblTitle2"></label>
						<div id="newUploadedList">
						
						</div>
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
					</div><br><br> 
				
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
				
				<!-- 관리자 승인여부	-->
				<div class="form-group">
					<label class="lblTitle2">* 관리자 승인여부</label>
					<select class="browser-default custom-select" id="room_admin_check">
					    <option value="Y" disabled="disabled" class="room_admin" 
					       <c:if test="${roomDetailDto.room_admin_check eq 'Y'}">selected</c:if>
					    >승인</option>
					    <option value="N" disabled="disabled" class="room_admin" 
					       <c:if test="${roomDetailDto.room_admin_check eq 'N'}">selected</c:if>
					    >미승인</option>
				     </select>
				</div><br><br>

				<!-- Button -->
				<br>
				<div class="row">
					<div class="col-md-8">
					</div>
					<div class="col-md-2" align="right">
						<button type="button" class="btn btn-primary btn-block py-3 px-4" style="font-size:15px; margin-top: 10px" id="btnConplete">완료</button>
						<button type="button" class="btn btn-primary btn-block py-3 px-4" style="font-size:15px;" id="btnModify">승인 수정</button>
					</div>
					<div class="col-md-2" align="right">
						<button type="button" class="btn btn-primary btn-block py-3 px-4"  
							style="font-size:15px; margin-top: 9px" id="btnList">목록</button>
					</div>
				</div>
				
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
</div><br><br><br>
<!-- host_register_page1 END -->

<%-- <%@ include file = "../../views/casahotel/casahotel_footer.jsp" %>			 --%>
			
<%@ include file = "../../views/casahotel/casahotel_script2.jsp" %>			
<%@ include file = "../../views/islagrande/islagrande_script2.jsp" %>	

<%@ include file = "../../views/end.jsp"%> <!-- </body> -->