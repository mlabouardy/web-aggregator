<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/taglib.jsp" %>

<table class="table table-hover table-bordered table-striped">
	<thead>
		<th colspan="2">Username</th>
	</thead>
	<tbody>
		<c:forEach items="${users}" var="user">
			<tr>
				<td>
					<a href="<spring:url value="/users/${user.id}.html"/>">${user.name}</a>
				</td>
				<td>
					<a href="/user/delete/${user.id}.html" class="btn btn-success">Delete</a>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
