<%@ page language="java" import="java.util.*,com.mysqltool.*,java.sql.SQLException" pageEncoding="UTF-8"%>

		<% request.setCharacterEncoding("UTF-8");%> 
		
	    <%  
		String name=request.getParameter("username");
		String pwd=request.getParameter("password");
		
	    if( name == null || name.equals("") || pwd == null || pwd.equals("") ) {   //信息不能为空，前端同时用js检测
		    //out.println("信息不能为空!!");
		    response.sendRedirect("login.html");             //重定向到注册
            }

        /* 过滤特殊字符串 比如单引号 防止sql注入 */

        // 数据库验证   int  asd =sqltool.auth(name,pwd);   //失败返回-1 1代表买家 2代表卖家 3代表管理员
        int success = -1;
        try {
            success = sqltool.auth(name,pwd);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(success != -1){
            out.println("欢迎归来:"+name);
            session.setAttribute("username", name);
            session.setAttribute("powerid", success);
            response.sendRedirect("index.jsp");
            //out.println(session.getAttribute("username"));
            }
        else
            out.println("登录失败");
        %> 
