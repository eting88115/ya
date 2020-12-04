<%@page contentType="text/html"%>
<%@page pageEncoding="MS950"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

/* Set a style for all buttons */
button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

button:hover {
  opacity:1;
}

/* Extra styles for the cancel button */
.cancelbtn {
  padding: 14px 20px;
  background-color: #f44336;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn, .signupbtn {
  float: left;
  width: 50%;
}

/* Add padding to container elements */
.container {
  padding: 16px;
}

/* Clear floats */
.clearfix::after {
  content: "";
  clear: both;
  display: table;
}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
  .cancelbtn, .signupbtn {
     width: 100%;
  }
}
</style>
<body>
		
<form action="signUp_DBInsertInto.jsp" method="get" style="border:1px solid #ccc">
  <div class="container">
    <h1>���U</h1>
    <%if (request.getParameter("status")!="" && request.getParameter("status")!=null){
							if(request.getParameter("status").equals("IDexist")){ %>
							<p><font color="red">�b���w�s�b�A�еn�J�έ��s���U!</font></p>
						<%}else{} }%>
    <p>�ж�g��ƥH�إ߱b��</p>
    <hr>

    <label for="memberid"><b>ID</b></label>
    <input type="text" placeholder="�п�J�b��" name="memberId" required>

    <label for="memberpwd"><b>Password</b></label>
    <input type="password" placeholder="�п�J�K�X" name="memberPwd" required>

    <div class="clearfix">
      <button type="submit" class="signupbtn">���U</button>
      <button type="reset" class="cancelbtn">����</button>
    </div>
  </div>
</form>

	
</body>
</html>
