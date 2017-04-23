<%@ page language="java" import="java.util.*,com.mysqltool.*,java.sql.SQLException" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%> 
		
	    <%  
		String name = request.getParameter("username");
		String pwd = request.getParameter("password");
		int type = Integer.parseInt(request.getParameter("type"));
	    if( name == null || name.equals("") || pwd == null || pwd.equals("") || (type != 1 && type != 2 )) {   //信息不能为空，前端同时用js检测
		    out.println("信息不能为空!!");
		    response.sendRedirect("login.jsp"); 
		    return;            //重定向到注册
            }

        /* 过滤特殊字符串 检测各个字段长度 防止超出列数据长度限制 检测密码强弱 禁止弱密码 检测各个字段是否合法 比如类型是否为1、2 */
        int success = -1;
        try {
            success = sqltool.adduser(name,pwd,type);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(success == 1)
            out.println("注册成功");
        else
            out.println("注册失败");
        %> 
