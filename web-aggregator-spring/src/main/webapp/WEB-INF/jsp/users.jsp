<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/taglib.jsp" %>

<table class="table table-hover table-bordered table-striped">
	<thead>
		<th>Username</th>
	</thead>
	<tbody>
		<c:forEach items="${users}" var="user">
			<tr>
				<td>
					<a href="<spring:url value="/users/${user.id}.html"/>">${user.name}</a>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>