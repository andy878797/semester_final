<%-- 
    Document   : account_table
    Created on : 2022/1/1, 下午 08:14:52
    Author     : s1083729
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <%
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=(Connection)DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/test?zeroDateTimeBehavior=convertToNull","root","");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from unnit;");
    %><table border=1 align=center style="text-align:center">
      <thead>
          <tr>
             <th>type</th>
             <th>money</th>
             <th>total</th>
             <th>date</th>
          </tr>
      </thead>
      <tbody>
        <%while(rs.next())
        {
            %>
            <tr>
                <td><%=rs.getString("type") %></td>
                <td><%=rs.getString("money") %></td>
                <td><%=rs.getString("total") %></td>
                <td><%=rs.getString("date") %></td>
            </tr>
            <%}%>
           </tbody>
        </table><br>
    <%}
    catch(Exception e){
        out.print(e.getMessage());%><br><%
    }
    %>
</body>
</html>
</html>
