<%@ page contentType="text/html; charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/index.css" type="text/css" rel="stylesheet"/>
        <br><title>用户按条件查询车辆信息</title>
    </head>
    <body>
        <div class="box4" align="center" style="margin: 100px 0 100px 0">
            <table border="4" cellpadding="18" bordercolor="#9DCFFF">
                <!--边框粗细为4像素,单元格和格中的内容距离为18像素,画出的表格看起来是四个单线的表格-->
                <tr>
                    <td colspan="2">
                        <!--在表格中合并了2个列-->
                        <b>请输入需要查询的车辆登记的信息：</b>
                    </td>
                </tr>
                <form action="user_selectsome_result.jsp" method="post">
                    <tr>
                        <td bgcolor="#E7FBFF" align="right">
                            车牌号：
                            <label>
                                <input type="text" name="Car_num" required>
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
                        <script type="text/javascript">
                            function reloadPage() {
                                window.location.reload();
                            }
                        </script>
                        <td bgcolor="#E7FBFF" align="center">
                            <input type="button" value="重置" onclick="reloadPage()"/>
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#E7FBFF" align="center">
                            <a href="user_selectsome_result.jsp">
                                <input type="submit" value=" 确定  "/>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#E7FBFF" align="center">
                            <a href="user_login_success.jsp">返回登录成功界面</a>
                        </td>
                    </tr>
                </form>
            </table>
        </div>
    </body>
</html>