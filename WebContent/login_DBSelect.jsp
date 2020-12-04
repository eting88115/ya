<%@page contentType="text/html"%>
<%@page pageEncoding="BIG5"%>
<%@page import="java.sql.*"%>
<jsp:useBean id='objDBConfig' scope='session' class='hitstd.group.tool.database.DBConfig' />
<%
if(request.getParameter("memberId") !=null &&
	request.getParameter("memberPwd") !=null){
	Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
	Connection con=DriverManager.getConnection("jdbc:ucanaccess://"+objDBConfig.FilePath()+";");
	Statement smt= con.createStatement();
	String getMemberData = "SELECT * FROM leelab WHERE memberId='"+
			request.getParameter("memberId")+"' AND memberPwd='" +
			request.getParameter("memberPwd")+"'";
	ResultSet members = smt.executeQuery(getMemberData);
	if(members.next()){
		session.setAttribute("accessId",request.getParameter("memberId"));
		//session.setMaxInactiveInterval(20); ¦Û°Êµn¥X
		response.sendRedirect("index.jsp");
	}else
		response.sendRedirect("login.jsp?status=loginerror");
}
%>