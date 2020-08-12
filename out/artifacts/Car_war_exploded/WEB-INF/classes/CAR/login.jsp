<%@ page contentType="text/html; charset=UTF-8" %>

<%--让当前viewport的宽度等于设备的宽度，同时不允许用户手动缩放。也许允不允许用户缩放不同的网站有不同的要求，
但让viewport的宽度等于设备的宽度，这个应该是大家都想要的效果，如果你不这样的设定的话，那就会使用那个比屏幕宽的默认viewport，
也就是说会出现横向滚动条。--%>
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta content="telephone=no" name="format-detection">
<html>
    <head>
        <link href="css/login.css" type="text/css" rel="stylesheet"/>
        <title>车辆信息登记系统登录</title>
    </head>
    <!--将表单数组提交到dologin.jsp去判断能否登录-->
    <form action="dologin.jsp" method="post">
        <div class="box1">
            <div class="box2">
                <!--表示第一级标题居中显示-->
                <h1 align="center">车辆信息登记系统登录</h1>
                <%--表格的宽为100%，与浏览器等宽，表格的线宽为0即不显示表格线，表格内数据与表格间隔为0，单元格与单元格间隔为0--%>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="30%" align="right">用户名：</td>
                        <td width="40%">
                            <input name="username" type="text" class="box_inp1" id="username" placeholder="请输入用户名" required/>
                        </td>
                        <td width="30%"></td>
                    </tr>
                    <tr>
                        <td align="right">密码：</td>
                        <td>
                            <input name="password" type="password" class="box_inp1" id="password" placeholder="请输入密码" required/>
                        </td>
                        <td>
                            <label>
                                <input name="" type="checkbox" value="remember-me" style="float:left; display:inline; 
                                       margin-top:9px; margin-right:3px"/>
                            </label>
                            &nbsp;记住密码
                        </td>
                    </tr>
                    <tr>
                        <td align="right">验证码：</td>
                        <td>
                            <img src="images/yzm.jpg" style=" float:right; display:inline;margin-right:-55px"/>
                            <label>
                                <input name="yzm" type="text" class="box_inp1" id="yzm" placeholder="不区分大小写"
                                        required/>
                            </label>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <input type="submit" name="button" id="btn-login" value="登录" class="subbtm"/>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
            
            <div class="copy">17计科 技术支持</div>
        </div>
    </form>
</html>
