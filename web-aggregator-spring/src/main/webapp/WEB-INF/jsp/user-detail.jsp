<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ include file="../layout/taglib.jsp" %>

<table class="table table-hover table-bordered">
	<thead>
		<th>Username</th>
		<th>Email</th>
	</thead>
	<tbody>
		<tr>
			<td>${user.name}</td>
			<td>${user.email}</td>
		</tr>
	</tbody>
</table>

<c:forEach items="${user.blogs}" var="blog">
	${blog.name}<br/>
	${blog.url}<br/> 
</c:forEach>
