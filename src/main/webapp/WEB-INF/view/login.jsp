<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%  String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login</title>

    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="css/font-awesome.css" rel="stylesheet" type="text/css" />
    <link href="css/custom.css" rel="stylesheet" type="text/css" />

</head>
	<body>
		<div class="container">
			<div class="row text-center ">
				<div class="col-md-12">
					<br /><br />
					<h2>欢迎登陆 E-Shop</h2>
					<h5>（多种角色共用该登陆界面）</h5>
					<br />
				</div>
			</div>
			<div class="row ">
				<div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
					<div class="panel panel-default">
						<div class="panel-heading">
							<strong>请输入账号密码</strong>
						</div>
						<div class="panel-body">
							<form action="login" method="POST">
								<br />
								<div class="form-group input-group">
									<span class="input-group-addon"><i class="fa fa-tag"  ></i></span>
									<input name="username" type="text" class="form-control" placeholder="账号" />
								</div>
								<div class="form-group input-group">
									<span class="input-group-addon"><i class="fa fa-lock"  ></i></span>
									<input name="password" type="password" class="form-control"  placeholder="密码" />
								</div>
								<hr />
								<div style="float:right">
                                    <input type="submit" class="btn btn-primary" value="立即登录" />
                                    <a href="login" >test</a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>


		<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
		<script src="js/jquery-1.10.2.js" type="text/javascript"></script>
		<script src="js/bootstrap.min.js" type="text/javascript"></script>
		<script src="js/jquery.metisMenu.js" type="text/javascript"></script>
		<script src="js/custom.js" type="text/javascript"></script>

	</body>
</html>

