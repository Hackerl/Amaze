<%@ page language="java" import="java.util.*,com.mysqltool.*,java.sql.SQLException" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%> 
<%

    String id=request.getParameter("id");
    if(session.getAttribute("username")==null){
        response.sendRedirect("login.html");
        return;
        }
    String username = session.getAttribute("username").toString();
    String user_cart=username+"_cart";
    String user_number=username+"_number";
    if(application.getAttribute(user_cart) != null && application.getAttribute(user_number) != null){

        List<String> cart = (List<String>)application.getAttribute(user_cart);
        if(cart.indexOf(id) > -1)
            cart.remove(cart.indexOf(id));
        out.println("DEL SUCCESS !");
    }else
        out.println("EMPTY CART !");
    

%> 
