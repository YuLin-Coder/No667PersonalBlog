<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" isErrorPage="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>懒洋洋博客</title>
    <script src="${pageContext.request.contextPath}/static/bootstrap3/js/jquery-1.11.2.min.js"></script>
    <STYLE>
        body{
            background: #ebebeb;
            font-family: "Helvetica Neue","Hiragino Sans GB","Microsoft YaHei","\9ED1\4F53",Arial,sans-serif;
            color: #222;
            font-size: 12px;
        }
        *{padding: 0px;margin: 0px;}
        .top_div{
            background: #008ead;
            width: 100%;
            height: 400px;
        }
        .ipt{
            border: 1px solid #d3d3d3;
            padding: 10px 10px;
            width: 290px;
            border-radius: 4px;
            padding-left: 35px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
            -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s
        }
        .ipt:focus{
            border-color: #66afe9;
            outline: 0;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);
            box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6)
        }
        .u_logo{
            background: url("${pageContext.request.contextPath}/static/images/username.png") no-repeat;
            padding: 10px 10px;
            position: absolute;
            top: 43px;
            left: 40px;

        }
        .p_logo{
            background: url("${pageContext.request.contextPath}/static/images/password.png") no-repeat;
            padding: 10px 10px;
            position: absolute;
            top: 12px;
            left: 40px;
        }
        a{
            text-decoration: none;
        }
        .tou{
            background: url("${pageContext.request.contextPath}/static/images/tou.png") no-repeat;
            width: 97px;
            height: 92px;
            position: absolute;
            top: -87px;
            left: 140px;
        }
        .left_hand{
            background: url("${pageContext.request.contextPath}/static/images/left_hand.png") no-repeat;
            width: 32px;
            height: 37px;
            position: absolute;
            top: -38px;
            left: 150px;
        }
        .right_hand{
            background: url("${pageContext.request.contextPath}/static/images/right_hand.png") no-repeat;
            width: 32px;
            height: 37px;
            position: absolute;
            top: -38px;
            right: -64px;
        }
        .initial_left_hand{
            background: url("${pageContext.request.contextPath}/static/images/hand.png") no-repeat;
            width: 30px;
            height: 20px;
            position: absolute;
            top: -12px;
            left: 100px;
        }
        .initial_right_hand{
            background: url("${pageContext.request.contextPath}/static/images/hand.png") no-repeat;
            width: 30px;
            height: 20px;
            position: absolute;
            top: -12px;
            right: -112px;
        }
        .left_handing{
            background: url("${pageContext.request.contextPath}/static/images/left-handing.png") no-repeat;
            width: 30px;
            height: 20px;
            position: absolute;
            top: -24px;
            left: 139px;
        }
        .right_handinging{
            background: url("${pageContext.request.contextPath}/static/images/right_handing.png") no-repeat;
            width: 30px;
            height: 20px;
            position: absolute;
            top: -21px;
            left: 210px;
        }

    </STYLE>

    <SCRIPT type="text/javascript">
        $(function(){
            //得到焦点
            $("#password").focus(function(){
                $("#left_hand").animate({
                    left: "150",
                    top: " -38"
                },{step: function(){
                        if(parseInt($("#left_hand").css("left"))>140){
                            $("#left_hand").attr("class","left_hand");
                        }
                    }}, 2000);
                $("#right_hand").animate({
                    right: "-64",
                    top: "-38px"
                },{step: function(){
                        if(parseInt($("#right_hand").css("right"))> -70){
                            $("#right_hand").attr("class","right_hand");
                        }
                    }}, 2000);
            });
            //失去焦点
            $("#password").blur(function(){
                $("#left_hand").attr("class","initial_left_hand");
                $("#left_hand").attr("style","left:100px;top:-12px;");
                $("#right_hand").attr("class","initial_right_hand");
                $("#right_hand").attr("style","right:-112px;top:-12px");
            });
        });

        function checkForm(){
            var name=$("#name").val();
            var password=$("#password").val();
            if(name==null||name==""){
                $("#error").html("用户名不能为空！");
                return false;
            }
            if(password==null||password==""){
                $("#error").html("密码不能为空！");
                return false;
            }
            return true;
        }
    </SCRIPT>
</head>
<body>

<DIV class="top_div">
</DIV>
<form action="${pageContext.request.contextPath}/blogger/reg" method="post" onsubmit="return checkForm()">
    <DIV style="background: rgb(255, 255, 255); margin: -100px auto auto; border: 1px solid rgb(231, 231, 231); border-image: none; width: 400px; height: 350px; text-align: center;">
        <DIV style="width: 165px; height: 96px; position: absolute;">
            <DIV class="tou">
            </DIV>
            <DIV class="initial_left_hand" id="left_hand">
            </DIV>
            <DIV class="initial_right_hand" id="right_hand">
            </DIV>
        </DIV>
        ${requestScope.msg}<br>
        <P style="padding: 30px 0px 10px; position: relative;">
            <SPAN class="u_logo"></SPAN>
            <INPUT id="name" name="name" class="ipt" type="text" placeholder="请输入用户名"><br><span style="color: red;">${requestScope.errors.name}</span>
        </P>
        <P style="padding: 0px 0px 10px;position: relative;">
            <SPAN class="p_logo"></SPAN>
            <INPUT id="password" name="password" class="ipt"  type="password" placeholder="请输入密码"><br><span style="color: red;">${requestScope.errors.password}</span>
        </P>
        <P style="padding: 0px 0px 10px;position: relative;">
            <SPAN class="p_logo"></SPAN>
            <INPUT id="cfmpassword" name="cfmpassword" class="ipt"  type="password" placeholder="请确认密码"><br>
        </P>
        <P style="padding: 0px 0px 10px;position: relative;">
            <SPAN class="p_logo"></SPAN>
            <INPUT id="email" name="email" class="ipt"  type="text" placeholder="请输入邮箱"><br><span style="color: red;">${requestScope.errors.email}</span>
        </P>
        <P style="padding: 0px 0px 10px;position: relative;">
            <SPAN class="p_logo"></SPAN>
            <INPUT id="phone" name="phone" class="ipt"  type="text" placeholder="请输入电话号码"><br><span style="color: red;">${requestScope.errors.phone}</span>
        </P>
        <DIV style="height: 50px; line-height: 50px; margin-top: 30px; border-top-color: rgb(231, 231, 231); border-top-width: 1px; border-top-style: solid;">
            <P style="margin: 0px 35px 20px 45px;">
                <span><font color="red" id="error">${errorInfo }</font></span>
                <SPAN style="float: right;">
	              <input type="submit" style="background: rgb(0, 142, 173); padding: 7px 10px; border-radius: 4px; border: 1px solid rgb(26, 117, 152); border-image: none; color: rgb(255, 255, 255); font-weight: bold;" value="注册"/>
	         </SPAN>
            </P>
        </DIV>
    </DIV>
</form>
<div style="text-align:center;padding-top: 30px">
    LingnanBlog 【懒洋洋博客】
</div>
</body>
</html>