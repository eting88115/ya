<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<html>
<head><title>µn¥X</title></head>
<body>
<%
if(session.getAttribute("accessId") !=null){
	session.removeAttribute("accessId");
	response.sendRedirect("index.jsp");
}else{
	response.sendRedirect("logina.jsp");
}
%>	
</body>
</html>