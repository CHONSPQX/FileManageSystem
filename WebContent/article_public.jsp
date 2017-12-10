<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="Comment.Comment"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
String session_user = (String) session.getAttribute("userID");
if (session_user == null) 
	response.sendRedirect("index.jsp");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title>文章详情</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="bootstrap/js/popper.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="bootstrap/js/jquery.easing.js"></script>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Brand</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="UserAction!UserCheckFile">个人文件
						<span class="sr-only">(current)</span>
				</a></li>
				<li ><a href="PublicTextAction!CheckFile">共享文件
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="active" ><a href="shared_text.jsp">共享空间</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">用户<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="UserAction!UserLogout">用户注销</a></li>
						<li><a href="people_account.jsp">密码管理</a></li>
						<li><a href="UserAction!getUserProfile">个人信息</a></li>
					</ul></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>
	<br>
  <br>
  <br>
	<%
	  String context = (String) request.getAttribute("readContext");
				String filename = (String) request.getAttribute("filename");
				ArrayList<Comment> allcomment = (ArrayList<Comment>) request.getAttribute("commentTable");
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="panel panel-default">
					<div class="panel-heading">文章详情</div>
					<div class="panel-body">
						<div class="btn-group btn-group-justified" role="group"
							aria-label="...">
							<div class="btn-group" role="group">
								<button type="button" class="btn btn-default"
									onclick="pageBack();">返回</button>
							</div>
						</div>
					</div>
					<div class="panel-body">
						<div class="panel panel-default">
							<div class="panel-heading" id="filename"><%=filename%></div>
							<div class="panel-body"
								style="overflow: scroll; max-height: 550px; height: 550px">
								<div><%=context%></div>
							</div>
						</div>
					</div>
					<div class="panel-footer">最后更新时间：</div>
					<div class="panel-footer">
						用户评论区：
						<%
					  if (allcomment != null && allcomment.size() > 0)
									for (Comment com : allcomment) {
					%>
						<div class="row">
							<div class="col-md-1"><%=com.getNumber()%></div>
							<div class="col-md-11">
								<div class="media">
									<a class="pull-left"> <img class="media-object"
										src="images/22.jpg" alt="Media Object"
										style="width: 25px; height: 25px"></a>
									<div class="media-body">
										<h4 class="media-heading">
											<div class="row">
												<div class="col-md-9">
													<strong><%=com.getOwner()%></strong>
												</div>
												<div class="col-md-3"><%=com.getCommentTime()%></div>
											</div>
										</h4>
										<%=com.getMessage()%>
									</div>
								</div>
							</div>
						</div>
						<%
						  }
						%>
					</div>
					<!-- 用户发表评论的文本输入框 -->
					<div class="panel-footer">等你评论：</div>
					<div class="panel-body" align="center">
						<div>
							<div class="text-box textarea-box">
								<textarea id="comment" rows="2" cols="70"
									style="width: 100%; height: 100px; resize: none"
									onfocus="if(this.value == 'Your Message') this.value='';"
									onblur="if(this.value == '') this.value='Your Message';">Your Message</textarea>
							</div>
							</br>
							<button class="btn btn-default" onclick="sendComment();">发表</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
	function sendComment() {
		var file = document.getElementById("filename").innerText;
		var comment = document.getElementById("comment").value;
		var data = {
			filename : file,
			commentcontext : comment
		};
		$.ajax({
			url : "AjaxAction!sendComment",
			type : "POST",
			data : data,
			dataType : "json"
		}).done(function(data) {
			//alert("成功");
			window.location.reload();
		}).fail(function() {
			alert("失败");
			window.location.reload();
		});
	}
	function pageBack() {
		history.go(-1);
	}
</script>
</html>