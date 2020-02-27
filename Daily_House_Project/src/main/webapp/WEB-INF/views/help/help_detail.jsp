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
	.lblTitle1{ font-size: 25px; font-weight: bold;}
	.lblTitle2{ font-size: 20px;}
	.lblTitle3{ font-size: 15px; font-weight: bold;}
	
	#fileDrop {
	width: 100%;
	height: 100px;
	border: 1px dashed #fb929e;
	background-color: #F2F2F2;
	margin: auto;
}
</style>

<script>
$(function(){
	
	// 현재 클릭된 메뉴를 활성화
	$(".nav-item:eq(0)").attr("class", "nav-item");
	$(".nav-item:eq(4)").attr("class", "nav-item active");

	// 글목록 버튼 클릭
	$("#btnList").click(function(){
		location.href = "/cy/help";
	});
	
	// 글 수정완료 버튼 숨기기
	$("#btnConfirm").hide();
	
	// 글 수정버튼 클릭
	$("#btnUpdate").click(function(){
		$(this).hide(); 							 // 수정 버튼 숨김
		$("#btnConfirm").show(); 					 // 완료 버튼 보이기
		$("#btnDelete").attr("disabled","disabled"); // 삭제 버튼 비활성화
		
		$("input[name=board_title]").prop("readonly", false);
		$("textarea[name=board_content]").prop("readonly", false);
		
		$(".notice").prop("disabled", false);
	});
	
	// 글 수정완료버튼 클릭
	$("#btnConfirm").click(function(e){
		e.preventDefault();
		
		if($("input[name=board_title]").val() == null || $("input[name=board_title]").val() == ""){
			alert("제목을 입력해주세요.");
			return;
		}
		if($("textarea[name=board_content]").val() == null || $("textarea[name=board_content]").val() == ""){
			alert("내용을 입력해주세요.");
			return;
		}
		
// 		console.log($("input[name=board_title]").val());
// 		console.log($("textarea[name=board_content]").val());
// 		console.log($("input[name=board_notice]").val());
		
		$("#board_form").attr("action", "/cy/helpUpdatePro");
		$("#board_form").submit();
	});
	
	// 글 삭제버튼 클릭
	$("#btnDelete").click(function(){
		var board_num = "${boardVo.board_num}";
		location.href = "/cy/helpDelete?board_num=" + board_num;
	});
	
	// select board_notice_check
	$("#board_notice_check").change(function() {
		$("input[name=board_notice]").val($(this).val());
		console.log($("input[name=board_notice]").val());
	});
	
});
</script>

<br><br><br><br>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8"><br><br>
<!-- 			<div style="font-size: 30px">도움말을 작성해보세요!</div><br><br> -->
	<!-- table START -->
	<div class="row" align="center"  style="height: 100%; width: 100%">
	<form method="post" id="board_form" style="height: 100%; width: 100%">
	<input type="hidden" name="board_num" value="${boardVo.board_num}"/>
	<input type="hidden" name="board_notice" value="${boardVo.board_notice}"/>
		<table class="table" id="tbl_board" style="height: 100%; width: 100%" >
			<tr>
				<th>* 제목</th>
				<td><input type="text" style="width:100%;" name="board_title" value="${boardVo.board_title}" readonly="readonly"/></td>
			</tr>
			<tr>
				<th>* 내용</th>
				<td><textarea rows="10" cols="50" name="board_content" style="width:100%;" maxlength="350"  readonly="readonly">
${boardVo.board_content}</textarea></td>
			</tr>
			
			<c:if test="${userVo.user_email eq 'admin@naver.com'}">
			<tr>
				<th>공지 여부</th>
				<td><select class="browser-default custom-select" id="board_notice_check">
					   <option value="" disabled="disabled">하나를 선택하세요. 선택하지 않을 경우 공지로 지정되지 않습니다.</option>
					   <option value="Y" class="notice" disabled="disabled"
					   		<c:if test="${boardVo.board_notice eq 'Y'}">selected</c:if>
					   >공지로 지정</option>
					   <option value="N" class="notice" disabled="disabled"
					    	<c:if test="${boardVo.board_notice eq 'N'}">selected</c:if>
					   >공지로 지정하지 않음</option>
				     </select></td>
			</tr>
			</c:if>
		</table>
	</form>
	</div>
	<!-- table END -->
	
	<!-- Button -->
	<br>
	<div class="row">
		<div class="col-md-2" align="left">
			<c:if test="${userVo.user_email eq 'admin@naver.com'}">
				<button type="button" class="btn btn-primary py-3 px-5" id="btnConfirm" style="font-size:15px;" >완료</button>
				<button type="button" class="btn btn-primary py-3 px-5" id="btnUpdate" style="font-size:15px;" >수정</button>
			</c:if>
		</div>
		<div class="col-md-2" align="left">
			<c:if test="${userVo.user_email eq 'admin@naver.com'}">
				<button type="button" class="btn btn-primary py-3 px-5" id="btnDelete" style="font-size:15px;" >삭제</button>
			</c:if>
		</div>
		<div class="col-md-2"></div>
		<div class="col-md-2"></div>
		<div class="col-md-2"></div>
		<div class="col-md-2" align="right">
			<button type="button" class="btn btn-primary py-3 px-5" id="btnList" style="font-size:15px;" >목록</button>
		</div>
	</div>
	
	
	</div>
			
	<div class="col-md-2"></div>
	</div>
</div><br><br><br>

<%@ include file = "../../views/casahotel/casahotel_script2.jsp" %>			
<%@ include file = "../../views/islagrande/islagrande_script2.jsp" %>	

<%@ include file = "../../views/end.jsp"%> <!-- </body> -->