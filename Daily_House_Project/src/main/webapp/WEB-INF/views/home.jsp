<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<%@ include file = "../views/title.jsp"%> <!-- <head> -->

<%@ include file = "../views/casahotel/casahotel_link.jsp" %>
<%@ include file = "../views/islagrande/islagrande_link.jsp" %>

<%@ include file = "../views/islagrande/islagrande_menubar.jsp" %> <!-- </head> <body> -->

<!-- section -->   
<%@ include file = "../views/casahotel/section/casahotel_Main_section.jsp" %>
<%@ include file = "../views/casahotel/section/casahotel_CheckAvailabilty_section.jsp" %>
<%@ include file = "../views/casahotel/section/casahotel_GreatOffers_section.jsp"%>

<%@ include file = "../views/islagrande/section/islagrande_OurSatisfiedCustomerSays_section.jsp" %>


<!-- end section -->

<%@ include file = "../views/casahotel/casahotel_footer.jsp" %>

<%@ include file = "../views/casahotel/casahotel_script.jsp" %>
<%@ include file = "../views/islagrande/islagrande_script.jsp" %>

<%@ include file = "../views/end.jsp"%> <!-- </body> -->