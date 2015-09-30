<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form class="form-signin" action="/j_spring_security_check"
	method="post">
	<h2 class="form-signin-heading">Please sign in</h2>
	<div class="form-group">
		<label for="inputEmail" class="sr-only">Name</label> <input
			type="text" name="j_username" id="inputEmail" class="form-control"
			placeholder="Email address" required autofocus>
	</div>
	<div class="form-group">
	<label for="inputPassword" class="sr-only">Password</label> <input
		type="password" name="j_password" id="inputPassword"
		class="form-control" placeholder="Password" required>
	</div>
	<button class="btn btn-lg btn-primary btn-block" type="submit">Sign
		in</button>
</form>