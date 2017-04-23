package com.mysqltool;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.security.MessageDigest;  
import java.security.NoSuchAlgorithmException;
import java.util.*;

public class sqltool {

    public static final String URL = "jdbc:mysql://localhost:3306/net_manager?useUnicode=true&characterEncoding=utf8";
    public static final String USER = "root";
    public static final String PASSWORD = "";
    private static Connection conn;
    private static Statement stmt;
    static{
        try {
            //1.加载驱动程序
            Class.forName("com.mysql.jdbc.Driver");
            //2. 获得数据库连接
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            stmt =  conn.createStatement();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) throws Exception {
        ResultSet rs = stmt.executeQuery("SELECT * FROM app");
        while(rs.next()){
            System.out.println(rs.getString("name")+" 年龄："+rs.getString("download"));
        }
    }
	
	public static int adduser(String username,String pwd,int type) throws Exception {
	    
		String sql = String.format("INSERT INTO user VALUES ('%s', '%s', %d)",username, CreateMD5.getMd5(pwd) , type);
        int row = stmt.executeUpdate(sql);
		return row;
    }
	
	public static ResultSet getuser(String username) throws Exception {
	    
		String sql = String.format("select * from user where username='%s'",username);
        ResultSet rs = stmt.executeQuery(sql);
		return rs;
	}
	
	public static int updateuser(String username,String pwd,int type) throws Exception {
	    
		String sql = String.format("UPDATE user SET pwd='%s',powerid=%d WHERE username='%s'",CreateMD5.getMd5(pwd), type, username);
        int row = stmt.executeUpdate(sql);
		return row;
	}
	
	public static int addittype(String type , String typepicture) throws Exception {
	    
		String sql = String.format("INSERT INTO typename(commodityTypeName,typepicture) VALUES ('%s','%s')", type ,typepicture);
        int row = stmt.executeUpdate(sql);
		return row;
	}
	
	public static ResultSet getBuyitem(String username) throws Exception {
	    
		String sql = String.format("select * from Buyitem where username='%s'", username);
        ResultSet rs = stmt.executeQuery(sql);
		return rs;
	}

	public static int addBuyitem(int buycommodityId,int number,String username,String data) throws Exception {
	    
		String sql = String.format("INSERT INTO Buyitem(buycommodityId,buyitunm,username,buyData,time) VALUES (%d,%d,'%s','%s',CURRENT_TIMESTAMP())", buycommodityId,number,username,data);
        int row = stmt.executeUpdate(sql);
		return row;
	}

	public static int addit(String name,int type,double price,double agio,String picture) throws Exception {
	    
		String sql = String.format("INSERT INTO commodity(commodityName,cType,price,agio,picture) VALUES ('%s',%d,%f,%f,'%s')", name,type,price,agio,picture);
        int row = stmt.executeUpdate(sql);
		return row;
	}
	
	public static String getitem(int id) throws Exception {
	    
		String sql = String.format("select * from commodity,typename where commodity.commodityId=%d AND commodity.cType=typename.typeID",id);
        ResultSet rs = stmt.executeQuery(sql);
        String result ="";
        if(rs.next()){
            result += rs.getString("commodityId")+"&"+rs.getString("commodityName")+"&"+rs.getString("price")+"&"+rs.getString("agio")+"&"+rs.getString("picture")+"&"+rs.getString("commodityTypeName")+"&"+rs.getString("typepicture")+"&"+rs.getString("cType");
            }
		return result;
	}
	
	public static ResultSet get_all_type() throws Exception {
	    
        ResultSet rs = stmt.executeQuery("select * from typename");
		return rs;
	}
	
	public static List<Integer> get_top_item() throws Exception {
	    
        ResultSet rs = stmt.executeQuery("select buycommodityId,sum(buyitunm) as all_number from Buyitem group by buycommodityId order by all_number DESC");
        List<Integer> list = new ArrayList<Integer>();
        while(rs.next())
            list.add(rs.getInt("buycommodityId"));
		return list;
	}
	
	public static List<Integer> get_Related(int id) throws Exception {
	    
	    String sql = String.format("select a.commodityId from commodity a,commodity b where a.cType=b.cType AND b.commodityId=%d order by a.commodityId DESC",id);
        ResultSet rs = stmt.executeQuery(sql);
        List<Integer> list = new ArrayList<Integer>();
        while(rs.next())
            list.add(rs.getInt("commodityId"));
		return list;
	}
	
	public static List<Integer> get_Upsell() throws Exception {
	    
        ResultSet rs = stmt.executeQuery("select commodityId from commodity order by agio ASC");
        List<Integer> list = new ArrayList<Integer>();
        while(rs.next())
            list.add(rs.getInt("commodityId"));
		return list;
	}
	
	
	public static List<Integer> get_new_item() throws Exception {
	    
        ResultSet rs = stmt.executeQuery("select commodityId from commodity order by commodityId DESC");
        List<Integer> list = new ArrayList<Integer>();
        while(rs.next())
            list.add(rs.getInt("commodityId"));
		return list;
	}
	
	public static List<Integer> get_type_new_item(int type) throws Exception {
	    String sql = String.format("select commodityId from commodity where cType=%d order by commodityId DESC",type);
        ResultSet rs = stmt.executeQuery(sql);
        List<Integer> list = new ArrayList<Integer>();
        while(rs.next())
            list.add(rs.getInt("commodityId"));
		return list;
	}
	
	public static List<Integer> get_type_top_item(int type) throws Exception {
	    String sql = String.format("select commodityId,sum(buyitunm) as all_number from Buyitem,commodity where commodity.cType=%d AND commodity.commodityId=Buyitem.buycommodityId group by buycommodityId order by all_number DESC",type);
        ResultSet rs = stmt.executeQuery(sql);
        List<Integer> list = new ArrayList<Integer>();
        while(rs.next())
            list.add(rs.getInt("commodityId"));
		return list;
	}
	
    public static List<Integer> search_keyword(String keyword) throws Exception {
	    String sql = String.format("select commodityId,sum(buyitunm) as all_number from Buyitem,commodity where commodity.commodityName LIKE '%%%s%%' AND commodity.commodityId=Buyitem.buycommodityId group by buycommodityId order by all_number DESC",keyword);
        ResultSet rs = stmt.executeQuery(sql);
        List<Integer> list = new ArrayList<Integer>();
        while(rs.next())
            list.add(rs.getInt("commodityId"));
		return list;
	}
	
	public static int updateitem(String name,int type,double price,double agio) throws Exception {
	    
		String sql = String.format("UPDATE user SET cType=%d,price=%f,agio=%f WHERE commodityName='%s'",type, price,agio, name);
        int row = stmt.executeUpdate(sql);
		return row;
	}
	
	public static int auth(String username,String pwd) throws Exception {
	    
		String sql = String.format("select * from user where username='%s'",username);
        ResultSet rs = stmt.executeQuery(sql);
        if(rs.next()){
            if( CreateMD5.getMd5(pwd).equals(rs.getString("pwd")) )
                return rs.getInt("powerid");
        }
		return -1;
	}
}

class CreateMD5 {  
	//静态方法，便于作为工具类  
	public static String getMd5(String plainText) {  
		try {  
			MessageDigest md = MessageDigest.getInstance("MD5");  
			md.update(plainText.getBytes());  
			byte b[] = md.digest();  
  
			int i;  
  
			StringBuffer buf = new StringBuffer("");  
			for (int offset = 0; offset < b.length; offset++) {  
				i = b[offset];  
				if (i < 0)  
					i += 256;  
				if (i < 16)  
					buf.append("0");  
				buf.append(Integer.toHexString(i));  
			}  
			//32位加密  
			return buf.toString();  
			// 16位的加密  
			//return buf.toString().substring(8, 24);  
		} catch (NoSuchAlgorithmException e) {  
			e.printStackTrace();  
			return null;  
		}  
	}
}
