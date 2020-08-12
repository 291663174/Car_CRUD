<%@ page import="java.sql.*" contentType="text/html; charset=UTF-8" %>

<html>
    <head>
        <link href="css/index.css" type="text/css" rel="stylesheet"/>
        <title>普通用户后台界面</title>
    </head>
    <body>
        <div class="box4">
            <%
                String loginUser = "";
                if (session.getAttribute("loginUser") != null) {
                    loginUser = session.getAttribute("loginUser").toString();
                }
            %>
            <div align="center" style="margin: 5px 0 5px 0">
                <table border="2" cellpadding="10" bordercolor="#E7FBFF">
                    <!--边框粗细为2像素,单元格和格中的内容距离为10像素,画出的表格看起来是四个单线的表格-->
                    <td bgcolor="#E7FBFF" align="center">欢迎您<br>
                        <span style="color: red; "> 用户<%=loginUser%></span><br>登录成功<br>
                        <!--jdbc方法连接Mysql数据库 检测数据库jdbc驱动及核对登陆账号密码 连接成功或失败都会有提示-->
                        <% try {
                            //加载驱动
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            out.println("加载数据库驱动成功！");
                            try {
                                //地址+端口号，数据库名字
                                String uri = "jdbc:mysql://localhost:3306/CAR?characterEncoding=utf8&serverTimezone=UTC&useSSL=false&allowPublicKeyRetrieval=true";
                                String user = "root";        //登录名
                                String password = "123456";//登陆密码
                                DriverManager.getConnection(uri, user, password);
                                out.println("连接数据库成功！");
                            } catch (SQLException e) {
                                out.print("SQL Server连接失败！");
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
                        <span style="color: blue; ">用户后台主菜单界面</span>
                    </td>
                    <tr>
                        <td bgcolor="#E7FBFF" align="center">
                            <a href="user_selectsome_carinfo.jsp">用户按条件查询车辆信息</a>
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#E7FBFF" align="center">
                            <a href="user_selectall_carinfo.jsp">用户列出全部登记车辆信息</a>
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
