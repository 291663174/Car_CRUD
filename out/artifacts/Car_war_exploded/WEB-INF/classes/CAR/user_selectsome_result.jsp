<%@ page import="java.sql.*" contentType="text/html; charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/index.css" type="text/css" rel="stylesheet"/>
        <title>用户按条件查询车辆信息_查询结果</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");
            // MySQL 8.0 以上版本 - JDBC 驱动名及数据库 URL
            String driverName = "com.mysql.cj.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/CAR?" +
                    "useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";

            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs;

            String userName = "root";
            String pwd = "123456";
            String car_num;
            String car_owner_name;
            String car_type;
            String car_color;
            String production_type;
            String car_miles;
            String production_date;
            String useful_date;
            String car_owner_tel;
            String car_owner_address;

            try {
                // 注册 JDBC 驱动
                Class.forName(driverName);
                // 连接数据库
                conn = DriverManager.getConnection(url, userName, pwd);
                String sql = "select * from Car,Car_Owner where Car.Car_owner_name=Car_Owner.Car_owner_name " +
                        "AND Car.Car_num=? AND Car_Owner.Car_owner_name=?";
                // 执行查询
                stmt = conn.prepareStatement(sql);

                stmt.setString(1, request.getParameter("Car_num"));
                stmt.setString(2, request.getParameter("Car_owner_name"));
                rs = stmt.executeQuery();

                // 展开结果集数据库
                if (rs.next()) {
                    // 通过字段检索
                    car_num = rs.getString("Car_num");
                    car_owner_name = rs.getString("Car_owner_name");
                    car_type = rs.getString("Car_type");
                    car_color = rs.getString("Car_color");
                    production_type = rs.getString("Production_type");
                    car_miles = rs.getString("Car_miles");
                    production_date = rs.getString("Production_date");
                    useful_date = rs.getString("Useful_date");
                    car_owner_tel = rs.getString("Car_owner_tel");
                    car_owner_address = rs.getString("Car_owner_address");
        %>
        <div class="box4" align="center" style="margin: 100px 0 100px 0">
            <table border="1" cellpadding="8" bordercolor="#9DCFFF">
                <!--边框粗细为1像素,单元格和格中的内容距离为8像素,画出的表格看起来是一个单线的表格-->
                <tr>
                    <td colspan="2">
                        <!--在表格中合并了2个列-->
                        <b>查询结果如下：</b>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#E7FBFF" align="center">车牌号:<%=car_num%>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#E7FBFF" align="center">车辆所有者姓名:<%=car_owner_name%>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#E7FBFF" align="center">车辆类型:<%=car_type%>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#E7FBFF" align="center">车辆颜色:<%=car_color%>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#E7FBFF" align="center">生产类型:<%=production_type%>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#E7FBFF" align="center">车辆里程数:<%=car_miles%>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#E7FBFF" align="center">生产日期:<%=production_date%>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#E7FBFF" align="center">有效日期:<%=useful_date%>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#E7FBFF" align="center">车主电话:<%=car_owner_tel%>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#E7FBFF" align="center">车主住址:<%=car_owner_address%>
                    </td>
                </tr>
                <%
                } else {
                %>
                <div align="center" style="margin: 200px 0 200px 0">
                    <table border="2" cellpadding="10" bordercolor="#E7FBFF">
                        <!--边框粗细为2像素,单元格和格中的内容距离为10像素,画出的表格看起来是四个单线的表格-->
                        <td bgcolor="#E7FBFF" align="center" valign="center">
                            查询不到结果！<br><br>
                        </td>
                        <%
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            } finally {
                                // 关闭资源
                                try {
                                    if (stmt != null) {
                                        stmt.close();
                                    }
                                } catch (SQLException ignored) {
                                }// 什么都不做
                                try {
                                    if (conn != null) {
                                        conn.close();
                                    }
                                } catch (SQLException se) {
                                    se.printStackTrace();
                                }
                            }
                        %>
                        <tr>
                            <td>
                                <a href="user_login_success.jsp">返回登录成功界面</a>
                            </td>
                        </tr>
                    </table>
                </div>
            </table>
        </div>
    </body>
</html>