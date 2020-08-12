<%@ page import="java.sql.*" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.Objects" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/index.css" type="text/css" rel="stylesheet"/>
        <title>管理员列出全部登记车辆信息</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");
            // MySQL 8.0 以上版本 - JDBC 驱动名及数据库 URL
            String driverName = "com.mysql.cj.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/CAR?" +
                    "useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
            Connection conn = null;
            PreparedStatement stmt1 = null;
            PreparedStatement stmt2 = null;
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
            ResultSet rs1 = null;
            ResultSet rs2 = null;
            try {
                // 注册 JDBC 驱动
                Class.forName(driverName);
                // 连接数据库
                conn = DriverManager.getConnection(url, userName, pwd);
                String sql1;
                sql1 = "SELECT * FROM Car";
                String sql2;
                sql2 = "SELECT * FROM Car_Owner";
                // 执行查询
                stmt1 = conn.prepareStatement(sql1);
                stmt2 = conn.prepareStatement(sql2);
                rs1 = stmt1.executeQuery();
                rs2 = stmt2.executeQuery();
                // 展开结果集数据库
                while (rs1.next() && rs2.next()) {
                    // 通过字段检索
                    car_num = rs1.getString("Car_num");
                    car_owner_name = rs1.getString("Car_owner_name");
                    car_type = rs1.getString("Car_type");
                    car_color = rs1.getString("Car_color");
                    production_type = rs1.getString("Production_type");
                    car_miles = rs1.getString("Car_miles");
                    production_date = rs1.getString("Production_date");
                    useful_date = rs1.getString("Useful_date");
                    car_owner_tel = rs2.getString("Car_owner_tel");
                    car_owner_address = rs2.getString("Car_owner_address");
        %>
        <div class="box4" align="center" style="margin: 10px 0 10px 0">
            <table border="1" cellpadding="4" bordercolor="#9DCFFF">
                <!--边框粗细为1像素,单元格和格中的内容距离为4像素,画出的表格看起来是一个单线的表格-->
                <tr>
                    <td colspan="2">
                        <!--在表格中合并了2个列-->
                        <b>全部登记车辆信息如下:</b>
                    </td>
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
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        // 关闭资源
                        try {
                            Objects.requireNonNull(rs1).close();
                            Objects.requireNonNull(rs2).close();
                            stmt1.close();
                            stmt2.close();
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
                    <td align="center"><a href="admin_login_success.jsp">返回登录成功界面</a></td>
                </tr>
            </table>
        </div>
    </body>
</html>