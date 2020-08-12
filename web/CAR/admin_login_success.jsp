<%@ page import="java.sql.*" contentType="text/html; charset=UTF-8" %>
<!--最上面这句话表示当前整个页面的脚本语言的种类是JAVA,并导入了java.util包中所有的类接口,导入sql包下面的所有类,
浏览器会自动调用html的解析器对本文件进行相应的处理, 静态网页使用中文UTF-8编码-->

<html>
    <head>
        <link href="css/index.css" type="text/css" rel="stylesheet"/>
        <title>车辆信息登记系统后台管理员界面</title>
    </head>
    <body>
        <div class="box4">
            <%
                String loginUser = "";                       //定义用户名
                if (session.getAttribute("loginUser") != null)
                //session保存的用户名如果非空则执行
                {
                    loginUser = session.getAttribute("loginUser").toString();
                    //用toString将信息以字符串类型转换后保存到session中。 
                }
            %>

            <!-- 简写属性在一个声明中设置所有外边距属性 依次是上右下左-->
            <div align="center" style="margin: 5px 0 5px 0">
                <table border="2" cellpadding="10" bordercolor="#E7FBFF">
                    <!--边框粗细为2像素,cellpadding是单元格和格中的内容距离为10像素,#E7FBFF是边框内颜色-->
                    <td bgcolor="#E7FBFF" align="center">欢迎您<br>
                        <span style="color: red; "><%=loginUser%><br> 登录成功<br></span>

                        <!--jdbc方法连接Mysql数据库 检测数据库JDBC驱动及核对登陆账号密码 连接成功或失败都会有提示-->
                        <%
                            try {
                                // MySQL 8.0 以上版本 - JDBC 驱动名及数据库 URL
                                String driverName = "com.mysql.cj.jdbc.Driver";
                                String url = "jdbc:mysql://localhost:3306/CAR?" +
                                        "useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";

                                out.println("加载数据库驱动成功！");
                                try {
                                    // 注册 JDBC 驱动
                                    Class.forName(driverName);
                                    String user = "root";//登录名
                                    String password = "123456";//登陆密码
                                    DriverManager.getConnection(url, user, password);
                                    out.println("连接MySQL数据库成功！");
                                } catch (SQLException e) {
                                    out.print("MySQL数据库连接失败！");
                                }
                            } catch (Exception e) {
                                out.println("加载驱动失败！");
                            }
                        %>
                    </td>
                </table>
            </div>

            <div align="center" style="margin: 15px 0 15px 0">
                <table border="4" cellpadding="18" bordercolor="#E7FBFF">
                    <!--边框粗细为4像素,单元格和格中的内容距离为18像素,画出的表格看起来是四个单线的表格-->
                    <td bgcolor="#E7FBFF" align="center">
                        <span style="color: blue; ">后台主菜单界面</span>
                    </td>
                    <tr>
                        <td bgcolor="#E7FBFF" align="center">
                            <a href="admin_input_carinfo.jsp">管理员登记车辆信息</a>
                        </td>
                    </tr>
                    <!--tr是表中的行,td是表中的单元格-->
                    <tr>
                        <td bgcolor="#E7FBFF" align="center">
                            <a href="admin_delete_carinfo.jsp">管理员按条件删除车辆信息</a>
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#E7FBFF" align="center">
                            <a href="admin_update_carinfo.jsp">管理员按条件修改车辆信息</a>
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#E7FBFF" align="center">
                            <a href="admin_selectsome_carinfo.jsp">管理员按条件查询车辆信息</a>
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#E7FBFF" align="center">
                            <a href="admin_shouwall_carinfo.jsp">管理员列出全部登记车辆信息</a>
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#E7FBFF" align="center">
                            <a href="login.jsp">退出后台界面</a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </body>
</html>
