<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/taglib.jsp" %>

<form:form commandName="user">
	<c:if test="${param.success eq true}">
		<div class="alert alert-success">
			Registration successful !
		</div>
	</c:if>
	<div class="form-group">
		<label for="name">Name:</label> 
		<form:input path="name" cssClass="form-control" id="inputName" />
	</div>
	<div class="form-group">
		<label for="email">Email:</label> 
		<form:input path="email" cssClass="form-control" id="inputEmail"/>
	</div>
	<div class="form-group">
		<label for="password">Password:</label> 
		<form:password path="password" cssClass="form-control" id="inputPassword"/>
	</div>
	<button type="submit" class="btn btn-default">Submit</button>
</form:form>
