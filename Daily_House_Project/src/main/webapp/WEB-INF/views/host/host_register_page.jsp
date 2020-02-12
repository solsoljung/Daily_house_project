<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<%@ include file = "../../views/title.jsp"%> <!-- <head> -->

<%@ include file = "../../views/casahotel/casahotel_link.jsp" %>
<%@ include file = "../../views/islagrande/islagrande_link.jsp" %>

<%@ include file = "../../views/islagrande/islagrande_menubar.jsp" %> <!-- </head> <body> -->



<!-- host_register_page1 START -->
<br><br><br><br>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<h3>호스트 등록</h3>
			<h4 class="my-4 h4 secondary-heading">호스트 등록</h4>
			<form role="form">
				<div class="form-group">
					<label for="exampleInputEmail1">건물 유형을 선택하세요</label>
<!-- 					<input type="email" class="form-control" id="exampleInputEmail1" /> -->
					<select class="browser-default custom-select">
				        <option selected="">Open this select menu</option>
				        <option value="1">One</option>
				        <option value="2">Two</option>
				        <option value="3">Three</option>
				     </select>
					
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">최대 숙박 인원</label>
					default 4
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">침대</label>
					default 1
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">욕실 수</label>
					default 1
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">최대 숙박 인원</label>
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">숙소의 위치를 알려주세요</label>
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">어떤 편의시설을 제공하시나요?</label>
					편의시설 체크박스
				</div>
				
				
				<br>
				<button type="submit" class="btn btn-primary">Submit</button>
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<!-- host_register_page1 END -->

<%@ include file = "../../views/end.jsp"%> <!-- </body> -->