<%@ page language="java"  import="java.util.*,java.sql.ResultSet,com.mysqltool.*,java.sql.SQLException"  pageEncoding="UTF-8"%>
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

	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<title>添加物品</title>
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
   <center> <!-- 验证权限 只有卖家可以 -->
   <form method="post" action="addit1.jsp">
     <table border="1" cellpadding="1" cellspacing="0">
       <th colspan="6" text-align:center>物品</th>
       <tr>
        <td>物品名称:</td>
        <td><input type="text" name="name"></td>
		<td>物品价格:</td>
		<td><input type="text" name="price"></td>
		<td>物品折扣:</td>
		<td><input type="text" name="agio"></td>
		<td>物品图片:</td>
		<td><input type="text" name="picture"></td>
        <td>
        <% //从数据库中取出类别 做循环
        ResultSet rs = sqltool.get_all_type();
        while(rs.next())
            out.println("<input type=\"radio\" name=\"type\" id=\"man\" checked=\"checked\" value=\""+rs.getInt("typeID")+"\">"+rs.getString("commodityTypeName"));
        %>
        </td>

       <tr >
        <td colspan="6"><input type="submit" value="提交" width="200px"></td>
       </tr>
     </table>
   </form>
   </center>
</body>
</html>
