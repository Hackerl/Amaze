<%@ page language="java" import="java.util.*,com.mysqltool.*,java.sql.SQLException" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%> 
<%

    String id=request.getParameter("id");
    int num=Integer.parseInt(request.getParameter("num"));
    if(session.getAttribute("username")==null){
        out.println("LOGIN FIRST !");
        return;
        }

    String username = session.getAttribute("username").toString();
    
    String user_cart=username+"_cart";
    String user_number=username+"_number";              //application中的属性 根据username区分
    
    if(application.getAttribute(user_cart) == null){
        List<String> list = new ArrayList<String>();
        application.setAttribute(user_cart,list);
        }
    if(application.getAttribute(user_number) == null){
        HashMap<String , Integer> map = new HashMap<String , Integer>();
        application.setAttribute(user_number,map);
        }
    List<String> cart = (List<String>)application.getAttribute(user_cart);
    if(cart.indexOf(id) < 0)
        cart.add(id);
    HashMap<String , Integer> number_map = (HashMap<String , Integer>)application.getAttribute(user_number);
    number_map.put(id,num);
    out.println("ADD SUCCESS !");
%> 
