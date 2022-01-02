<%-- 
    Document   : main_jsp
    Created on : 2021/12/31, 下午 07:16:47
    Author     : s1083729
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Account</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div style="text-align:center;line-height: 100px">「記帳」</div>
        <!--
        <label for="bookdate">日期：</label>
        <input type="date" id="bookdate">
        -->
        <form method="POST" action="insert.jsp">
            <table>
                <tr>
                    <label for="bookdate">日期：</label>
                    <input type="date" name = "date">
                </tr>
                <tr>
                    <p>type（單選）：<input name="type" type=radio value="save">save
                                    <input name="type" type=radio value="cost" checked>cost
                </tr>
                <tr>
                    <td>money: </td>
                    <td><input type="text" name="money"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="submit"></td>
                </tr>
            </table>
        </form>
        <form methob="POST" action = "detail.jsp">
            <input type = "submit">
        </form>
        <form methob = "POST" action = "export_button.jsp">
            <input type = "submit">
        </form>
    </body>
</html>
