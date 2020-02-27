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
	
	// 글작성 버튼 클릭
	$("#btnWrite").click(function(){
		
	});
	
});
</script>

<br><br><br><br>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8"><br><br>
			<div class="row">
				<div class="col-md-8">
					<label class="lblTitle2 title">데일리하우스 도움말 센터에 오신 것을 환영합니다.</label>
				</div>
				<div class="col-md-4" align="right">
					<c:if test="${userVo.user_email eq 'admin@naver.com'}">
						<button type="button" class="btn btn-primary" id="btnWrite" style="font-size:15px;" >글쓰기</button>
					</c:if>
				</div>
			</div><br><br>
			
	<!-- table START -->
	<div class="row" align="center">
		<table class="table" id="tbl_board">
			<thead align="center">
				<tr align="center">
					<th> </th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
				
			<tbody align="center">
				<c:forEach items="${list}" var="BoardVo">
				<tr align="center">
					<c:choose>
						<c:when test="${BoardVo.board_notice eq 'Y'}">
							<td>공지</td>
						</c:when>
						<c:otherwise>
							<td>${BoardVo.board_num}</td>
						</c:otherwise>
					</c:choose>
					<td><a href="#" class="board_title_a" data-board-num="${BoardVo.board_num}">${BoardVo.board_title}</a></td>
					<td>${BoardVo.user_name}(${BoardVo.user_email})</td>
					<td>${BoardVo.board_reg_date}</td>
					<td>${BoardVo.board_read_count}</td>
				</tr>
				</c:forEach>
			</tbody>	
		</table>
	</div>
	<!-- table END -->
	</div>
			
	<div class="col-md-2"></div>
	</div>
</div><br><br><br>

<%@ include file = "../../views/casahotel/casahotel_script2.jsp" %>			
<%@ include file = "../../views/islagrande/islagrande_script2.jsp" %>	

<%@ include file = "../../views/end.jsp"%> <!-- </body> -->