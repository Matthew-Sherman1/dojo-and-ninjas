<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Add New Book</title>
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
	<div>
		<h2>Add A Ninja</h2>
		<div>
			<form:form action="/new/ninja" method="POST" modelAttribute="ninja">
				<div>
					<form:label path="firstName" for="formInput">First Name
                                    </form:label>
					<form:errors path="firstName" />
					<form:input type="text" id="formInput" path="firstName"
						placeholder="" />
				</div>
				<div>
					<form:label path="lastName" for="formControlTextarea">
                                        Last Name:</form:label>
					<form:errors path="lastName" />
					<form:input id="formControlTextarea" path="lastName" />
				</div>
				<div>
					<form:label path="age" for="formInput">Age:
                                    </form:label>
					<form:errors path="age" />
					<form:input type="number" id="formInput" path="age" />
				</div>
				<div>
					<form:label path="dojo" for="formInput">Location
                                    </form:label>
					<form:errors path="dojo" />
					<form:select id="formInput" path="dojo">
						<c:forEach var="oneDojo"
							items="${dojos
                                        }">
							<form:option value="${oneDojo.id}" path="dojo">
								<c:out value="${oneDojo.dojoName}" />
							</form:option>

						</c:forEach>
					</form:select>
				</div>
				<div>
					<input type="submit" value="Submit">
				</div>
			</form:form>
		</div>
	</div>
</body>

</html>