<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@page import="java.sql.*"%>
<jsp:useBean id='objDBConfig' scope='session' class='hitstd.group.tool.database.DBConfig' />
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
	String sql = "SELECT leelab.*,position.position as positionName FROM leelab left join position on leelab.positionID=position.positionID WHERE memberId ='" +request.getParameter("memberId")+"'";
	ResultSet rs = smt.executeQuery(sql);
	rs.next();
	%>


  <section class="w3l-team" id="team"></section>
  <!-- //Header -->
 <form action="memberEdit_DBUpdate_info.jsp?memberId=<%=request.getParameter("memberId")%>" method="post" name="form" >
  <section class="w3l-aboutblock py-5" id="about">
    <div class="midd-w3">
      <div class="container py-lg-5 py-md-3">
        <div class="row">
          <div class="col-lg-4 left-wthree-img text-righ">
            <div class="position-relative">
            <img src="<%=rs.getString("pic") %>" alt="">
            <h3>選擇要上傳的文件:</h3>
        
            <input type="file" name="theFirstFile" size="50" />
            <input type="button" onClick="javascript:pic();" name=submitButton value="上傳" />
<script language="javascript">  
//點選提交按鈕觸發下面的函式
function pic(){  
	document.form.action="memberEdit_DBUpdate_pic.jsp";
	document.form.enctype="multipart/form-data";
	document.form.submit();
}  
</script>         
        
              <!-- dialog itself, mfp-hide class is required to make dialog hidden -->
              
            </div>
          </div>
          <div class="col-lg-8 mt-lg-0 mt-5 about-right-faq align-self">
          <h3 class="title-big"><%=rs.getString("memberName") %></h3>
            <span class="text mb-2"><%=rs.getString("positionName") %></span>
            
            <p class="mt-4"><b>專長及研究領域：</b></p>
            <ol class="w3l-right mt-4">
              <li><%=rs.getString("skill1") %></li>
              
              <%if (rs.getString("skill2")== null){
            	  }else{%><li><%=rs.getString("skill2") %></li>
              <%} %>
              <%if (rs.getString("skill3")== null){
            	  }else{%><li><%=rs.getString("skill3") %></li>
              <%} %>
            </ol>
            <p>修改專長及研究領域：</p>
            <input type="text" name="skill1" value="<%=rs.getString("skill1") %>" /><br>
            <input type="text" name="skill2" value="<%=rs.getString("skill2") %>"/><br>
            <input type="text" name="skill3" value="<%=rs.getString("skill3") %>"/><br><br>
            <input type="submit" name=submitButton value="確認修改" />
       
          </div>
        </div>
      </div>
    </div>
  </section>
</form>
  <section class="w3-about-2" id="features"></section>
  <!-- services page block 3 -->
  <section class="w3l-mobile-content-6 py-5"></section>
  <!-- services page block 3 -->
  <!--/testimonials-->
  <section class="w3l-clients" id="clients"></section>
  <!--//testimonials-->
  <!-- footer -->
  <section class="w3l-footer-29-main"></section>
  <!-- //footer -->
  <!-- copyright -->
  <section class="w3l-footer-29-main w3l-copyright">
    <div class="container">
      <div class="row bottom-copies">
        <p class="col-lg-8 copy-footer-29"> 2020 Solutions. All rights reserved. Design by <a href="https://w3layouts.com/" target="_blank"> W3Layouts</a></p>
        <div class="col-lg-4 main-social-footer-29">
          <a href="#facebook" class="facebook"><span class="fa fa-facebook"></span></a>
          <a href="#twitter" class="twitter"><span class="fa fa-twitter"></span></a>
          <a href="#instagram" class="instagram"><span class="fa fa-instagram"></span></a>
          <a href="#linkedin" class="linkedin"><span class="fa fa-linkedin"></span></a>
        </div>
      </div>
    </div>
    <!-- move top -->
    <button onclick="topFunction()" id="movetop" title="Go to top">↑</button>
    <script>
      // When the user scrolls down 20px from the top of the document, show the button
      window.onscroll = function() {
        scrollFunction()
      };

      function scrollFunction() {
        if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
          document.getElementById("movetop").style.display = "block";
        } else {
          document.getElementById("movetop").style.display = "none";
        }
      }
      // When the user clicks on the button, scroll to the top of the document
      function topFunction() {
        document.body.scrollTop = 0;
        document.documentElement.scrollTop = 0;
      }
    </script>
    <!-- /move top -->
  </section>
  <!-- //copyright -->
  <!-- Template JavaScript -->
  <script src="assets/js/jquery-3.3.1.min.js"></script>
  <!-- script for customers -->
  <script src="assets/js/owl.carousel.js"></script>
  <script>
    $(document).ready(function() {
      $('.owl-three').owlCarousel({
        loop: true,
        margin: 0,
        nav: false,
        responsiveClass: true,
        autoplay: true,
        autoplayTimeout: 5000,
        autoplaySpeed: 1000,
        autoplayHoverPause: false,
        responsive: {
          0: {
            items: 3,
            nav: false
          },
          480: {
            items: 3,
            nav: false
          },
          667: {
            items: 4,
            nav: false
          },
          800: {
            items: 5,
            nav: false
          },
          1280: {
            items: 6,
            nav: false
          }
        }
      })
    })
  </script>
  <!-- //script for customers -->
  <!-- for tesimonials carousel slider -->
  <script>
    $(document).ready(function() {
      $("#owl-demo1").owlCarousel({
        loop: true,
        margin: 20,
        responsiveClass: true,
        responsive: {
          0: {
            items: 1,
            nav: true
          },
          736: {
            items: 2,
            nav: false
          },
          1000: {
            items: 2,
            nav: true,
            loop: false
          }
        }
      })
    })
  </script>
  <!-- //script -->
  <!-- script for teams -->
  <script>
    $(document).ready(function() {
      $('.owl-carousel').owlCarousel({
        loop: true,
        margin: 0,
        responsiveClass: true,
        responsive: {
          0: {
            items: 1,
            nav: true
          },
          415: {
            items: 2,
            nav: true,
            margin: 20
          },
          667: {
            items: 3,
            nav: true,
            margin: 20
          },
          1000: {
            items: 4,
            nav: true,
            loop: true,
            margin: 25
          }
        }
      })
    })
  </script>
  <!-- //script for teams-->
  <!-- magnific popup -->
  <script src="assets/js/jquery.magnific-popup.min.js"></script>
  <script>
    $(document).ready(function() {
      $('.popup-with-zoom-anim').magnificPopup({
        type: 'inline',
        fixedContentPos: false,
        fixedBgPos: true,
        overflowY: 'auto',
        closeBtnInside: true,
        preloader: false,
        midClick: true,
        removalDelay: 300,
        mainClass: 'my-mfp-zoom-in'
      });
      $('.popup-with-move-anim').magnificPopup({
        type: 'inline',
        fixedContentPos: false,
        fixedBgPos: true,
        overflowY: 'auto',
        closeBtnInside: true,
        preloader: false,
        midClick: true,
        removalDelay: 300,
        mainClass: 'my-mfp-slide-bottom'
      });
    });
  </script>
  <!-- magnific popup -->
  <!-- stats number counter-->
  <script src="assets/js/jquery.waypoints.min.js"></script>
  <script src="assets/js/jquery.countup.js"></script>
  <script>
    $('.counter').countUp();
  </script>
  <!-- //stats number counter -->
  <!-- disable body scroll which navbar is in active -->
  <script>
    $(function() {
      $('.navbar-toggler').click(function() {
        $('body').toggleClass('noscroll');
      })
    });
  </script>
  <!-- disable body scroll which navbar is in active -->
  <script src="assets/js/bootstrap.min.js"></script>
  </body>
</html>