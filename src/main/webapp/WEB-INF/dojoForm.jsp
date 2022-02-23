<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Title Here</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" type="text/css" href="/css/style.css">
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<!-- YOUR own local JS -->
<script type="text/javascript" src="/js/app.js"></script>
</head>
<body>
	<!-- Enter body here -->
	<div>
		<div>
			<form:form action="/new/dojo" method="post" modelAttribute="dojo">
				<div>
					<form:label path="dojoName"> Dojo Name</form:label>
					<form:errors path="dojoName" />
					<form:input path="dojoName" />
				</div>

				<div>
					<button>Submit</button>
				</div>
			</form:form>

		</div>
		<div>
			<div>
				<table>
					<thead>
						<tr>
							<th>Location</th>

							<th>Actions</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="dojo" items="${dojos}">
							<tr>
								<td><c:out value="${dojo.dojoName }" /></td>

								<td>
									<div>
										<a href="/view/dojo/${dojo.id}">View Dojo</a>

									</div>
								</td>

							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
</body>
</html>