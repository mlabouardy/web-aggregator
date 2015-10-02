<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/taglib.jsp"%>



<!-- Modal -->
<form:form commandName="blog">
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">New Blog</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="name">Name:</label>
						<form:input path="name" cssClass="form-control" id="inputName" />
					</div>
					<div class="form-group">
						<label for="url">URL:</label>
						<form:input path="url" cssClass="form-control" id="inputURL" />
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary">Submit</button>
				</div>
			</div>
		</div>
	</div>
</form:form>
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

<!-- Button trigger modal -->
	<button type="button" class="btn btn-primary btn-lg"
		data-toggle="modal" data-target="#myModal">New Blog</button>

<br/><br/>
<div class="panel panel-primary">
	<div class="panel-heading">Liste des blogs</div>
	<div class="panel-body">
		<table class="table table-hover table-bordered table-striped">
			<thead>
				<th>Name</th>
				<th>URL</th>
			</thead>
			<tbody>
				<c:forEach items="${user.blogs}" var="blog">
					<tr>
						<td>${blog.name}</td>
						<td>${blog.url}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<script>
	$(document).ready(function(){
		$('.nav-tabs a:first').tab('show'); // Select first tab
	});
</script>

<div>

  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
  	<c:forEach items="${user.blogs}" var="blog">
   		<li role="presentation" class=""><a href="#blog_${blog.name}" aria-controls="${blog.name}" role="tab" data-toggle="tab">${blog.name}</a></li>
   </c:forEach>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
  	<c:forEach items="${user.blogs}" var="blog">
  		<div role="tabpanel" class="tab-pane" id="blog_${blog.name}">
  		${blog.url}<br/>
  		<a href="/blog/delete/${blog.id}.html" class="btn btn-success">Delete</a>
  		</div>
  	 </c:forEach>
  </div>

</div>
