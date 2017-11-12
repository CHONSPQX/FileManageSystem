﻿<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>玩转Bootstrap</title>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script type="text/javascript" src="js/jquery.js"></script>
  <script type="text/javascript" src="bootstrap/js/popper.js"></script>
  <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="bootstrap/js/jquery.easing.js"></script>
</head>
<body>
  <nav class="navbar navbar-inverse">
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
          <li><a href="#">我的空间</a></li>
          <li><a href="#">共享空间</a></li>
          <li class="dropdown"><a href="#" class="dropdown-toggle"
            data-toggle="dropdown" role="button" aria-haspopup="true"
            aria-expanded="false">Dropdown <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="#">Action</a></li>
              <li><a href="#">Another action</a></li>
              <li><a href="#">Something else here</a></li>
              <li role="separator" class="divider"></li>
              <li><a href="#">Separated link</a></li>
              <li role="separator" class="divider"></li>
              <li><a href="#">One more separated link</a></li>
            </ul></li>
        </ul>
         <div class="navbar-form navbar-left">
              <div class="form-group">
                <input type="text" class="form-control" placeholder="Search" id="search">
              </div>
              <button class="btn btn-default" onclick="Search();">Submit</button>
        </div>
        <ul class="nav navbar-nav navbar-right">
          <li><a href="login_user.jsp">登录</a></li>
          <li><a href="register_user.jsp">注册</a></li>
          <li class="dropdown"><a href="#" class="dropdown-toggle"
            data-toggle="dropdown" role="button" aria-haspopup="true"
            aria-expanded="false">用户<span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="#">Action</a></li>
              <li><a href="#">Another action</a></li>
              <li><a href="#">Something else here</a></li>
              <li role="separator" class="divider"></li>
              <li><a href="#">Separated link</a></li>
            </ul></li>
        </ul>
      </div>
      <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
  </nav>
<div class="container">
<div class="row">
<div class="col-md-1"></div>
<div class="col-md-10">
 <div class="jumbotron" >
 <div class="row">
 <div class="col-md-1"></div>
  <div class="col-md-10">
  <h1>欢迎来到文章管理系统!</h1>
  </div>
  <div class="col-md-1"></div>
  </div>    
</div>
</div>
<div class="col-md-1"></div>
</div>
</div>

<nav class="navbar navbar-inverse navbar-fixed-bottom">
  <div class="container">
  CopyRight@QYZ team
  </div>
</nav>

</body>
<script>
function Search()
{  
  var file=document.getElementById("search").value;
  //alert(file);
   window.location.href="SearchAction!SearchFile?CheckedFile="+file;
}
</script>
</html>