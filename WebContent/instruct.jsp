<%@ page language="java" contentType="text/html; charset=BIG5" pageEncoding="BIG5" import="java.sql.*"%>
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
  <style>


.pagination {
  display: inline-block;
}

.pagination a {
  color: #668cff;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
}

.pagination a.active {
  background-color: #4CAF50;
  color: white;
  border-radius: 5px;
}

.pagination a:hover:not(.active) {
  background-color: #ddd;
  border-radius: 5px;
}
</style>
</head>
<body>
	<%! int num=0; //宣告全域變數num %>
	<%
	// Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	// Connection con =DriverManager.getConnection("jdbc:odbc:dataBase") ;
	Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
		Connection con=DriverManager.getConnection("jdbc:ucanaccess://"+objDBConfig.FilePath()+";");
	Statement smt= con.createStatement
			(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
	
	String sql = "SELECT * FROM instruct ORDER BY instructYear DESC";
	ResultSet rs = smt.executeQuery(sql);
	rs.last(); //將指標移至最後一筆資料
	int last = rs.getRow(); //取得總資料筆數
	int lastno, lastpage, nowpage, prepage, nextpage, nostart, noend;
	lastno = rs.getRow();
	lastpage = (int)Math.ceil((double)lastno/5);//計算最後一頁編號
	
	if(request.getParameter("page")!= null)
		try{
			nowpage = Integer.parseInt(request.getParameter("page"));
		}catch(Exception e){
			nowpage = Integer.parseInt(request.getParameter("p"));
		}
	else
		nowpage= 1;
	
	prepage = nowpage-1; //上一頁
	nextpage = nowpage+1; //下一頁
	if(nowpage == 1) //判斷是否為第一頁
		prepage=1;
	if(nowpage == lastpage) //判斷是否為最後一頁
		prepage=lastpage-1;
	
	nostart = nowpage * 5 -4;  //計算開始編號
	noend = nowpage * 5;  //計算結束編號
	
	sql = "SELECT * FROM instruct WHERE ID BETWEEN "+nostart+" AND "+noend+" ORDER BY instructYear DESC";
	rs = smt.executeQuery(sql);
	
	%>
  
  <section class="w3l-aboutblock py-5" id="about">
    <div class="midd-w3">
      <div class="container py-lg-5 py-md-3">
        <div class="row">
          <div class="col-lg-12 mt-lg-0 mt-5 about-right-faq align-self">
            <span class="text text-center mb-2">論文與專題指導</span>
            <ol class="w3l-right">
            <% int num=0;
         		while(rs.next()){%>
            	<li><%=rs.getString("instruct") %></li>
            <% num++;}%>
            </ol>
		    <form action="instruct.jsp" method="get">
				<table >
				<tr >
				<td class="pagination"><a href="instruct.jsp?page=1">&laquo;</a></td>
				<td class="pagination"><a href="instruct.jsp?page=<%=prepage%>">&lt;</a></td>
				<td class="pagination"><a href="instruct.jsp?page=<%=nextpage%>">&gt;</a></td>
				<td class="pagination"><a href="instruct.jsp?page=<%=lastpage%>">&raquo;</a></td>
				<td></td>
				<td>目前頁次 <%=nowpage%>/<%=lastpage%></td></tr>
				</table>
			</form>
          </div>
        </div>
      </div>
    </div>
  </section>
  
   
  <!-- //Header -->
  <!-- banner section -->
  <!-- //banner section -->
  <section class="w3l-index3" id="about"></section>
  <!-- /bottom-grids-->
  <!-- //bottom-grids-->
  <section class="w3l-index3" id="about"> </section>
  <section class="w3l-technologies"></section>
  
  <!-- Quote -->
  <!-- //Quote -->
  <!-- footer -->
  <section class="w3l-footer-29-main"></section>
  <!-- //footer -->
  <!-- copyright -->
  <section class="w3l-footer-29-main w3l-copyright">
    <div class="container">
      <div class="row bottom-copies">
        <p class="col-lg-8 copy-footer-29">2020 LeeLab. All rights reserved. Design by Yu-Jia.</a></p>
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
  <script src="assets/js/bootstrap.min.js" style=""></script>
</body>
</html>