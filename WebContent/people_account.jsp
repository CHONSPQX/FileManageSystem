<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>文章管理系统</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="gitcss/gitcss0.css" />
<link rel="stylesheet" href="gitcss/gitcss1.css" />
<link rel="stylesheet" href="gitcss/gitcss.css" />
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
					<div class="form-groupc">
						<input type="text" class="form-control" placeholder="Search"
							id="search">
					</div>
					<button class="btn btn-default">Submit</button>
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
	<br>
  	<br>
	<br>
	<div class="container">
		<div class="row">
			
			<div class="col-md-11">
				<div role="main">

				<div id="js-pjax-container" data-pjax-container>

					<div class="page-content container clearfix">

						<div class="col-3 float-left pr-4" role="navigation">
							<nav class="menu" data-pjax>
							<h3 class="menu-heading">Personal settings</h3>

							<a href="/settings/profile"
								class="js-selected-navigation-item menu-item"
								data-selected-links="avatar_settings /settings/profile">Profile</a>
							<a href="/settings/admin"
								class="js-selected-navigation-item selected menu-item"
								data-selected-links=" /settings/admin">Account</a> </nav>
						</div>


						<div class="col-9 float-left">


							<div class="Subhead">
								<h2 class="Subhead-heading">Change password</h2>
							</div>

							<!-- Change Password -->
							<!-- '"` -->
							<!-- </textarea></xmp> -->
							</option>
							</form>
							<div accept-charset="UTF-8" action="/account" class="edit_user"
								id="change_password" method="post">
								<div style="margin: 0; padding: 0; display: inline">
									<input name="utf8" type="hidden" value="&#x2713;" /><input
										name="_method" type="hidden" value="put" /><input
										name="authenticity_token" type="hidden"
										value="r/5tOlSeYmiPVb3Sr/3WKF7ULqrMkIMm31OwlvB0q4cANtpmq+9FHZCy01GvQYMvA+z43FUbhFNj7Oqb1mKA+Q==" />
								</div>
								<dl class="form-group password-confirmation-form">
									<dt>
										<label for="user_old_password">Old password</label>
									</dt>
									<dd>
										<input class="form-control form-control"
											id="user_old_password" 
											required="required" tabindex="2" type="password" />
									</dd>
								</dl>
								<dl class="form-group password-confirmation-form">
									<dt>
										<label for="user_new_password">New password</label>
									</dt>
									<dd>
										<input class="form-control form-control"
											id="user_new_password"
											required="required" tabindex="2" type="password" />
									</dd>
								</dl>
								<dl class="form-group password-confirmation-form">
									<dt>
										<label for="user_confirm_new_password">Confirm new
											password</label>
									</dt>
									<dd>
										<input class="form-control form-control"
											id="user_confirm_new_password"
											required="required"
											tabindex="2" type="password" />
									</dd>
								</dl>
								<p>
									<button class="btn mr-2" onclick="changePassword();">Update password</button>
									<span><a href="/password_reset">I forgot my password</a></span>
								</p>
							</div>
							<p class="text-small text-gray mt-3">
								<svg aria-hidden="true" class="octicon octicon-question"
									height="16" version="1.1" viewBox="0 0 14 16" width="14">
								<path fill-rule="evenodd"
									d="M6 10h2v2H6v-2zm4-3.5C10 8.64 8 9 8 9H6c0-.55.45-1 1-1h.5c.28 0 .5-.22.5-.5v-1c0-.28-.22-.5-.5-.5h-1c-.28 0-.5.22-.5.5V7H4c0-1.5 1.5-3 3-3s3 1 3 2.5zM7 2.3c3.14 0 5.7 2.56 5.7 5.7s-2.56 5.7-5.7 5.7A5.71 5.71 0 0 1 1.3 8c0-3.14 2.56-5.7 5.7-5.7zM7 1C3.14 1 0 4.14 0 8s3.14 7 7 7 7-3.14 7-7-3.14-7-7-7z" /></svg>
								Looking for two-factor authentication? You can find it in <a
									href="/settings/security">Security</a>.
							</p>


							<!-- Delete Account -->
							<div class="Subhead Subhead--spacious">
								<h2 class="Subhead-heading Subhead-heading--danger">Delete
									account</h2>
							</div>
							<p>Once you delete your account, there is no going back.
								Please be certain.</p>

							<p>
								<a href="#delete_account_confirmation"
									rel="facebox[.dangerzone]" class="btn btn-danger" tabindex="4">Delete
									your account</a>
							</p>

							<div id="delete_account_confirmation" style="display: none">
								<h2 class="facebox-header" data-facebox-id="facebox-header">Are
									you sure you want to do this?</h2>
								<div class="facebox-danger"
									data-facebox-id="facebox-description">
									<svg aria-hidden="true" class="octicon octicon-alert"
										height="16" version="1.1" viewBox="0 0 16 16" width="16">
									<path fill-rule="evenodd"
										d="M8.865 1.52c-.18-.31-.51-.5-.87-.5s-.69.19-.87.5L.275 13.5c-.18.31-.18.69 0 1 .19.31.52.5.87.5h13.7c.36 0 .69-.19.86-.5.17-.31.18-.69.01-1L8.865 1.52zM8.995 13h-2v-2h2v2zm0-3h-2V6h2v4z" /></svg>
									This is extremely important.
								</div>

								<p>
									We will <strong>immediately delete all of your
										repositories (24)</strong>, along with all of your forks, wikis,
									issues, pull requests, and GitHub Pages sites.
								</p>
								<p>You will no longer be billed, and your username will be
									available to anyone on GitHub.</p>
								<p>
									For more help, read our article "<a
										href="https://help.github.com/articles/deleting-your-user-account">Deleting
										your user account</a>".
								</p>

								<hr class="facebox-separator">

								
						
								<form accept-charset="UTF-8" action="/users/CHONSPQX"
									method="post">
									<div style="margin: 0; padding: 0; display: inline">
										<input name="utf8" type="hidden" value="&#x2713;" /><input
											name="_method" type="hidden" value="delete" /><input
											name="authenticity_token" type="hidden"
											value="IUFmem3sUwLEjJhX243ueQuccgxS03wBdYOyrG/mXofPOuuukmQin/I8Eq59KS/9G+OWNg95dmNxwglrAM7Q6A==" />
									</div>
									<p>
										<label for="sudo_login">Your username or email:</label> <input
											type="text" id="sudo_login" name="sudo_login"
											class="form-control input-block"
											pattern="[cC][hH][oO][nN][sS][pP][qQ][xX]|1264596728@[qQ][qQ]\.[cC][oO][mM]"
											required>
									</p>
									<p>
										<label for="confirmation_phrase"> To verify, type <span
											class="confirmation-phrase do-not-copy-me notranslate">delete
												my account</span> below:
										</label> <input type="text" id="confirmation_phrase"
											name="confirmation_phrase" class="form-control input-block"
											pattern="delete my account" required>
									</p>
									<p>
										<label for="sudo_password"> Confirm your password: </label> <input
											class="form-control form-control input-block"
											id="sudo_password" name="sudo_password" type="password"
											value="" />
									</p>

									<button type="submit" class="btn btn-block btn-danger"
										data-disable-invalid>Cancel plan and delete this
										account</button>
								</form>
							</div>

						</div>
					</div>

				</div>
				<div class="modal-backdrop js-touch-events"></div>
			</div>
		</div>
		<div class="col-md-1"></div>
	</div>
	</div>

	<nav class="navbar navbar-inverse navbar-fixed-bottom">
		<div class="container">CopyRight@QYZ team</div>
	</nav>

</body>
<script>
	function Search() {
		var file = document.getElementById("search").value;
		//alert(file);
		window.location.href = "SearchAction!SearchFile?CheckedFile=" + file;
	}
	function changePassword()
	{
		var oldpwd=document.getElementById("user_old_password").value;
		var newpwd=document.getElementById("user_new_password").value;
		var conpwd=document.getElementById("user_confirm_new_password").value;
		var data = {
			    oldpassword : oldpwd,
				newpassword : newpwd
			};
			$.ajax({
				url : "AjaxAction!changePassword",
				type : "POST",
				data : data,
				dataType : "json"
			}).done(function(data) {
				alert("成功");
				window.location.reload();
				//var file=document.getElementById("filename").innerText;
				// alert(file);
				//window.location.href="FileAction!showPublic?filename=shared/admin/2333.html";
			}).fail(function() {
				alert("失败");
				window.location.reload();
				//var file=document.getElementById("filename").innerText;
				// alert(file);
				//window.location.href="FileAction!showPublic?filename=shared/admin/2333.html";
			});
	}
</script>
</html>