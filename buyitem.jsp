<%@ page language="java" import="java.util.*,com.mysqltool.*,java.sql.SQLException" pageEncoding="UTF-8"%>


<% request.setCharacterEncoding("UTF-8");%> 
<%
                              if(session.getAttribute("username")==null){
                                    response.sendRedirect("login.html");
                                    return;
                              }
                                String username = session.getAttribute("username").toString();
                                String user_cart=username+"_cart";
                                String user_number=username+"_number"; 
                                
                                if(application.getAttribute(user_cart) != null && application.getAttribute(user_number) != null){

                                 
                                
                                List<String> cart = (List<String>)application.getAttribute(user_cart);
                                HashMap<String , Integer> number_map = (HashMap<String , Integer>)application.getAttribute(user_number);
                                
                                if(cart.size()==0){
                                    out.println("EMPTY CART !");
                                    return;
                                }
                                String item_result="";
                                String[] item_detial;
                                String item_id;
                                int item_number;
                                String buy_item_data="";
                                double all_money=0;
                                for (int i=0; i<cart.size(); i++) {
                                    item_id = cart.get(i);
                                    item_result = sqltool.getitem(Integer.parseInt(item_id));
                                    item_detial = item_result.split("&");
                                    item_number = number_map.get(item_id);
                                    
                                    double real_price = Double.parseDouble(item_detial[2]) * Double.parseDouble(item_detial[3]);
                                    double the_item_money= real_price * item_number;
                                    all_money += the_item_money;
                                    
                                    buy_item_data=item_detial[2]+"&"+item_detial[3]+"&"+Double.toString(the_item_money); //单价 折扣 总价
                                    
                                    sqltool.addBuyitem(Integer.parseInt(item_id),item_number,username,buy_item_data);
                                }
                                cart.clear();
                                out.println("SUECCESS !");
                                }
%> 

