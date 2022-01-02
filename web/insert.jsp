<%-- 
    Document   : insert
    Created on : 2021/12/31, 下午 08:00:13
    Author     : s1083729
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*,java.util.*"%>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%
    String type = request.getParameter("type");
    String money = request.getParameter("money");
    String date = request.getParameter("date");
    Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/test?zeroDateTimeBehavior=convertToNull","root","");
    Statement s = con.createStatement();

    String query = "SELECT * FROM total";
    ResultSet results = s.executeQuery("SELECT * FROM unnit");
    
    int temp_money = 0;
    //record the money is positive or negative
    if("cost".equals(type)){
        temp_money = Integer.parseInt(money);
        temp_money *= -1;
    }else if("save".equals(type)){
        temp_money = Integer.parseInt(money);
    }
    int sum = 0;
    String sqlString = "Select Sum(money) from unnit";
    ResultSet rs_money = s.executeQuery("SELECT SUM(money) FROM unnit");
    while(rs_money.next()){
        int c = rs_money.getInt(1);
        sum = sum + c;
    }
    String total = Integer.toString(sum);
    
    //String total = "0";
    String data = "";
    
    
    
    int i = s.executeUpdate("insert into unnit(type,money,total,date)value('"+type+"','"+money+"','"+total+"','"+date+"')");
    out.println("inserted");
%>
