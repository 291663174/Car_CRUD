<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!--最上面这句话表示当前整个页面的脚本语言的种类是JAVA,并导入了java.util包中所有的类接口,
浏览器会自动调用html的解析器对本文件进行相应的处理, 静态网页使用中文UTF-8编码-->

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/index.css" type="text/css" rel="stylesheet"/>
        <title>管理员登记车辆信息</title>
    </head>
    <body>
        <%--<body background="./images/bg.png" >--%>
        <form action="inputnew_carinfo.jsp" method="post">
            <div class="box4" align="center" style="margin: 10px 0 10px 0">
                <table border="4" cellpadding="4" bordercolor="#9DCFFF" aria-required="true">
                    <!--边框粗细为4像素,单元格和格中的内容距离为8像素,画出的表格看起来是四个单线的表格-->
                    <tr>
                        <td colspan="2">
                            <!--在表格中合并了2个列-->
                            <b>请填入车辆信息(信息不能为空):</b>
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#E7FBFF" align="left">
                            车辆所有者姓名:
                            <label>
                                <input type="text" name="Car_owner_name" required>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#E7FBFF" align="left">
                            车牌号:
                            <label>
                                <input type="text" name="Car_num" required>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#E7FBFF" align="left">车辆类型:
                            <label>
                                <select name="Car_type">
                                    <option value="小型车辆" selected>小型车辆</option>
                                    <option value="中型车辆">中型车辆</option>
                                    <option value="大型车辆">大型车辆</option>
                                </select>
                            </label>
                        </td>
                    <tr>
                        <td bgcolor="#E7FBFF" align="left">
                            车辆颜色:
                            <label>
                                <input type="text" name="Car_color">
                            </label></td>
                    </tr>
                    <tr>
                        <td bgcolor="#E7FBFF" align="left">
                            生产类型:&nbsp;&nbsp;&nbsp;&nbsp;
                            <span style="color: blue; ">国产</span>
                            <label>
                                <input type="radio" name="Production_type" value="国产" checked="checked">
                            </label>
                            <span style="color: gray; ">
                            <%--6个空格--%>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            非国产
                        </span>
                            <label>
                                <input type="radio" name="Production_type" value="非国产 ">
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#E7FBFF" align="left">
                            车辆里程数:
                            <label>
                                <input type="text" name="Car_miles">
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#E7FBFF" align="left">
                            生产日期:
                            <label>
                                <input type="text" name="Production_date">
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#E7FBFF" align="left">
                            有效日期:
                            <label>
                                <input type="text" name="Useful_date">
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#E7FBFF" align="left">
                            车主电话:
                            <label>
                                <input type="text" name="Car_owner_tel" placeholder="只能输入纯数字的输入框" 
                                       oninput = "value=value.replace(/[^\d]/g,'')" required>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#E7FBFF" align="left">
                            车主住址:
                            <label>
                                <input type="text" name="Car_owner_address">
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
                            <a href="inputnew_carinfo.jsp" methods="post">
                                <input type="submit" value=" 确定  "/>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#E7FBFF" align="center">
                            <a href="admin_login_success.jsp" methods="post">返回登录成功界面</a>
                        </td>
                    </tr>
                </table>
            </div>
        </form>
    </body>
</html>