<%@ page language="java"  import="java.util.*"  pageEncoding="UTF-8"%>
<%-- <%@include file="Count.jsp" %> --%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->


    <meta charset="utf-8">
	<title>添加物品种类</title>
	<style>
	 table{
	 	align:center;
	 }
	 td{
	 	text-align:center
	 }
	</style>
</head>
<body>
    <!-- 只有卖家可以添加 -->
   <center>
   <form method="post" action="addittype1.jsp">
     <table border="1" cellpadding="1" cellspacing="0">
       <th colspan="6" text-align:center>物品种类</th>
       <tr>
        <td>Username:</td>
        <td><input type="text" name="type"></td>
       <tr >
       <tr>
        <td>Picture:</td>
        <td><input type="text" name="picture"></td>
       <tr >
        <td colspan="6"><input type="submit" value="提交" width="200px"></td>
       </tr>
     </table>
   </form>
   </center>
</body>
</html>
