<%@ page import="java.sql.*" contentType="text/html; charset=UTF-8" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/index.css" type="text/css" rel="stylesheet"/>
        <title>按条件修改车辆_显示原本信息</title>
    </head>
    <body>
        <%
            //设置对客户端请求进行重新编码的编码
            request.setCharacterEncoding("UTF-8");
            String driverName = "com.mysql.cj.jdbc.Driver";
            String dbURL = "jdbc:mysql://localhost:3306/CAR?characterEncoding=utf8&serverTimezone=UTC&useSSL=false&allowPublicKeyRetrieval=true";
            String userName = "root";
            String pwd = "123456";
            Connection conn = null;
            PreparedStatement stmt = null;

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
                conn = DriverManager.getConnection(dbURL, userName, pwd);
                String sql = "select * from Car,Car_Owner where Car.Car_owner_name=Car_Owner.Car_owner_name " +
                        "AND Car.Car_num=? AND Car_Owner.Car_owner_name=?";
                // 执行查询
                stmt = conn.prepareStatement(sql);

                stmt.setString(1, request.getParameter("Car_num"));
                stmt.setString(2, request.getParameter("Car_owner_name"));

                ResultSet rs = stmt.executeQuery();
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

        <form action="admin_shouwupdate_result.jsp" method="post">
            <div class="box4" align="center" style="margin: 3px 0 3px 0">
                <table border="1" cellpadding="3" bordercolor="#9DCFFF">
                    <!--边框粗细为1像素,单元格和格中的内容距离为4像素,画出的表格看起来是一个单线的表格-->
                    <tr>
                        <td colspan="2"><!--在表格中合并了2个列-->
                            <b>此车辆的登记信息如下<br>(需要修改请做更改，点击确认则会更新信息):</b>
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#E7FBFF" align="center">
                            当前车辆所有者姓名为:
                            <label>
                                <%=car_owner_name%>
                                <input type="hidden" value="<%=car_owner_name%>" name="Car_owner_name">
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#E7FBFF" align="center">
                            当前车牌号为:
                            <label>
                                <%=car_num%><br>
                                <input type="hidden" value="<%=car_num%>" name="Car_num">
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#E7FBFF" align="center">
                            当前车辆类型为:
                            <label>
                                <%=car_type%><br>
                                <input type="text" name="Car_type">
                            </label>
                        </td>
                    <tr>
                        <td bgcolor="#E7FBFF" align="center">
                            当前车辆颜色为:
                            <label>
                                <%=car_color%><br>
                                <input type="text" name="Car_color">
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#E7FBFF" align="center">
                            当前生产类型为:
                            <label>
                                <%=production_type%><br>
                                <input type="text" name="Production_type">
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#E7FBFF" align="center">
                            当前车辆里程数为:
                            <label>
                                <%=car_miles%><br>
                                <input type="text" name="Car_miles">
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#E7FBFF" align="center">
                            当前生产日期为:
                            <label>
                                <%=car_miles%><br>
                                <input type="text" name="Production_date">
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#E7FBFF" align="center">
                            当前有效日期为:
                            <label>
                                <%=car_miles%><br>
                                <input type="text" name="Useful_date">
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#E7FBFF" align="center">
                            当前车主电话为:
                            <label>
                                <%=car_miles%><br>
                                <input type="text" name="Car_owner_tel" placeholder="只能输入纯数字的输入框"
                                       oninput="value=value.replace(/[^\d]/g,'')" required>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#E7FBFF" align="center">
                            当前车主住址为:
                            <label>
                                <%=car_owner_address%><br>
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
                            <a href="admin_shouwupdate_result.jsp">
                                <input type="submit" value="确定"/>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <a href="admin_login_success.jsp">返回登录成功界面</a> <br>
                        </td>
                    </tr>
                </table>
            </div>
        </form>
        <%
        } else {
        %>

        <div class="box4" align="center" style="margin: 20px 0 20px 0">
            <table border="1" cellpadding="4" bordercolor="#9DCFFF">
                <tr>
                    <!--边框粗细为2像素,单元格和格中的内容距离为10像素,画出的表格看起来是四个单线的表格-->
                    <td bgcolor="#E7FBFF" align="center">
                        没有该车辆信息可供修改！ <br>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#E7FBFF" align="center">
                        <a href="admin_login_success.jsp">返回登录成功界面</a> <br>
                    </td>
                </tr>
            </table>
        </div>
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
    </body>
</html>