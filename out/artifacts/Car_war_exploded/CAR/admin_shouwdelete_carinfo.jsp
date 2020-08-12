<%@ page import="java.sql.*" contentType="text/html; charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/index.css" type="text/css" rel="stylesheet"/>
        <title>管理员按条件删除车辆信息_删除结果</title>
    </head>
    <body>
        <%
            //设置对客户端请求进行重新编码的编码
            request.setCharacterEncoding("UTF-8");
            String driverName = "com.mysql.cj.jdbc.Driver";
            String dbURL = "jdbc:mysql://localhost:3306/CAR?characterEncoding=utf8&serverTimezone=UTC&useSSL=false&allowPublicKeyRetrieval=true";
            String userName = "root";
            String pwd = "123456";
            Connection conn;
            PreparedStatement stmt;

            String car_num;
            String car_owner_name;
            String car_owner_tel;

            //boolean n1 = true;

            try {
                // 注册 JDBC 驱动
                Class.forName(driverName);
                // 连接数据库
                conn = DriverManager.getConnection(dbURL, userName, pwd);

                String sql = "delete Car,Car_Owner from Car right join Car_Owner on ( Car.Car_owner_name=Car_Owner.Car_owner_name)"
                        + " where (Car.Car_num=? and Car.car_owner_name=? and Car_owner.Car_owner_tel=?)";

                stmt = conn.prepareStatement(sql);

                car_num = request.getParameter("Car_num");
                car_owner_name = request.getParameter("Car_owner_name");
                car_owner_tel = request.getParameter("Car_owner_tel");

                stmt.setString(1, car_num);
                stmt.setString(2, car_owner_name);
                stmt.setString(3, car_owner_tel);

                int n = stmt.executeUpdate();
                if (n == 2) {
        %>
        <div class="box4" align="center" style="margin: 5px 0 5px 0">
            <table border="2" cellpadding="10" bordercolor="#E7FBFF">
                <!--边框粗细为2像素,单元格和格中的内容距离为10像素,画出的表格看起来是四个单线的表格-->
                <tr>
                    <td bgcolor="#E7FBFF" align="center">
                        此车辆登记信息已成功被删除! <br>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#E7FBFF" align="center">
                        <a href="admin_login_success.jsp">返回登录成功界面</a><br>
                    </td>
                </tr>
            </table>
        </div>
        <%
        } else {
        %>
        <div class="box4" align="center" style="margin: 5px 0 5px 0">
            <table border="2" cellpadding="10" bordercolor="#E7FBFF">
                <!--边框粗细为2像素,单元格和格中的内容距离为10像素,画出的表格看起来是四个单线的表格-->
                <tr>
                    <td bgcolor="#E7FBFF" align="center">
                        该车辆登记信息删除失败,请再次操作! <br>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#E7FBFF" align="center">
                        <a href="admin_login_success.jsp">返回登录成功界面</a><br>
                    </td>
                </tr>
            </table>
        </div>
        <%
                }
                stmt.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </body>
</html>