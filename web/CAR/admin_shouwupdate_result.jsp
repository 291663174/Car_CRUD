<%@ page import="java.sql.*" contentType="text/html; charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/index.css" type="text/css" rel="stylesheet"/>
        <title>管理员按条件修改车辆信息_更新数据</title>
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
            PreparedStatement stmt1;
            PreparedStatement stmt2;
            int[] count1;
            int[] count2;

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

                String sql1 = "update Car set Car_type=?,Car_color=?,Production_type=?,"
                        + "Production_date=?,Useful_date=?,Car_miles=? where Car_num=? and Car_owner_name=?;";
                String sql2 = "update Car_Owner set Car_owner_tel=?,Car_owner_address=? where Car_owner_name=?";

                // 需要用到事务，不能自动提交，需要手动提交
                conn.setAutoCommit(false);
                stmt1 = conn.prepareStatement(sql1, Statement.RETURN_GENERATED_KEYS);
                stmt2 = conn.prepareStatement(sql2);

                car_num = request.getParameter("Car_num");
                car_owner_name = request.getParameter("Car_owner_name");
                car_type = request.getParameter("Car_type");
                car_color = request.getParameter("Car_color");
                production_type = request.getParameter("Production_type");
                car_miles = request.getParameter("Car_miles");
                production_date = request.getParameter("Production_date");
                useful_date = request.getParameter("Useful_date");
                car_owner_tel = request.getParameter("Car_owner_tel");
                car_owner_address = request.getParameter("Car_owner_address");

                stmt1.setString(1, car_type);
                stmt1.setString(2, car_color);
                stmt1.setString(3, production_type);
                stmt1.setString(4, production_date);
                stmt1.setString(5, useful_date);
                stmt1.setString(6, car_miles);
                stmt1.setString(7, car_num);
                stmt1.setString(8, car_owner_name);
                stmt1.addBatch();

                stmt2.setString(1, car_owner_tel);
                stmt2.setString(2, car_owner_address);
                stmt2.setString(3, car_owner_name);
                stmt2.addBatch();

                count1 = stmt1.executeBatch();
                count2 = stmt2.executeBatch();
                conn.commit();                 //提交事务，这个非常重要

                for (int i : count1) {
                    if (i == 0) {
                        conn.rollback();              // 回滚，非常重要
                        System.out.println("======出现异常，回滚=========");
                    }
                }
                for (int i : count2) {
                    if (i == 0) {
                        conn.rollback();          // 回滚，非常重要
                        System.out.println("==111====出现异常，回滚====111=====");
                    }
                }

                int n1 = stmt1.executeUpdate();
                int n2 = stmt2.executeUpdate();
                
                if (n1 == 1 && n2 == 1) {
        %>
        <div class="box4" align="center" style="margin: 5px 0 5px 0">
            <table border="2" cellpadding="10" bordercolor="#E7FBFF">
                <!--边框粗细为2像素,单元格和格中的内容距离为10像素,画出的表格看起来是四个单线的表格-->
                <tr>
                    <td bgcolor="#E7FBFF" align="center">
                        该车辆登记信息修改成功!<br>
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
        } else {
        %>
        <div align="center" style="margin: 5px 0 5px 0">
            <table border="2" cellpadding="10" bordercolor="#E7FBFF">
                <!--边框粗细为2像素,单元格和格中的内容距离为10像素,画出的表格看起来是四个单线的表格-->
                <tr>
                    <td bgcolor="#E7FBFF" align="center">
                        该车辆登记信息修改失败!<br>
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
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </body>
</html>