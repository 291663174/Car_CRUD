<%@ page  contentType="text/html; charset=UTF-8" %>
<!--最上面这句话表示浏览器会自动调用html的解析器对本文件进行相应的处理, 静态网页使用UTF-8编码-->

<%
    /*
        定义账号密码验证码变量
     */
    String username;
    String password;
    String yzm;

    /*
        获取登录时输入的账号密码以及验证码
     */
    username = request.getParameter("username");
    password = request.getParameter("password");
    yzm = request.getParameter("yzm");
    
    /*
        用户和密码都等于admin并且验证码等于xvka或者是XVKA,则管理员登录成功
     */
    if ("admin".equals(username) && "admin".equals(password) && "xvka".equals(yzm) || "XVKA".equals(yzm)) {
        session.setAttribute("loginUser", username);
        // session有一定时间期限可以保存用户的信息，在此给session设置值：loginUser里存放的值为username

        request.getRequestDispatcher("admin_login_success.jsp").forward(request, response);
    }
    
    /*
        用户和密码都等于123456789并且验证码等于xvka,则用户登录成功 
     */
    else if ("123456789".equals(username) && "123456789".equals(password) && "xvka".equals(yzm) || "XVKA".equals(yzm)) 
    {
        session.setAttribute("loginUser", username); 
     
	    /*
	        取得一个请求分发器对象，它的方法forward(request,response)作用是将请求转发到admin_login_success.jsp，只转发请求，
	        不产生新的request对象。request封装了请求信息，response封装了响应信息。
	    */
        request.getRequestDispatcher("user_login_success.jsp").forward(request, response);
    } else {
        /*
            是指URL以字符串形式或重定向跳转的页面文件的相对路径写在括号内 即执行login_failure.jsp，也就是登录失败的界面
         */
        response.sendRedirect("login_failure.jsp");
    }
%>