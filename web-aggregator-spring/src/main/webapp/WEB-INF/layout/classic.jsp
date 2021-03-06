<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras"
	prefix="tilesx"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<tilesx:useAttribute name="current" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

<!-- JQuery -->

<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"></script>
<title><tiles:getAsString name="title" /></title>

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>


</head>
<body>

	<div class="container">
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar">
						<span class="sr-only"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span> <span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="<spring:url value="/"/>">WAJ</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li class="${current == 'index' ? 'active':''}"><a
							href="<spring:url value="/"/>">Home</a></li>
						<security:authorize access="hasRole('ROLE_ADMIN')">
							<li class="${current == 'users' ? 'active':''}"><a
								href="<spring:url value="/users.html"/>">Users</a></li>
						</security:authorize>
						<security:authorize access="isAuthenticated()">
							<li class="${current == 'user-detail' ? 'active':''}"><a
							href="<spring:url value="/profile.html"/>">Profile</a></li>
						</security:authorize>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<security:authorize access="!isAuthenticated()">
							<li class="${current == 'register' ? 'active':''}"><a
								href="<spring:url value="/register.html"/>">Register <span
									class="sr-only">(current)</span></a></li>
							<li class="${current == 'login' ? 'active':''}"><a
								href="<spring:url value="/login.html"/>">Login <span
									class="sr-only">(current)</span></a></li>
						</security:authorize>
						<security:authorize access="isAuthenticated()">
							<li class="${current == 'logout' ? 'active':''}"><a
								href="<spring:url value="logout"/>">Logout <span
									class="sr-only">(current)</span></a></li>
						</security:authorize>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
			<!--/.container-fluid -->
		</nav>


		<tiles:insertAttribute name="body" />
		<br />

		<tiles:insertAttribute name="footer" />

	</div>
</body>
</html>