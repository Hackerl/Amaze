<%@ page language="java" import="java.util.*,com.mysqltool.*,java.sql.SQLException" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>添加物品</title>

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
		
		// 检查session权限 是否是卖家 否则重定向到登录界面
	    <%
	    if(session.getAttribute("username")==null || (int)session.getAttribute("powerid") ==1){
	        out.println("没有权限");
		    return; 
	    }
	    
		String name=request.getParameter("name");
		int type = Integer.parseInt(request.getParameter("type"));
		double price = Double.parseDouble(request.getParameter("price"));
		double agio = Double.parseDouble(request.getParameter("agio"));
		String picture=request.getParameter("picture");
		
	    if( name == null || name.equals("") ) {   //信息不能为空，前端同时用js检测
		    //out.println("信息不能为空!!");
		    response.sendRedirect("addit.jsp");
		    return;        //重定向到注册
            }

        /* 过滤特殊字符串 检测各个字段长度 防止超出列数据长度限制 检测密码强弱 禁止弱密码 检测各个字段是否合法 比如类型是否为1、2 */

        int success = -1;
        try {
            success = sqltool.addit(name,type,price,agio,picture);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(success == 1)
            out.println("添加成功");
        else
            out.println("添加失败");

        %> 

	</body>
</html>
