<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5" import="java.sql.*"%>
<!DOCTYPE html>
<html lang="tc">
<head>
<meta charset="BIG5">
<title>stu-login_post</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css\styles.css" >
<link rel="stylesheet" href="css\styles2.css" >
<link rel="stylesheet" href="css\styles3.css" >
<link rel="stylesheet" href="css\styles4.css">
<link rel="stylesheet" href="css\styles5.css">
</head>
<body>

<!-- Header --->
<%@ include file="menu-stu.jsp" %>
<!-- Sidebar -->
 <nav class="w3-sidebar w3-bar-block w3-collapse w3-large w3-theme-l5 w3-animate-left" id="mySidebar">
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-right w3-xlarge w3-padding-large w3-hover-black w3-hide-large" title="Close Menu">
     <i class="fa fa-remove"></i>
  </a>
   <%@ include file="left-stu.jsp" %>
 </nav>
 
<!-- Header -->
<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- Main content: shift it to the right by 250 pixels when the sidebar is visible -->
<div class="w3-main" style="margin-left:250px">

  <div class="w3-row w3-padding-64">
    <div class="form-fields d-grid"> 
    </div>
  </div>

  <div class="w3-row">
    <div class="post" align="center">
      <h1 class="w3-text-teal"><b>���i��T</b></h1>
      <a href="#" class="w3-text-cyan w3-hover-red">�s�W���i</a>
    </div>
    <hr>
        <div class="w3-twothird w3-container">
        <h2 class="statute"><b>�J�٬����k�W</b></h2>
        </div>
            <div class="w3-twothird w3-container">
              <ul>
              <li><a href="#">[109-04-27]�J�٥ӽЧ@�~��T</a></li>
              <li><a href="#">[109-04-27]�ǥͱJ�٦�J�W�h</a></li>
              <li><a href="#">[109-04-27]�ǥͱJ�٥ͬ��۪v��Ų�O�I�з�</a></li>
              <li><a href="#">[109-04-27]�ǥͱJ�����`�N�ƶ��[�ͬ�����</a></li>
              </ul>
            </div>
        <div class="w3-twothird w3-container">
        <h2 class="news"><b>�̷s����</b></h2>
        </div>
            <div class="w3-twothird w3-container">
              <ul>
              <li><a href="#">[109-05-01]�ǥͱJ�٦�J�O�պ���������</a></li>
              <li><a href="#">[109-05-01]���H�C���J��Τ��C���J����ӽбJ�٫O�٩��u�f�`�N�ƶ�</a></li>
              <li><a href="#">[109-04-28]109�Ǧ~�׮ե����ǥͱJ�٥ӽмf�ֵ��G���i</a></li>
              <li><a href="#">[109-04-11]109�Ǧ~�׮ե����ǥͱJ�ٶ}��ӽЧɦ��</a></li>
              </ul>
            </div>
   </div>
   
  <!-- Pagination -->
  <div class="w3-center w3-padding-32">
    <div class="w3-bar">
      <a class="w3-button w3-black" href="#">1</a>
      <a class="w3-button w3-hover-black" href="#">2</a>
      <a class="w3-button w3-hover-black" href="#">3</a>
      <a class="w3-button w3-hover-black" href="#">4</a>
      <a class="w3-button w3-hover-black" href="#">5</a>
      <a class="w3-button w3-hover-black" href="#">&raquo;</a>
    </div>
  </div>
</div>
<!-- Footer -->
<%@ include file="pageend.jsp" %>
</html>