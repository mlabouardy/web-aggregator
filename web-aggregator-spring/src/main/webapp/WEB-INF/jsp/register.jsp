<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/taglib.jsp" %>

<form:form commandName="user" id="registrationForm">
	<c:if test="${param.success eq true}">
		<div class="alert alert-success">
			Registration successful !
		</div>
	</c:if>
	<div class="form-group">
		<label for="name">Name:</label> 
		<form:input path="name" cssClass="form-control" id="inputName" />
		<form:errors path="name"></form:errors>
	</div>
	<div class="form-group">
		<label for="email">Email:</label> 
		<form:input path="email" cssClass="form-control" id="inputEmail"/>
		<form:errors path="email"></form:errors>
	</div>
	<div class="form-group">
		<label for="password">Password:</label> 
		<form:password path="password" cssClass="form-control" id="inputPassword"/>
		<form:errors path="password"></form:errors>
	</div>
	<div class="form-group">
		<label for="password">Confirm password:</label> 
		<input type="password" id="password_confirm" name="password_confirm"  class="form-control"/>
	</div>
	<button type="submit" class="btn btn-default">Submit</button>
</form:form>

<script>
		$("#registrationForm").validate(
			{
				rules:{
					name:{
						required:true,
						minlength:3,
						remote:{
							url:"<spring:url value='/register/available.html'/>",
							type:"get",
							data:{
								username:function(){
									return $("#name").val();
								}
							}
						}
					},
					email:{
						email:true,
						required:true,
						minlength:1
					},
					password:{
						required:true,
						minlength:5
					},
					password_confirm:{
						required:true,
						minlength:5,
						equalTo: "#inputPassword"
					}
				},
				highlight:function(element){
					$(element).closest(".form-group").removeClass("has-success").addClass("has-error");
				},
				unhighlight:function(element){
					$(element).closest(".form-group").removeClass("has-error").addClass("has-success");
				}
			}		
		);
</script>
