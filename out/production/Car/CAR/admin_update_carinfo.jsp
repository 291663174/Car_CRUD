<%@ page contentType="text/html; charset=UTF-8" %>
<!--最上面这句话表示当前整个页面的脚本语言的种类是JAVA,并导入了java.util包中所有的类接口,
浏览器会自动调用html的解析器对本文件进行相应的处理, 静态网页使用中文gbk编码-->

<html>
    <head>
        <link href="css/index.css" type="text/css" rel="stylesheet"/>
        <title>管理员按条件修改车辆信息</title>
    </head>
    <form action="admin_beforeupdate_result.jsp" method="post">
        <div class="box4" align="center" style="margin: 100px 0 100px 0">
            <table border="4" cellpadding="18" bordercolor="#9DCFFF">
                <!--边框粗细为4像素,单元格和格中的内容距离为18像素,画出的表格看起来是四个单线的表格-->
                <tr>
                    <td colspan="2">
                        <!--在表格中合并了2个列-->
                        <b>请输入需要修改的车辆登记信息:</b>
                        <form action="admin_shouwupdate_result.jsp" method="post"></form>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#E7FBFF" align="right">
                        车牌号：
                        <label>
                            <input type="text" name="Car_num" required>
                        </label></td>
                </tr>
                <tr>
                    <td bgcolor="#E7FBFF" align="right">
                        车辆所有者姓名:
                        <label>
                            <input type="text" name="Car_owner_name" required/>
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
                        <a href="admin_beforeupdate_result.jsp">
                            <input type="submit" value="确定"/></a>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#E7FBFF" align="center"><a href="admin_login_success.jsp">
                        返回登录成功界面</a>
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <body>
    </body>
</html>