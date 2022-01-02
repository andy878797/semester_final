<%-- 
    Document   : export_button
    Created on : 2022/1/1, 下午 10:19:15
    Author     : s1083729
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
        Connection con = null;
        String url = "jdbc:mysql://localhost:3306/test?zeroDateTimeBehavior=convertToNull";
        String db = "gg";
        String driver = "com.mysql.jdbc.Driver";
        String user = "root";
        String pass = "";
        FileWriter fw;

        try {
            Class.forName(driver);
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?zeroDateTimeBehavior=convertToNull","root","");
            Statement st = con.createStatement();
            ResultSet res = st.executeQuery("SELECT * FROM unnit");
            List<String> tableNameList = new ArrayList<String>();
            while (res.next()) {
                tableNameList.add(res.getString(1));
            }
            String filename = "C:/Users/s1083729/Desktop";
            for (String tableName : tableNameList) {
                int k = 0;
                int j = 1;
                System.out.println(tableName);
                List<String> columnsNameList = new ArrayList<String>();
                res = st.executeQuery("select * from unnit" );

                int columnCount = getColumnCount(res);

                try {
                     fw = new FileWriter("C:/Users/s1083729/Desktop/popo1121.csv");

                    for (int i = 1; i <= columnCount; i++) {
                        fw.append(res.getMetaData().getColumnName(i));
                        fw.append(",");

                    }
                    fw.append(System.getProperty("line.separator"));

                    while (res.next()) {
                        for (int i = 1; i <= columnCount; i++) {
                            if (res.getObject(i) != null) {
                                String data = res.getObject(i).toString();
                                fw.append(data);
                                fw.append(",");
                            } else {
                                String data = "null";
                                fw.append(data);
                                fw.append(",");
                            }
                        }
                        fw.append(System.getProperty("line.separator"));
                    }
                    fw.flush();
                    fw.close();
                } catch (IOException ioe) {
                    ioe.printStackTrace();
                }
            }
            con.close();
        } catch (ClassNotFoundException cnfe) {
            System.err.println("Could not load JDBC driver");
            cnfe.printStackTrace();
        }catch (SQLException sqle) {System.err.println("SQLException information");}
    }
%>

<%
public static int getRowCount(ResultSet res) throws SQLException {
        res.last();
        int numberOfRows = res.getRow();
        res.beforeFirst();
        return numberOfRows;
    }
    public static int getColumnCount(ResultSet res) throws SQLException {
        return res.getMetaData().getColumnCount();
    }
%>
