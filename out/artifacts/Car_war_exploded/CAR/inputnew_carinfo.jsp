<%@ page import="java.sql.*" contentType="text/html; charset=UTF-8" %>
<!--最上面这句话表示当前整个页面导入了java.sql.*包中所有的类接口,
浏览器会自动调用html的解析器对本文件进行相应的处理, 静态网页使用中文UTF-8编码-->

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/index.css" type="text/css" rel="stylesheet"/>
        <title>登记新车辆信息</title>
    </head>
    <body>
        <%
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
            try {
                // 注册 JDBC 驱动
                Class.forName(driverName);
                // 连接数据库
                conn = DriverManager.getConnection(dbURL, userName, pwd);

                //ON DUPLICATE KEY UPDATE 如果在句尾指定该语法，他会根据指定的主键或者唯一标示来更新数据库的内容
                //具体的操作是想根据唯一标示查看数据库是否存在该记录，如果存在该记录就更新，如果不存在就会插入一条新的记录
                String sql1;
                sql1 = "insert into Car(Car_num,Car_owner_name,Car_type,Car_color,Production_type,Production_date,Useful_date,Car_miles)"
                        + "values(?,?,?,?,?,?,?,?)ON DUPLICATE KEY UPDATE Car_owner_name=?";
                String sql2;
                sql2 = "insert into Car_Owner(Car_owner_name,Car_owner_tel,Car_owner_address)values(?,?,?)" +
                        "ON DUPLICATE KEY UPDATE Car_owner_name=?";

                conn.setAutoCommit(false);// 需要用到事务，不能让他自动提交，需要手动提交
                stmt1 = conn.prepareStatement(sql1, Statement.RETURN_GENERATED_KEYS);
                stmt2 = conn.prepareStatement(sql2);// sql2表示对另一张表的插入记录

                String car_num = request.getParameter("Car_num");
                String car_owner_name = request.getParameter("Car_owner_name");
                String car_type = request.getParameter("Car_type");
                String car_color = request.getParameter("Car_color");
                String production_type = request.getParameter("Production_type");
                String car_miles = request.getParameter("Car_miles");
                String production_date = request.getParameter("Production_date");
                String useful_date = request.getParameter("Useful_date");
                String car_owner_tel = request.getParameter("Car_owner_tel");
                String car_owner_address = request.getParameter("Car_owner_address");

                stmt1.setString(1, car_num);
                stmt1.setString(2, car_owner_name);
                stmt1.setString(3, car_type);
                stmt1.setString(4, car_color);
                stmt1.setString(5, production_type);
                stmt1.setString(6, production_date);
                stmt1.setString(7, useful_date);
                stmt1.setString(8, car_miles);
                stmt1.setString(9, car_owner_name);
                stmt1.addBatch();

                stmt2.setString(1, car_owner_name);
                stmt2.setString(2, car_owner_tel);
                stmt2.setString(3, car_owner_address);
                stmt2.setString(4, car_owner_name);
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
                        车辆信息登记成功！ <br>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#E7FBFF" align="center">
                        <a href="admin_login_success.jsp">返回登录成功界面</a>
                    </td>
                </tr>
            </table>
        </div>
        <%
        } else {
        %>
        <div class="box4" align="center" style="margin: 5px 0 5px 0">
            <table border="2" cellpadding="10" bordercolor="#E7FBFF">
                <td bgcolor="#E7FBFF" align="center">车辆信息登记错误,请再次插入! <br></td>
                <tr>
                    <td bgcolor="#E7FBFF" align="center">
                        <a href="admin_login_success.jsp">返回登录成功界面</a>
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
        %><br>
    </body>
</html>