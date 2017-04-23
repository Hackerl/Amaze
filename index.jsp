﻿<%@ page language="java" import="java.util.*,com.mysqltool.*,java.sql.ResultSet,java.sql.SQLException" pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="css/slider.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.css" type="text/css">
<link rel="stylesheet" href="css/owl.theme.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
</head>
<body>
<div class="page">
  <!-- Header -->
  <header class="header">
    <div class="container">
      <div class="row">
        <div class="col-lg-5 col-sm-4 col-md-5">
          <!-- Header Logo -->
          <a class="logo" title="Magento Commerce" href="index.jsp"><img alt="Magento Commerce" src="images/logo.png"></a>
          <!-- End Header Logo -->
        </div>
        <div class=" col-lg-7 col-sm-8 col-md-7 col-xs-12">
          <div class="header-top">
            <div class="welcome-msg hidden-xs">Welcome To Hackerl's World! </div>
            <!-- Header Language --
            <div class="dropdown block-language-wrapper"> <a role="button" data-toggle="dropdown" data-target="#" class="block-language dropdown-toggle" href="#"> <img src="images/english.png" alt="language"> English <span class="caret"></span> </a>
              <ul class="dropdown-menu" role="menu">
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><img src="images/english.png" alt="language"> English </a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><img src="images/francais.png" alt="language"> French </a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><img src="images/german.png" alt="language"> German </a></li>
              </ul>
            </div>
            !-- End Header Language -->
            <!-- Header Top Links -->
            <div class="toplinks">
              <div class="links">
                <div class="myaccount"><a title="My Account" href="login.jsp"><span class="hidden-xs">My Account</span></a></div>
                <div class="wishlist"><a title="My Wishlist" href="wishlist.html"><span class="hidden-xs">Wishlist</span></a></div>
                <div class="demo"><a href="blog.html" title="Blog"><span class="hidden-xs">Blog</span></a></div>
                <!-- Header Company -->
                <div class="dropdown block-company-wrapper hidden-xs"> <a role="button" data-toggle="dropdown" data-target="#" class="dropdown-toggle" href="#"> Company <span class="caret"></span></a>
                  <ul class="dropdown-menu" role="menu">
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="about_us.html"> About Us </a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#"> Customer Service </a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#"> Privacy Policy </a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="sitemap.html">Site Map </a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Search Terms </a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Advanced Search </a></li>
                  </ul>
                </div>
                <!-- End Header Company -->
                <div class="login">
                      <%
                	    if(session.getAttribute("username") == null)
                            out.println("<a href=\"login.jsp\"><span class=\"hidden-xs\">Log In</span></a>");
                        else
                            out.println("<a href=\"#\"><span class=\"hidden-xs\">"+session.getAttribute("username")+"</span></a>");
                        %> 
                
                </div>
              </div>
            </div>
            <!-- End Header Top Links -->
          </div>
          <div class="cart_cur_block">
            <!-- Header Currency --
            <div class="dropdown block-currency-wrapper"> <a role="button" data-toggle="dropdown" data-target="#" class="block-currency dropdown-toggle" href="#"> USD <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#"> $ - Dollar </a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#"> £ - Pound </a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#"> € - Euro </a></li>
              </ul>
            </div>
            -- End Header Currency -->
            <!-- Top Cart -->
            <div class="top-cart-contain">
              <div class="mini-cart">
                <div data-toggle="dropdown" data-hover="dropdown" class="basket dropdown-toggle"> <a href="#"><span class="hidden-xs">shopping cart</span></a></div>
                <div>
                  <div style="display: none;" class="top-cart-content arrow_box">
                    <div class="block-subtitle">
                    <%
                        if(session.getAttribute("username")!=null)
                            out.println("Recently added item(s)");
                        else
                            out.println("Login first");
                        
                    %></div>
                    <ul id="cart-sidebar" class="mini-products-list">
                    <%
                         double all_money=0;
                         if(session.getAttribute("username")!=null){
                                String username = session.getAttribute("username").toString();
                                String user_cart=username+"_cart";
                                String user_number=username+"_number"; 
                                
                                 if(application.getAttribute(user_cart) == null){
                                    List<String> list = new ArrayList<String>();
                                    application.setAttribute(user_cart,list);
                                    }
                                 if(application.getAttribute(user_number) == null){
                                    HashMap<String , Integer> map = new HashMap<String , Integer>();
                                    application.setAttribute(user_number,map);
                                    }
                                 
                                List<String> cart = (List<String>)application.getAttribute(user_cart);
                                HashMap<String , Integer> number_map = (HashMap<String , Integer>)application.getAttribute(user_number);
                                
                                String item_result="";
                                String[] item_detial;
                                String item_id;
                                
                                for (int i=0; i<cart.size(); i++) {
                                    item_id = cart.get(i);
                                    item_result = sqltool.getitem(Integer.parseInt(item_id));
                                    item_detial = item_result.split("&");
                                    
                                    double real_price = Double.parseDouble(item_detial[2]) * Double.parseDouble(item_detial[3]);
                                    all_money += real_price*number_map.get(item_id);
                                    out.println("<li class=\"item odd\"> <a href=\"item.jsp?id="+item_detial[0]+"\" title=\""+item_detial[1]+"\" class=\"product-image\"><img src=\""+item_detial[4]+"\" alt=\"Product image\" width=\"55\"></a><div class=\"product-details\"> <a id=\"del_node_"+item_detial[0]+"\" href=\"javascript:delcart("+item_detial[0]+");\" title=\"Remove This Item\" onClick=\"\" class=\"btn-remove1\">Remove This Item</a> <a class=\"btn-edit\" title=\"Edit item\" href=\"#\">Edit item</a><p class=\"product-name\"><a href=\"item.jsp?id="+item_detial[0]+"\">"+item_detial[1]+"</a> </p><strong>"+number_map.get(item_id)+"</strong> x <span class=\"price\">$"+real_price+"</span> </div></li>");
                                }

                         }
                     %>
                    <!--
                      <li class="item odd"> <a href="product_detail.html" title="Skater Dress In Leaf Print" class="product-image"><img src="products-images/product1.jpg" alt="Product image" width="55"></a>
                        <div class="product-details"> <a href="#" title="Remove This Item" onClick="" class="btn-remove1">Remove This Item</a> <a class="btn-edit" title="Edit item" href="#">Edit item</a>
                          <p class="product-name"><a href="product_detail.html">Sample Product</a> </p>
                          <strong>1</strong> x <span class="price">$20.00</span> </div>
                      </li>
                      <li class="item even"> <a href="product_detail.html" title="Product layout: large content" class="product-image"><img src="products-images/product1.jpg" alt="Product image" width="55"></a>
                        <div class="product-details"> <a href="#" title="Remove This Item" onClick="" class="btn-remove1">Remove This Item</a> <a class="btn-edit" title="Edit item" href="#">Edit item</a>
                          <p class="product-name"><a href="product_detail.html">Sample Product</a> </p>
                          <strong>1</strong> x <span class="price">$230.00</span> </div>
                      </li>
                      <li class="item last odd"> <a href="product_detail.html" title="Skater Dress In Leaf Print" class="product-image"><img src="products-images/product1.jpg" alt="Product image" width="55"></a>
                        <div class="product-details"> <a href="#" title="Remove This Item" onClick="" class="btn-remove1">Remove This Item</a><a class="btn-edit" title="Edit item" href="#">Edit item</a>
                          <p class="product-name"><a href="product_detail.html">Sample Product</a> </p>
                          <strong>2</strong> x <span class="price">$420.00</span> </div>
                      </li>    
                      -->
                    </ul>
                    <div class="top-subtotal">Subtotal: <span class="price">$<% out.println(all_money); %></span></div>
                    <div class="actions">
                      <a href="checkout.jsp"><button class="btn-checkout" type="button"><span>Checkout</span></button></a>
                      <a href="cart.jsp"><button class="view-cart" type="button"><span>View Cart</span></button></a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- End Top Cart -->
          </div>
        </div>
      </div>
    </div>
  </header>
  <!-- end header -->
  <!-- Navbar -->
  <nav>
    <div class="container">
      <div class="nav-inner">
        <!-- mobile-menu -->
        <div class="hidden-desktop" id="mobile-menu">
          <ul class="navmenu">
            <li>
              <div class="menutop">
                <div class="toggle"> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span></div>
                <h2>Menu</h2>
              </div>
              <ul style="display:none;" class="submenu">
                <li>
                  <ul class="topnav"><li class="level0 nav-6 level-top first parent"> <a class="level-top" href="index.jsp"> <span>Home</span> </a>
                      <!--<ul class="level0">
                        <li class="level1"><a href="../../layout-1/red/index.jsp"><span>Home Version 1</span></a> </li>
                        <li class="level1"><a href="../../layout-2/red/index.jsp"><span> Home Version 2</span></a> </li>
                        <li class="level1"><a href="../../layout-1/aqua/index.jsp"><span>Aqua</span></a> </li>
                        <li class="level1"><a href="../../layout-1/orange/index.jsp"><span>Orange</span></a> </li>
                        <li class="level1"><a href="../../layout-1/red/index.jsp"><span>Red</span></a> </li>
                        <li class="level1"><a href="../../layout-1/yellow/index.jsp"><span>Yellow</span></a> </li>
                         </ul> -->
                    </li>
                    <li class="level0 nav-1 level-top first parent"> <a href="grid.html" class="level-top"> <span>Women</span> </a>
                      <ul class="level0">
                        <li class="level1 nav-1-1 first parent"> <a href="grid.html"> <span>Stylish Bag</span> </a>
                          <ul class="level1">
                            <li class="level2 nav-1-1-1 first"> <a href="grid.html"> <span>Clutch Handbags</span> </a> </li>
                            <li class="level2 nav-1-1-2"> <a href="grid.html"> <span>Diaper Bags</span> </a> </li>
                            <li class="level2 nav-1-1-3"> <a href="grid.html"> <span>Bags</span> </a> </li>
                            <li class="level2 nav-1-1-4 last"> <a href="grid.html"> <span>Hobo Handbags</span> </a> </li>
                          </ul>
                        </li>
                        <li class="level1 nav-1-2 parent"> <a href="grid.html"> <span>Material Bag</span> </a>
                          <ul class="level1">
                            <li class="level2 nav-1-2-5 first"> <a href="grid.html"> <span>Beaded Handbags</span> </a> </li>
                            <li class="level2 nav-1-2-6"> <a href="grid.html"> <span>Fabric Handbags</span> </a> </li>
                            <li class="level2 nav-1-2-7"> <a href="grid.html"> <span>Handbags</span> </a> </li>
                            <li class="level2 nav-1-2-8 last"> <a href="grid.html"> <span>Leather Handbags</span> </a> </li>
                          </ul>
                        </li>
                        <li class="level1 nav-1-3 parent"> <a href="grid.html"> <span>Shoes</span> </a>
                          <ul class="level1">
                            <li class="level2 nav-1-3-9 first"> <a href="grid.html"> <span>Flat Shoes</span> </a> </li>
                            <li class="level2 nav-1-3-10"> <a href="grid.html"> <span>Flat Sandals</span> </a> </li>
                            <li class="level2 nav-1-3-11"> <a href="grid.html"> <span>Boots</span> </a> </li>
                            <li class="level2 nav-1-3-12 last"> <a href="grid.html"> <span>Heels</span> </a> </li>
                          </ul>
                        </li>
                        <li class="level1 nav-1-4 parent"> <a href="grid.html"> <span>Jwellery</span> </a>
                          <ul class="level1">
                            <li class="level2 nav-1-4-13 first"> <a href="grid.html"> <span>Bracelets</span> </a> </li>
                            <li class="level2 nav-1-4-14"> <a href="grid.html"> <span>Necklaces &amp; Pendants</span> </a> </li>
                            <li class="level2 nav-1-4-15"> <a href="grid.html"> <span>Pendants</span> </a> </li>
                            <li class="level2 nav-1-4-16 last"> <a href="grid.html"> <span>Pins &amp; Brooches</span> </a> </li>
                          </ul>
                        </li>
                        <li class="level1 nav-1-5 parent"> <a href="grid.html"> <span>Dresses</span> </a>
                          <ul class="level1">
                            <li class="level2 nav-1-5-17 first"> <a href="grid.html"> <span>Casual Dresses</span> </a> </li>
                            <li class="level2 nav-1-5-18"> <a href="grid.html"> <span>Evening</span> </a> </li>
                            <li class="level2 nav-1-5-19"> <a href="grid.html"> <span>Designer</span> </a> </li>
                            <li class="level2 nav-1-5-20 last"> <a href="grid.html"> <span>Party</span> </a> </li>
                          </ul>
                        </li>
                        <li class="level1 nav-1-6 last parent"> <a href="grid.html"> <span>Swimwear</span> </a>
                          <ul class="level1">
                            <li class="level2 nav-1-6-21 first"> <a href="grid.html"> <span>Swimsuits</span> </a> </li>
                            <li class="level2 nav-1-6-22"> <a href="grid.html"> <span>Beach Clothing</span> </a> </li>
                            <li class="level2 nav-1-6-23"> <a href="grid.html"> <span>Clothing</span> </a> </li>
                            <li class="level2 nav-1-6-24 last"> <a href="grid.html"> <span>Bikinis</span> </a> </li>
                          </ul>
                        </li>
                      </ul>
                    </li>
                    <li class="level0 nav-2 level-top parent"> <a href="grid.html" class="level-top"> <span>Men</span> </a>
                      <ul class="level0">
                        <li class="level1 nav-2-1 first parent"> <a href="grid.html"> <span>Shoes</span> </a>
                          <ul class="level1">
                            <li class="level2 nav-2-1-1 first"> <a href="grid.html"> <span>Sport Shoes</span> </a> </li>
                            <li class="level2 nav-2-1-2"> <a href="grid.html"> <span>Casual Shoes</span> </a> </li>
                            <li class="level2 nav-2-1-3"> <a href="grid.html"> <span>Leather Shoes</span> </a> </li>
                            <li class="level2 nav-2-1-4 last"> <a href="grid.html"> <span>canvas shoes</span> </a> </li>
                          </ul>
                        </li>
                        <li class="level1 nav-2-2 parent"> <a href="grid.html"> <span>Dresses</span> </a>
                          <ul class="level1">
                            <li class="level2 nav-2-2-5 first"> <a href="grid.html"> <span>Casual Dresses</span> </a> </li>
                            <li class="level2 nav-2-2-6"> <a href="grid.html"> <span>Evening</span> </a> </li>
                            <li class="level2 nav-2-2-7"> <a href="grid.html"> <span>Designer</span> </a> </li>
                            <li class="level2 nav-2-2-8 last"> <a href="grid.html"> <span>Party</span> </a> </li>
                          </ul>
                        </li>
                        <li class="level1 nav-2-3 parent"> <a href="grid.html"> <span>Jackets</span> </a>
                          <ul class="level1">
                            <li class="level2 nav-2-3-9 first"> <a href="grid.html"> <span>Coats</span> </a> </li>
                            <li class="level2 nav-2-3-10"> <a href="grid.html"> <span>Formal Jackets</span> </a> </li>
                            <li class="level2 nav-2-3-11"> <a href="grid.html"> <span>Leather Jackets</span> </a> </li>
                            <li class="level2 nav-2-3-12 last"> <a href="grid.html"> <span>Blazers</span> </a> </li>
                          </ul>
                        </li>
                        <li class="level1 nav-2-4 parent"> <a href="grid.html"> <span>Watches</span> </a>
                          <ul class="level1">
                            <li class="level2 nav-2-4-13 first"> <a href="grid.html"> <span>Fastrack</span> </a> </li>
                            <li class="level2 nav-2-4-14"> <a href="grid.html"> <span>Casio</span> </a> </li>
                            <li class="level2 nav-2-4-15"> <a href="grid.html"> <span>Titan</span> </a> </li>
                            <li class="level2 nav-2-4-16 last"> <a href="grid.html"> <span>Tommy-Hilfiger</span> </a> </li>
                          </ul>
                        </li>
                        <li class="level1 nav-2-5 parent"> <a href="grid.html"> <span>Sunglasses</span> </a>
                          <ul class="level1">
                            <li class="level2 nav-2-5-17 first"> <a href="grid.html"> <span>Ray Ban</span> </a> </li>
                            <li class="level2 nav-2-5-18"> <a href="grid.html"> <span>Fastrack</span> </a> </li>
                            <li class="level2 nav-2-5-19"> <a href="grid.html"> <span>Police</span> </a> </li>
                            <li class="level2 nav-2-5-20 last"> <a href="grid.html"> <span>Oakley</span> </a> </li>
                          </ul>
                        </li>
                        <li class="level1 nav-2-6 last parent"> <a href="grid.html"> <span>Accessories</span> </a>
                          <ul class="level1">
                            <li class="level2 nav-2-6-21 first"> <a href="grid.html"> <span>Backpacks</span> </a> </li>
                            <li class="level2 nav-2-6-22"> <a href="grid.html"> <span>Wallets</span> </a> </li>
                            <li class="level2 nav-2-6-23"> <a href="grid.html"> <span>Laptop Bags</span> </a> </li>
                            <li class="level2 nav-2-6-24 last"> <a href="grid.html"> <span>Belts</span> </a> </li>
                          </ul>
                        </li>
                      </ul>
                    </li>
                    <li class="level0 nav-3 level-top parent"> <a href="grid.html" class="level-top"> <span>Electronics</span> </a>
                      <ul class="level0">
                        <li class="level1 nav-3-1 first parent"> <a href="grid.html"> <span>Mobiles</span> </a>
                          <ul class="level1">
                            <li class="level2 nav-3-1-1 first"> <a href="grid.html"> <span>Samsung</span> </a> </li>
                            <li class="level2 nav-3-1-2"> <a href="grid.html"> <span>Nokia</span> </a> </li>
                            <li class="level2 nav-3-1-3"> <a href="grid.html"> <span>iPhone</span> </a> </li>
                            <li class="level2 nav-3-1-4 last"> <a href="grid.html"> <span>Sony</span> </a> </li>
                          </ul>
                        </li>
                        <li class="level1 nav-3-2 parent"> <a href="grid.html"> <span>Accessories</span> </a>
                          <ul class="level1">
                            <li class="level2 nav-3-2-5 first"> <a href="grid.html"> <span>Mobile Memory Cards</span> </a> </li>
                            <li class="level2 nav-3-2-6"> <a href="grid.html"> <span>Cases &amp; Covers</span> </a> </li>
                            <li class="level2 nav-3-2-7"> <a href="grid.html"> <span>Mobile Headphones</span> </a> </li>
                            <li class="level2 nav-3-2-8 last"> <a href="grid.html"> <span>Bluetooth Headsets</span> </a> </li>
                          </ul>
                        </li>
                        <li class="level1 nav-3-3 parent"> <a href="grid.html"> <span>Cameras</span> </a>
                          <ul class="level1">
                            <li class="level2 nav-3-3-9 first"> <a href="grid.html"> <span>Camcorders</span> </a> </li>
                            <li class="level2 nav-3-3-10"> <a href="grid.html"> <span>Point &amp; Shoot</span> </a> </li>
                            <li class="level2 nav-3-3-11"> <a href="grid.html"> <span>Digital SLR</span> </a> </li>
                            <li class="level2 nav-3-3-12 last"> <a href="grid.html"> <span>Camera Accessories</span> </a> </li>
                          </ul>
                        </li>
                        <li class="level1 nav-3-4 parent"> <a href="grid.html"> <span>Audio &amp; Video</span> </a>
                          <ul class="level1">
                            <li class="level2 nav-3-4-13 first"> <a href="grid.html"> <span>MP3 Players</span> </a> </li>
                            <li class="level2 nav-3-4-14"> <a href="grid.html"> <span>iPods</span> </a> </li>
                            <li class="level2 nav-3-4-15"> <a href="grid.html"> <span>Speakers</span> </a> </li>
                            <li class="level2 nav-3-4-16 last"> <a href="grid.html"> <span>Video Players</span> </a> </li>
                          </ul>
                        </li>
                        <li class="level1 nav-3-5 parent"> <a href="grid.html"> <span>Computer</span> </a>
                          <ul class="level1">
                            <li class="level2 nav-3-5-17 first"> <a href="grid.html"> <span>External Hard Disks</span> </a> </li>
                            <li class="level2 nav-3-5-18"> <a href="grid.html"> <span>Pendrives</span> </a> </li>
                            <li class="level2 nav-3-5-19"> <a href="grid.html"> <span>Headphones</span> </a> </li>
                            <li class="level2 nav-3-5-20 last"> <a href="grid.html"> <span>PC Components</span> </a> </li>
                          </ul>
                        </li>
                        <li class="level1 nav-3-6 last parent"> <a href="grid.html"> <span>Appliances </span> </a>
                          <ul class="level1">
                            <li class="level2 nav-3-6-21 first"> <a href="grid.html"> <span>Vacuum Cleaners</span> </a> </li>
                            <li class="level2 nav-3-6-22"> <a href="grid.html"> <span>Indoor Lighting</span> </a> </li>
                            <li class="level2 nav-3-6-23"> <a href="grid.html"> <span>Kitchen Tools</span> </a> </li>
                            <li class="level2 nav-3-6-24 last"> <a href="grid.html"> <span>Water Purifiers</span> </a> </li>
                          </ul>
                        </li>
                      </ul>
                    </li>
                    <li class="level0 nav-4 level-top parent"> <a href="grid.html" class="level-top"> <span>Furniture</span> </a>
                      <ul class="level0">
                        <li class="level1 nav-4-1 first parent"> <a href="grid.html"> <span>Living Room</span> </a>
                          <ul class="level1">
                            <li class="level2 nav-4-1-1 first"> <a href="grid.html"> <span>Racks &amp; Cabinets</span> </a> </li>
                            <li class="level2 nav-4-1-2"> <a href="grid.html"> <span>Sofas</span> </a> </li>
                            <li class="level2 nav-4-1-3"> <a href="grid.html"> <span>Chairs</span> </a> </li>
                            <li class="level2 nav-4-1-4 last"> <a href="grid.html"> <span>Tables</span> </a> </li>
                          </ul>
                        </li>
                        <li class="level1 nav-4-2 parent"> <a href="grid.html"> <span>Dining &amp; Bar</span> </a>
                          <ul class="level1">
                            <li class="level2 nav-4-2-5 first"> <a href="grid.html"> <span>Dining Table Sets</span> </a> </li>
                            <li class="level2 nav-4-2-6"> <a href="grid.html"> <span>Serving Trolleys</span> </a> </li>
                            <li class="level2 nav-4-2-7"> <a href="grid.html"> <span>Bar Counters</span> </a> </li>
                            <li class="level2 nav-4-2-8 last"> <a href="grid.html"> <span>Dining Cabinets</span> </a> </li>
                          </ul>
                        </li>
                        <li class="level1 nav-4-3 parent"> <a href="grid.html"> <span>Bedroom</span> </a>
                          <ul class="level1">
                            <li class="level2 nav-4-3-9 first"> <a href="grid.html"> <span>Beds</span> </a> </li>
                            <li class="level2 nav-4-3-10"> <a href="grid.html"> <span>Chest of Drawers</span> </a> </li>
                            <li class="level2 nav-4-3-11"> <a href="grid.html"> <span>Wardrobes &amp; Almirahs</span> </a> </li>
                            <li class="level2 nav-4-3-12 last"> <a href="grid.html"> <span>Nightstands</span> </a> </li>
                          </ul>
                        </li>
                        <li class="level1 nav-4-4 last parent"> <a href="grid.html"> <span>Kitchen</span> </a>
                          <ul class="level1">
                            <li class="level2 nav-4-4-13 first"> <a href="grid.html"> <span>Kitchen Racks</span> </a> </li>
                            <li class="level2 nav-4-4-14"> <a href="grid.html"> <span>Kitchen Fittings</span> </a> </li>
                            <li class="level2 nav-4-4-15"> <a href="grid.html"> <span>Wall Units</span> </a> </li>
                            <li class="level2 nav-4-4-16 last"> <a href="grid.html"> <span>Benches &amp; Stools</span> </a> </li>
                          </ul>
                        </li>
                      </ul>
                    </li>
                    <li class="level0 nav-5 level-top last"> <a href="grid.html" class="level-top"> <span>Fashion</span> </a> </li>
                    <li class="level0 nav-6 level-top first parent"> <a class="level-top" href="#"> <span>Pages</span> </a>
                      <ul class="level0">
                        <li class="level1 first"><a href="grid.html"><span>Grid</span></a></li>
                        <li class="level1 nav-10-2"> <a href="list.html"> <span>List</span> </a> </li>
                        <li class="level1 nav-10-3"> <a href="product_detail.html"> <span>Product Detail</span> </a> </li>
                        <li class="level1 nav-10-4"> <a href="shopping_cart.html"> <span>Shopping Cart</span> </a> </li>
                        <li class="level1 first"><a href="checkout.html"><span>Checkout</span></a>
                          <ul class="level2">
                            <li class="level2 nav-2-1-1 first"><a href="checkout_method.html"><span>Checkout Method</span></a></li>
                            <li class="level2 nav-2-1-5 last"><a href="checkout_billing_info.html"><span>Checkout Billing Info</span></a></li>
                          </ul>
                        </li>
                        <li class="level1 nav-10-4"> <a href="wishlist.html"> <span>Wishlist</span> </a> </li>
                        <li class="level1"> <a href="dashboard.html"> <span>Dashboard</span> </a> </li>
                        <li class="level1"> <a href="multiple_addresses.html"> <span>Multiple Addresses</span> </a> </li>
                        <li class="level1"> <a href="about_us.html"> <span>About Us</span> </a> </li>
                        <li class="level1"><a href="compare.html"><span>Compare</span></a> </li>
                        <li class="level1"><a href="delivery.html"><span>Delivery</span></a> </li>
                        <li class="level1"><a href="faq.html"><span>FAQ</span></a> </li>
                        <li class="level1"><a href="quick_view.html"><span>Quick View</span></a> </li>
                        <li class="level1"><a href="newsletter.html"><span>Newsletter</span></a> </li>
                        <li class="level1"><a href="contact_us.html"><span>Contact Us</span></a> </li>
                        <li class="level1 first"><a href="blog.html"><span>Blog</span></a>
                           <ul class="level2">
                            <li class="level2 nav-2-1-1 first"><a href="blog_detail.html"><span>Blog Detail</span></a></li>
                          </ul>
                        </li> 
                        <li class="level1"><a href="404error.html"><span>404 Error Page</span></a> </li>
                      </ul>
                    </li>
                  </ul>
                </li>
              </ul>
            </li>
          </ul>
          <!--navmenu-->
        </div>
        <!--End mobile-menu -->
        <ul id="nav" class="hidden-xs">
          <li id="nav-home" class="level0 parent drop-menu active"><a href="index.jsp"><span>Home</span> </a>

          </li>
          
       <%
                ResultSet type_rs = sqltool.get_all_type();
                while(type_rs.next()){
                out.println("<li class=\"level0 nav-8 level-top\"> <a href=\"grid.jsp?type="+type_rs.getInt("typeID")+"\" class=\"level-top\"> <span>"+type_rs.getString("commodityTypeName")+"</span> </a> </li>");
                }
        
        %> 
          
        </ul>
        <div id="form-search" class="search-bar">
          <form id="search_mini_form" action="search_grid.jsp" method="get">
            <input class="search-bar-input" placeholder="Search entire store here..." type="text" value="" name="key" id="search">
            <input class="search-bar-submit" type="submit" value="">
            <span class="search-icon"><img src="images/search-icon.png" alt="search-icon"></span>
          </form>
        </div>
      </div>
    </div>
  </nav>
  <!-- end nav -->
  <!-- Slider -->
  <div class="slider-section">
    <div class="container">
      <div class="row">
        <aside class="cat-block pro-block col-xs-12 col-sm-12 col-md-5">
          <div class="pro1-block">
            <ul class="top-cat-box">
              <li>
                <div> <img  alt="women image" src="images/women-img.png"> </div>
                <h2>Women</h2>
                <p>Lorem ipsum dolor sit amet, consectetur. </p>
                <a href="#">Buy Now</a> </li>
              <li>
                <div> <img  alt="men image" src="images/men-img.png"> </div>
                <h2>Men</h2>
                <p>Consectetur adipiscing elit. </p>
                <a href="#">Buy Now</a> </li>
              <li>
                <div> <img  alt="electronics image" src="images/electronics-img.png"> </div>
                <h2>Electronics</h2>
                <p>Voluptatem accusantium doloremque</p>
                <a href="#">Buy Now</a> </li>
              <li>
                <div> <img  alt="furniture image" src="images/furniture-img.png"> </div>
                <h2>Furniture</h2>
                <p>eaque ipsa quae ab illo inventore </p>
                <a href="#">Buy Now</a> </li>
            </ul>
          </div>
          <!-- //showcase-right -->
        </aside>
        <div class="slider-intro col-lg-7 col-sm-12 col-md-7">
          <div class="the-slideshow slideshow-wrapper">
            <ul style="overflow: hidden;" class="slideshow">
              <li class="slide">
                <p><a href="#"> <img src="images/banner-img.jpg" alt="banner-img"></a></p>
                <div class="caption light1 top-right">
                  <div class="caption-inner">
                    <p class="heading">Women Collection 2014</p>
                    <p class="heading1">Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>
                    <p class="intro-btn"><a  href="#" title="Click to see all features">Shop Now</a> </p>
                  </div>
                </div>
              </li>
              <li class="slide">
                <p><a href="#"> <img src="images/banner-img.jpg" alt="banner-img"></a></p>
                <div class="caption light1 top-right">
                  <div class="caption-inner">
                    <h2 class="heading">You like this theme?</h2>
                    <p class="heading1">Pellentesque habitant morbi tristique senectus </p>
                    <p class="intro-btn"><a  href="#" title="Click to see all features">Buy Now</a> </p>
                  </div>
                </div>
              </li>
              <li class="slide">
                <p><a title="#" href="#"> <img src="images/banner-img.jpg" alt="banner-img"> </a></p>
                <div class="caption light1 top-right">
                  <div class="caption-inner">
                    <p class="heading">Responsive Layout</p>
                    <p class="intro-btn"><a  href="#" title="Click to see all features">Buy Now</a> </p>
                  </div>
                </div>
              </li>
            </ul>
            <a href="#" id="home-slides-prev" class="backward browse-button">previous</a> <a href="#" id="home-slides-next" class="forward browse-button">next</a>
            <div id="home-slides-pager" class="tab-pager tab-pager-img tab-pager-ring-lgray"></div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- end Slider -->
  <!-- offer banner section -->
  <div class="offer-banner-section">
    <div class="container">
      <div class="row">
        <div class="newsletter-wrap">
          <div class="newsletter">
            <form action="#" method="post" id="newsletter-validate-detail">
              <div>
                <h4><span>Amaze newsletter</span></h4>
                <input type="text" name="email" id="newsletter1" title="Sign up for our newsletter" class="input-text required-entry validate-email" placeholder="Enter your email address">
                <button type="submit" title="Subscribe" class="subscribe"><span>Subscribe</span></button>
              </div>
            </form>
          </div>
        </div>
        <%
            type_rs = sqltool.get_all_type();
            int i=0;
            while(type_rs.next()){
                out.println("<div class=\"col-lg-3 col-sm-3 col-xs-12\"><div class=\"col\"><img style=\"height:200px\"  src=\""+type_rs.getString("typepicture")+"\" alt=\"offer banner\"></div></div>");
                if(i++==3)
                    break;
            }
        
        %>
        <!--
        <div class="col-lg-3 col-sm-3 col-xs-12">
          <div class="col"><img src="images/offer-banner1.png" alt="offer banner"></div>
        </div>
        <div class="col-lg-3 col-sm-3 col-xs-12">
          <div class="col"><img src="images/offer-banner1.png" alt="offer banner"></div>
        </div>
        <div class="col-lg-3 col-sm-3 col-xs-12">
          <div class="col"><img src="images/offer-banner1.png" alt="offer banner"></div>
        </div>
        <div class="col-lg-3 col-sm-3 col-xs-12 last">
          <div class="col"><img src="images/offer-banner1.png" alt="offer banner"></div>
        </div>
        -->
        
      </div>
    </div>
  </div>
  <!-- end banner section -->
  <div class="service-section">
    <div class="container">
      <div class="row">
        <div id="store-messages">
          <div class="col-md-4 col-xs-12 col-sm-4"><i class="icon-refresh">&nbsp;</i>
            <div class="message"> <span><strong>Return &amp; Exchange</strong> in 3 working days </span>Lorem ipsum dolor sit amet, consectetur adipiscing. </div>
          </div>
          <div class="col-md-4 col-xs-12 col-sm-4"><i class="icon-truck">&nbsp;</i>
            <div class="message"><span><strong>Free Shipping</strong> order over $99</span>Lorem ipsum dolor sit amet, consectetur adipiscing. </div>
          </div>
          <div class="col-md-4 col-xs-12 col-sm-4"><i class="icon-discount">&nbsp;</i>
            <div class="message"><span><strong>50% Off</strong> on all products</span>Lorem ipsum dolor sit amet, consectetur adipiscing. </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- main container -->
  <section class="main-container col1-layout home-content-container">
    <div class="container">
      <div class="std">
        <div class="best-seller-pro wow bounceInUp animated">
          <div class="slider-items-products">
            <div class="new_title center">
              <h2>Best Seller</h2>
            </div>
            <div id="best-seller-slider" class="product-flexslider hidden-buttons">
              <div class="slider-items slider-width-col4">

            <%
                List<Integer> commodity=sqltool.get_top_item();
                String[] item_detial;
                for (i=0; i<Math.min(commodity.size(),8); i++) {
                    item_detial=sqltool.getitem(commodity.get(i)).split("&");
                    out.println("<div class=\"item\">  <div class=\"item-inner\">    <div class=\"product-block\">      <div class=\"product-image\"> <a href=\"item.jsp?id="+item_detial[0]+"\">        <figure class=\"product-display\">          <div class=\"sale-label sale-top-left\">Sale</div>          <img style=\"height:150px;width:auto;margin:0 auto\" src=\""+item_detial[4]+"\" class=\"lazyOwl product-mainpic\" alt=\"product-image\" style=\"display: block;\"> <img class=\"product-secondpic\" alt=\"product-image\" src=\""+item_detial[4]+"\"> </figure>        </a> </div>      <div class=\"product-meta\">        <div class=\"product-action\"> <a class=\"addcart\" href=\"javascript:addcart_id("+item_detial[0]+");\"> <i class=\"icon-shopping-cart\">&nbsp;</i> Add to cart </a> <a class=\"wishlist\" href=\"#\"> <i class=\"icon-heart\">&nbsp;</i> </a> <a href=\"quick.jsp?id="+item_detial[0]+"\" class=\"quickview\"> <i class=\"icon-zoom\">&nbsp;</i> </a> </div>      </div>    </div>    <div class=\"item-info\">      <div class=\"info-inner\">        <div class=\"item-title\"> <a href=\"product_detail.html\" title=\"Retis lapen casen\"> "+item_detial[1]+"</a> </div>        <div class=\"item-content\">          <div class=\"item-price\">            <div class=\"price-box\"> <span class=\"regular-price\"> <span class=\"price\">$"+item_detial[2]+"</span> </span> </div>          </div>          <div class=\"rating\">            <div class=\"ratings\">              <div class=\"rating-box\"><div class=\"rating\" style=\"width:80%\"></div>              </div>              <p class=\"rating-links\"> <a href=\"#\">1 Review(s)</a> <span class=\"separator\">|</span> <a href=\"#\">Add Review</a> </p>            </div>          </div>        </div>      </div>    </div>  </div></div>");
                    }


            %>


              <!--
                <div class="item">
                  <div class="item-inner">
                    <div class="product-block">
                      <div class="product-image"> <a href="product_detail.html">
                        <figure class="product-display">
                          <div class="sale-label sale-top-left">Sale</div>
                          <img src="products-images/product1.jpg" class="lazyOwl product-mainpic" alt="product-image" style="display: block;"> <img class="product-secondpic" alt="product-image" src="products-images/product1.jpg"> </figure>
                        </a> </div>
                      <div class="product-meta">
                        <div class="product-action"> <a class="addcart" href="shopping_cart.html"> <i class="icon-shopping-cart">&nbsp;</i> Add to cart </a> <a class="wishlist" href="wishlist.html"> <i class="icon-heart">&nbsp;</i> </a> <a href="quick_view.html" class="quickview"> <i class="icon-zoom">&nbsp;</i> </a> </div>
                      </div>
                    </div>
                    <div class="item-info">
                      <div class="info-inner">
                        <div class="item-title"> <a href="product_detail.html" title="Retis lapen casen"> Sample Product</a> </div>
                        <div class="item-content">
                          <div class="item-price">
                            <div class="price-box"> <span class="regular-price"> <span class="price">$125.00</span> </span> </div>
                          </div>
                          <div class="rating">
                            <div class="ratings">
                              <div class="rating-box">
                                <div class="rating" style="width:80%"></div>
                              </div>
                              <p class="rating-links"> <a href="#">1 Review(s)</a> <span class="separator">|</span> <a href="#">Add Review</a> </p>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                -->
                
                
              </div>
            </div>
          </div>
        </div>
        <!-- Featured Slider -->
        <div class="featured-pro">
          <div class="slider-items-products">
            <div class="title col-lg-6">
              <div class="new_title center">
                <h2><span>Lastest Products</span></h2>
              </div>
              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec pharetra tristique eros dignissim venenatis. Nam et dolor id arcu efficitur tincidunt quis non nisi. Duis commodo pellentesque quam, id mollis ligula dictum id. Morbi cursus consectetur magna a egestas. Sed eu sagittis leo. Mauris euismod dapibus nisl, at euismod nunc commodo vel. Nulla semper non nisi in placerat. Aenean at nisl eu odio ullamcorper varius non ac ante. Quisque dictum, felis lobortis faucibus ornare, enim mi mollis ex, ac vestibulum neque nibh at nisi. </p>
              <a title="Subscribe" class="view-all" href="grid.jsp"><span>View All Products</span></a> </div>
            <div id="featured-slider" class="product-flexslider hidden-buttons col-lg-6">
              <div class="slider-items slider-width-col4">
              
             <%
                List<Integer> commodity_new=sqltool.get_new_item();
                for (i=0; i<Math.min(commodity_new.size(),8); i++) {
                    item_detial=sqltool.getitem(commodity_new.get(i)).split("&");
                    double real_price = Double.parseDouble(item_detial[2]) * Double.parseDouble(item_detial[3]);
                    out.println("<div class=\"item\">  <div class=\"item-inner\">    <div class=\"item-img\">      <div class=\"product-block\"><div class=\"product-image\"> <a href=\"item.jsp?id="+item_detial[0]+"\">  <figure class=\"product-display\">    <div class=\"new-label new-top-left\">New</div>    <img style=\"height:150px;width:auto;margin:0 auto\" src=\""+item_detial[4]+"\" class=\"lazyOwl product-mainpic\" alt=\"Product image\" style=\"display: block;\"> <img class=\"product-secondpic\" alt=\"Product image\" src=\""+item_detial[4]+"\"> </figure>  </a> </div><div class=\"product-meta\">  <div class=\"product-action\"> <a class=\"addcart\" href=\"javascript:addcart_id("+item_detial[0]+");\"> <i class=\"icon-shopping-cart\">&nbsp;</i> Add to cart </a> <a class=\"wishlist\" href=\"#\"> <i class=\"icon-heart\">&nbsp;</i> </a> <a href=\"quick.jsp?id="+item_detial[0]+"\" class=\"quickview\"> <i class=\"icon-zoom\">&nbsp;</i> </a> </div></div>      </div>    </div>    <div class=\"item-info\">      <div class=\"info-inner\"><div class=\"item-title\"> <a href=\"product_detail.html\" title=\"Ut tincidunt tortor\"> "+item_detial[1]+"</a> </div><div class=\"item-content\">  <div class=\"item-price\">    <div class=\"price-box\">      <p class=\"old-price\"> <span class=\"price-label\">Regular Price:</span> <span class=\"price\"  > $"+item_detial[2]+" </span> </p>      <p class=\"special-price\"> <span class=\"price-label\">Special Price</span> <span class=\"price\"  > $"+real_price+" </span> </p>    </div>  </div>  <div class=\"rating\">    <div class=\"ratings\">      <div class=\"rating-box\"><div class=\"rating\" style=\"width:50%\"></div>      </div>      <p class=\"rating-links\"> <a href=\"#\">1 Review(s)</a> <span class=\"separator\">|</span> <a href=\"#\">Add Review</a> </p>    </div>  </div></div>      </div>    </div>  </div></div>");
               }


            %>

              </div>
            </div>
          </div>
        </div>
        <!-- End Featured Slider -->
      </div>
    </div>
  </section>
  <!-- End main container -->
  <!-- Latest Blog 
  <section class="latest-blog container">
    <div class="blog_post">
      <div class="blog-title">
        <h2><span>Latest Blog</span></h2>
      </div>
      <div class="col-xs-12 col-sm-4">
        <div class="blog-img"> <img src="images/blog-img1.jpg" alt="blog image">
          <div class="mask"> <a class="info" href="blog_detail.html">Read More</a> </div>
        </div>
        <h2><a href="blog_detail.html">Pellentesque habitant morbi</a> </h2>
        <div class="post-date"><i class="icon-calendar"></i> Apr 10, 2014</div>
        <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce sit  ... </p>
      </div>
      <div class="col-xs-12 col-sm-4">
        <div class="blog-img"> <img src="images/blog-img1.jpg" alt="blog image">
          <div class="mask"> <a class="info" href="blog_detail.html">Read More</a> </div>
        </div>
        <h2><a href="blog_detail.html">Pellentesque habitant morbi</a> </h2>
        <div class="post-date"><i class="icon-calendar"></i> Apr 10, 2014</div>
        <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce sit  ... </p>
      </div>
      <div class="col-xs-12 col-sm-4">
        <div class="blog-img"> <img src="images/blog-img1.jpg" alt="blog image">
          <div class="mask"> <a class="info" href="blog_detail.html">Read More</a> </div>
        </div>
        <h2><a href="blog_detail.html">Pellentesque habitant morbi</a> </h2>
        <div class="post-date"><i class="icon-calendar"></i> Apr 10, 2014</div>
        <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce sit  ... </p>
      </div>
    </div>
  </section>
   End Latest Blog -->
  <!-- Footer -->
  <footer>
    <div class="container">
      <div class="inner">
        <div class="brand-logo">
          <div class="slider-items-products">
            <div id="brand-logo-slider" class="product-flexslider hidden-buttons">
              <div class="slider-items slider-width-col6">
                <!-- Item -->
                <div class="item"> <a href="#x"><img src="images/b-logo1.png" alt="Image"></a> </div>
                <!-- End Item -->
                <!-- Item -->
                <div class="item"> <a href="#x"><img src="images/b-logo2.png" alt="Image"></a> </div>
                <!-- End Item -->
                <!-- Item -->
                <div class="item"> <a href="#x"><img src="images/b-logo3.png" alt="Image"></a> </div>
                <!-- End Item -->
                <!-- Item -->
                <div class="item"> <a href="#x"><img src="images/b-logo4.png" alt="Image"></a> </div>
                <!-- End Item -->
                <!-- Item -->
                <div class="item"> <a href="#x"><img src="images/b-logo5.png" alt="Image"></a> </div>
                <!-- End Item -->
                <!-- Item -->
                <div class="item"> <a href="#x"><img src="images/b-logo6.png" alt="Image"></a> </div>
                <!-- End Item -->
                <!-- Item -->
                <div class="item"> <a href="#x"><img src="images/b-logo1.png" alt="Image"></a> </div>
                <!-- End Item -->
                <!-- Item -->
                <div class="item"> <a href="#x"><img src="images/b-logo4.png" alt="Image"></a> </div>
                <!-- End Item -->
              </div>
            </div>
          </div>
        </div>
        <div class="footer-middle">
          <div class="col-md-3 col-sm-12 col-xs-12">
            <div class="footer-column-1">
              <div class="footer-logo"><a href="index.jsp" title="Logo"><img src="images/footer-logo.png" alt="logo" ></a></div>
              <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
              <div class="social">
                <ul class="link">
                  <li class="fb"><a href="#"></a></li>
                  <li class="tw"><a href="#"></a></li>
                  <li class="googleplus"><a href="#"></a></li>
                  <li class="rss"><a href="#"></a></li>
                  <!-- <li class="pintrest"><a href="#"></a></li>-->
                  <li class="linkedin"><a href="#"></a></li>
                  <li class="youtube"><a href="#"></a></li>
                </ul>
              </div>
            </div>
          </div>
          <div class="col-md-2 col-sm-6 col-xs-12">
            <h4 class="green">Shopping Guide</h4>
            <ul class="links">
              <li class="first"><a href="about_us.html" title="How to buy">About us</a></li>
              <li><a href="faq.html" title="FAQs">FAQs</a></li>
              <li><a href="#" title="Payment">Payment</a></li>
              <li><a href="#" title="Shipment&lt;/a&gt;">Shipment</a></li>
              <li><a href="#" title="Where is my order?">Where is my order?</a></li>
              <li class="last"><a href="#" title="Return policy">Return policy</a></li>
            </ul>
          </div>
          <div class="col-md-2 col-sm-6 col-xs-12">
            <h4 class="yellow">Style Advisor</h4>
            <ul class="links">
              <li class="first"><a title="Your Account" href="login.jsp">Your Account</a></li>
              <li><a title="Information" href="#">Information</a></li>
              <li><a title="Addresses" href="#">Addresses</a></li>
              <li><a title="Addresses" href="#">Discount</a></li>
              <li><a title="Orders History" href="#">Orders History</a></li>
              <li class="last"><a title=" Additional Information" href="#">Additional Information</a></li>
            </ul>
          </div>
          <div class="col-md-2 col-sm-6 col-xs-12">
            <h4 class="orange">Information</h4>
            <ul class="links">
              <li class="first"><a href="sitemap.html" title="Site Map">Site Map</a></li>
              <li><a href="#/" title="Search Terms">Search Terms</a></li>
              <li><a href="#" title="Advanced Search">Advanced Search</a></li>
              <li><a href="contact_us.html" title="Contact Us">Contact Us</a></li>
              <li><a href="#" title="Suppliers">Suppliers</a></li>
              <li class=" last"><a href="#" title="Our stores" class="link-rss">Our stores</a></li>
            </ul>
          </div>
          <div class="col-md-3 col-sm-6 col-xs-12">
            <h4 class="blue">Contact Us</h4>
            <div class="contacts-info">
              <address>
              <i class="add-icon">&nbsp;</i>123 Main Street, Anytown, <br>
              &nbsp;CA 12345  USA
              </address>
              <div class="phone-footer"><i class="phone-icon">&nbsp;</i> +1 800 123 1234</div>
              <div class="email-footer"><i class="email-icon">&nbsp;</i> <a href="mailto:support@magikcommerce.com">support@magikcommerce.com</a>
            </div>
          </div>
        </div>
        <div class="footer-bottom">
          <div class="col-sm-3 col-xs-12 coppyright"> &copy; 2015 Magikcommerce. All Rights Reserved.</div>
          <div class="col-sm-9 col-xs-12 company-links">
            <ul class="links">
              <li><a href="#" title="Magento Themes">Magento Themes</a></li>
              <li><a href="#" title="Premium Themes">Premium Themes</a></li>
              <li><a href="#" title="Responsive Themes">Responsive Themes</a></li>
              <li class="last"><a href="#" title="Magento Extensions">Magento Extensions</a></li>
            </ul>
          </div>
        </div>
      </div>
    </div></div>
  </footer>
  <!-- End Footer -->
</div>
<div class="help_slider">
  <div class="text alignleft">Need Help?</div>
  <div class="icons"> <a class="show_hide" id="questionbox-side-phonebutton" href="javascript:void(0)"><i class="icon-phones">&nbsp;</i></a> <a class="show_hide1" id="questionbox-side-emailbutton" href="javascript:void(0)"><i class="icon-email">&nbsp;</i></a> </div>
</div>
<div id="hideShow" class="right-side-content" style="display: none;">
  <!--Contact Static Block -->
  <div class="slider-phone active">
    <h2 class="">Talk To Us</h2>
    <h3 class="">Available 24/7</h3>
    <p class="textcenter"> Want to speak to someone? We're here 24/7 to answer any questions. Just call!<br>
      <br>
      <span class="phone-number"> +1 800 123 1234</span></p>
    <a id="hideDiv" class="slider-close" href="javascript:void(0)"></a> </div>
  <div class="slider-email hidden">
    <h2 class="">Let us know how we can help you.</h2>
    <form action="#" enctype="application/x-www-form-urlencoded" method="post" id="form-contact-help_slider">
      <div class="column sixty">
        <div class="">
          <ul>
            <li>
              <label>First Name</label>
              <input type="text" name="FirstName" class="required-entry">
              <div class="clearfix"></div>
            </li>
            <li>
              <label>Last Name</label>
              <input type="text" name="LastName" class="required-entry">
              <div class="clearfix"></div>
            </li>
            <li>
              <label>Email Address</label>
              <input type="email" name="Email" class="required-entry">
              <div class="clearfix"></div>
            </li>
            <li>
              <label>Phone Number</label>
              <input type="text" name="Phone">
              <div class="clearfix"></div>
            </li>
          </ul>
        </div>
      </div>
      <div class="column fourty last">
        <div class="padding">
          <textarea name="Contact_Form_Message__c" class="required-entry">How can we help you?</textarea>
          <div class="textright">
            <button class="button btn-sent" title="Add to Cart" type="button"><span>Send</span></button>
          </div>
        </div>
      </div>
    </form>
    <div class="clearfix"></div>
    <a class="slider-close" href="#"></a></div>
</div>
<div id="hideShow1" style="display: none;">
  <div class="right-side-content hidden1">
    <div class="slider-email active">
      <div id="messages_product_view"></div>
      <div id="formSuccess" style="display:none;">Your inquiry was submitted and will be responded to as soon as possible. Thank you for contacting us.</div>
      <form id="contactForm1" method="post">
        <div class="column sixty">
          <h2>TALK TO US</h2>
          <ul>
            <li>
              <label>Name<em class="required">*</em></label>
              <input name="name" id="name" title="Name" value="" class="input-text required-entry" type="text">
            </li>
            <li>
              <label>Email<em class="required">*</em></label>
              <input name="email" id="email" title="Email" value="" class="input-text required-entry validate-email" type="text">
            </li>
            <li>
              <label>Telephone</label>
              <input name="telephone" id="telephone" title="Telephone" value="" class="input-text" type="text">
            </li>
          </ul>
		  <p class="required">* Required Fields</p>
        </div>
        <!--column sixty-->
        <div class="column fourty last">
          <div class="padding">
            <label>Comment<em class="required">*</em></label>
            <textarea name="comment" title="Comment" class="required-entry input-text" cols="5" rows="3"></textarea>
            <div class="textright">
              <input type="text" name="hideit" value="" style="display:none !important;">
              <button type="submit" title="Submit" class="button btn-sent"><span>Submit</span></button>
              <img src="images/mgkloading1.gif" alt="loader" id="loader" style="display:none;"> </div>
            <!--textright-->
          </div>
          <!--padding-->
        </div>
        <!--column fourty last-->
      </form>
      <a href="javascript:void(0)" id="hideDiv1" class="slider-close"></a> </div>
    <!--slider-email active-->
  </div>
  <!--right-side-content hidden1-->
</div>
<!-- JavaScript -->
<script type="text/javascript" src="js/cart.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/slider.js"></script>
<script type="text/javascript" src="js/owl.carousel.min.js"></script>
<script type="text/javascript">
    //<![CDATA[
	jQuery(function() {
		jQuery(".slideshow").cycle({
			fx: 'scrollHorz', easing: 'easeInOutCubic', timeout: 10000, speedOut: 800, speedIn: 800, sync: 1, pause: 1, fit: 0, 			pager: '#home-slides-pager',
			prev: '#home-slides-prev',
			next: '#home-slides-next'
		});
	});
    //]]>
    </script>
<script>
			new UISearch( document.getElementById( 'form-search' ) );
		</script>
</body>
</html>
