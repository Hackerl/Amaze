<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>查询</title>

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
		String name=request.getParameter("username");


        /* 过滤特殊字符串 检测各个字段长度 防止超出列数据长度限制 检测密码强弱 禁止弱密码 检测各个字段是否合法 比如类型是否为1、2 */

        // 数据库查询信息   sqltool.getuser(username);  查询用户的交易信息   sqltool.getBuyitem(username);
        
        out.println(name);
        %> 

	</body>
</html>
