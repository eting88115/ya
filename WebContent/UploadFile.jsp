<%@ page language="java" contentType="text/html"
    pageEncoding="BIG5"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*,java.util.*"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<jsp:useBean id='objFolderConfig' scope='session' class='hitstd.group.tool.upload.FolderConfig' />
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>�ɮפW�ǧ@�~</title>
</head>
<body>
<%
	MultipartRequest theMultipartRequest = new MultipartRequest (request, objFolderConfig.FilePath(),10*1024*1024) ;
	Enumeration theEnumeration = theMultipartRequest.getFileNames() ;
	
	
	while (theEnumeration.hasMoreElements()){
	String fieldName = (String)theEnumeration.nextElement () ;
	String fileName =theMultipartRequest.getFilesystemName (fieldName);
	String contentType = theMultipartRequest.getContentType (fieldName) ;
	
	File theFile = theMultipartRequest.getFile(fieldName) ;
			
			out.println("�ɮצW��:"+fileName+"<br>") ;
			out.println("�ɮ׫��A:"+contentType+"<br>");
			out.println("�ɮ׸��|:"+theFile.getAbsolutePath()+"<br>") ;
			Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
			Connection con=DriverManager.getConnection("jdbc:ucanaccess://D:\\leelabnas\\Java\\course\\Access\\member.accdb;");
			Statement smt= con.createStatement();
			
			smt.executeUpdate("UPDATE leelab SET pic ='" + fileName+ "' WHERE memberId ='" + session.getAttribute("accessId")+"' ");
			response.sendRedirect("member.jsp?memberId="+session.getAttribute("accessId")+"");
	}
			
%>
</body>
</html>