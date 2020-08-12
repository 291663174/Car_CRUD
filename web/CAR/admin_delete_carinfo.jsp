<%@ page contentType="text/html; charset=UTF-8" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/index.css" type="text/css" rel="stylesheet"/>
        <title>管理员按条件删除车辆信息</title>
    </head>
    <body>
        <form action="admin_shouwdelete_carinfo.jsp" method="post">
            <div class="box4" align="center" style="margin: 100px 0 100px 0">
                <table border="4" cellpadding="18" bordercolor="#9DCFFF">
                    <!--边框粗细为4像素,单元格和格中的内容距离为18像素,画出的表格看起来是四个单线的表格-->
                    <tr>
                        <td colspan="2">
                            <!--在表格中合并了2个列-->
                            <b>请输入需要删除的车辆信息:</b>
                            <form action="admin_shouwdelete_carinfo.jsp" method="post"></form>
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#E7FBFF" align="right">
                            车牌号：
                            <label>
                                <input type="text" name="Car_num" required/>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#E7FBFF" align="right">
                            车辆所有者姓名:
                            <label>
                                <input type="text" name="Car_owner_name" required>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#E7FBFF" align="right">
                            车主电话:
                            <label>
                                <%--
                                    限制输入框只能输入数字
                                    oninput = "value=value.replace(/[^\d]/g,'')"
                                --%>
                                <input type="text" name="Car_owner_tel" placeholder="只能输入纯数字的输入框" 
                                       oninput = "value=value.replace(/[^\d]/g,'')" required>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#E7FBFF" align="center">
                            <input type="reset" value="重填" name="">
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#E7FBFF" align="center">
                            <a href="admin_shouwdelete_carinfo.jsp">
                                <input type="submit" value="确定"/></a>
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#E7FBFF" align="center">
                            <a href="admin_login_success.jsp">返回登录成功界面</a>
                        </td>
                    </tr>
                </table>
            </div>
        </form>
    </body>
</html>