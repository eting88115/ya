<%@page contentType="text/html"%>
<%@page pageEncoding="BIG5"%>
<%@page import="java.sql.*"%>
<jsp:useBean id='objDBConfig' scope='session' class='hitstd.group.tool.database.DBConfig' />
<%
if(request.getParameter("stuID") !=null &&
	request.getParameter("stuPwd") !=null){
	Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
	Connection con=DriverManager.getConnection("jdbc:ucanaccess://"+objDBConfig.FilePath()+";");
	Statement smt= con.createStatement();
	String getMemberData = "SELECT * FROM stuData WHERE stuID='"+
			request.getParameter("stuID")+"' AND stuPwd='" +
			request.getParameter("stuPwd")+"'";
	ResultSet members = smt.executeQuery(getMemberData);
	if(members.next()){
		session.setAttribute("accessID",request.getParameter("stuID"));
		//session.setMaxInactiveInterval(20); �۰ʵn�X
		response.sendRedirect("str-front.jsp");
	}else
		response.sendRedirect("login.jsp?status=loginerror");
}
%>