<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*,java.util.*"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<jsp:useBean id='objDBConfig' scope='application' class='hitstd.group.tool.database.DBConfig' />
<%@include file = "menu.jsp" %>


<!DOCTYPE html>
<html>
<head>
  <meta charset="BIG5">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>LeeLab Web</title>
  <link href="//fonts.googleapis.com/css2?family=Merriweather:wght@300;400;700;900&amp;display=swap" rel="stylesheet">
  <link href="//fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900&amp;display=swap" rel="stylesheet">
  <!-- Template CSS -->
  <link rel="stylesheet" href="assets/css/style-starter.css">
  <meta name="keywords" content="leelab">
  <meta name="description" content="This is for example.">
</head>
<body>


<%
	Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
	Connection con=DriverManager.getConnection("jdbc:ucanaccess://"+objDBConfig.FilePath()+";");
	Statement smt= con.createStatement();
	String sk1 = new String(request.getParameter("skill1").getBytes("ISO-8859-1"));
	String sk2 = new String(request.getParameter("skill2").getBytes("ISO-8859-1"));
	String sk3 = new String(request.getParameter("skill3").getBytes("ISO-8859-1"));
	smt.executeUpdate("UPDATE leelab SET skill1 ='" + sk1+"', skill2 ='" + sk2+"', skill3 ='" + sk3 +"' WHERE memberId ='" + request.getParameter("memberId")+"' ");
	response.sendRedirect("member.jsp?memberId="+request.getParameter("memberId")+"");
%>


  </body>
</html>