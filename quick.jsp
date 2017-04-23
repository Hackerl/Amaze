<%@ page language="java"  import="java.util.*,java.sql.ResultSet,com.mysqltool.*,java.sql.SQLException"  pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%> 
<%
        if(request.getParameter("id")==null){
            response.sendRedirect("index.jsp");
            return;
            }
		int id = Integer.parseInt(request.getParameter("id"));
	    if(id < 1 ) {   //信息不能为空，前端同时用js检测
		    //out.println("信息不能为空!!");
		    response.sendRedirect("index.jsp");             //重定向到注册
		    return;
            }
        /* 过滤特殊字符串 检测各个字段长度 防止超出列数据长度限制 检测密码强弱 禁止弱密码 检测各个字段是否合法 比如类型是否为1、2 */

        String result="";
        try {
            result = sqltool.getitem(id);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(result.equals(""))
            response.sendRedirect("index.jsp");
        String[] item = result.split("&");

%> 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<!--[if IE]>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Amaze, premium HTML5 &amp; CSS3 template</title>
<!-- Favicons Icon -->
<link rel="icon" href="http://demo.magikthemes.com/skin/frontend/base/default/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="http://demo.magikthemes.com/skin/frontend/base/default/favicon.ico" type="image/x-icon" />
<!-- Mobile Specific -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<!-- CSS Style -->

<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/fancybox.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/revslider.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.css" type="text/css">
<link rel="stylesheet" href="css/owl.theme.css" type="text/css">
<link rel="stylesheet" href="css/flexslider.css" type="text/css">
<link rel="stylesheet" href="css/cloudzoom.css" type="text/css">
<link rel="stylesheet" href="css/jquery.fancybox.css" type="text/css">

<link rel="stylesheet" href="css/font-awesome.css" type="text/css">
<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Roboto:400,500,700' rel='stylesheet' type='text/css'>
</head>
<body class="cms-index-index">
<div id="fancybox-overlay">
<div id="fancybox-wrap">
  <div id="fancybox-outer">
    <div style="border-width: 10px; width: 1170px; height: auto;" id="fancybox-content">
      <div style="width:auto;height:auto;overflow: auto;position:relative;">
        <div class="product-view">
            <div class="product-essential">
              <form action="#" method="post" id="product_addtocart_form">
                <input name="form_key" value="6UbXroakyQlbfQzK" type="hidden">
                <div class="product-img-box col-lg-6 col-md-6 col-sm-6 col-xs-12">
                  <div class="new-label new-top-left"> New </div>
                  <div class="product-image">
                    <div class="large-image"> <a href="<% out.println(item[4]);     %>" class="cloud-zoom" id="zoom1" rel="useWrapper: false, adjustY:0, adjustX:20"> <img alt="product-image" src="<% out.println(item[4]);     %>"> </a> </div>

                  </div>
                  <!-- end: more-images -->
                  <div class="clear"></div>
                </div>
                <div class="product-shop col-lg-6 col-md-6 col-sm-6 col-xs-12">
                  
                  <div class="product-name">
                    <h1><%  out.println(item[1]); %></h1>
                  </div>
                  <div class="ratings">
                    <div class="rating-box">
                      <div style="width:60%" class="rating"></div>
                    </div>
                    <p class="rating-links"> <a href="#">1 Review(s)</a> <span class="separator">|</span> <a href="#">Add Your Review</a> </p>
                  </div>
                  <div class="short-description">
                    <h2>Quick Overview</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum. Morbi ornare lectus quis justo gravida semper. Nulla tellus mi, vulputate adipiscing cursus eu, suscipit id nulla.</p>
                    <p>Sweetheart neck peplum midi dress with belt. Up the glamour stakes with this gorgeous peplum dress.</p>
                  </div>
                  <p class="availability in-stock">Availability: <span>In Stock</span></p>
                  <div class="price-block">
                    <div class="price-box">
                      <p class="old-price"> <span class="price-label">Regular Price:</span> <span id="old-price-48" class="price"> $<%out.println(item[2]); %>  </span> </p>
                      <p class="special-price"> <span class="price-label">Special Price</span> <span id="product-price-48" class="price"> $<%  double price = Double.parseDouble(item[2]);double agio = Double.parseDouble(item[3]);out.println(price * agio);%> </span> </p>
                    </div>
                  </div>
                  <div class="add-to-box">
                    <div class="add-to-cart">
                      <label id="success" for="qty">Quantity:</label>
                      <div class="pull-left">
                        <div class="custom pull-left">
                          <button onClick="var result = document.getElementById('qty'); var qty = result.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 0 ) result.value--;return false;" class="reduced items-count" type="button"><i class="icon-minus">&nbsp;</i></button>
                          <input type="text" class="input-text qty" title="Qty" value="1" maxlength="12" id="qty" name="qty">
                          <input type="hidden" value="<%     out.println(item[0]);        %>" id="itemid">
                          <button onClick="var result = document.getElementById('qty'); var qty = result.value; if( !isNaN( qty )) result.value++;return false;" class="increase items-count" type="button"><i class="icon-plus">&nbsp;</i></button>
                        </div>
                      </div>
                      <button onClick="quick_addcart();" class="button btn-cart" title="Add to Cart" type="button"><span><i class="icon-basket"></i> Add to Cart</span></button>
                    </div>
                    <div class="email-addto-box">
                      <ul class="add-to-links">
                        <li> <a class="link-wishlist" href="#"><span>Add to Wishlist</span></a></li>
                        <li><span class="separator">|</span> <a class="link-compare" href="#"><span>Add to Compare</span></a></li>
                      </ul>
                      <p class="email-friend"><a href="#" class=""><span>Email to a Friend</span></a></p>
                    </div>
                  </div>
                </div>
              </form>
            </div>
          </div>
        <!--product-view--> 
      </div>
    </div>
    <a style="display: inline;" id="fancybox-close" href="
    <%
    if(request.getHeader("referer")==null)
        out.println("index.jsp");
    else
        out.println(request.getHeader("referer"));
    %>"></a> </div>
</div>
</div>

<!-- JavaScript --> 
<script type="text/javascript" src="js/jquery.fancybox.js?v=2.1.5"></script>
<script type="text/javascript" src="js/cart.js"></script>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/owl.carousel.min.js"></script>
<script type="text/javascript" src="js/jquery.flexslider.js"></script>
<script type="text/javascript" src="js/cloud-zoom.js"></script>
<script>
			new UISearch( document.getElementById( 'form-search' ) );
		</script>


</body>
</html>
