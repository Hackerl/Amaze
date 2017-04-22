<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>用户注册</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	  <link rel="stylesheet" type="text/css" href="styles.css">
		-->

	</head>

	<body>
		<% request.setCharacterEncoding("UTF-8");%> 
		
	    <%  
		String name=request.getParameter("name");
		
	    if( name == null || name.equals("")) {   //信息不能为空，前端同时用js检测
		    //out.println("信息不能为空!!");
		    response.sendRedirect("Regist.jsp");             //重定向到注册
            }

        /* 过滤特殊字符串 检测各个字段长度 防止超出列数据长度限制 检测密码强弱 禁止弱密码 检测各个字段是否合法 比如类型是否为1、2 */

        // 数据库添加   sqltool.getitem(name);
        
        out.println("信息");
        %> 

	</body>
</html>
