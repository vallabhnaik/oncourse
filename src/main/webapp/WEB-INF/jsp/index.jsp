<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OnCourse</title>
</head>
<body>
<h2>OnCourse</h2>
<p>
  <security:authorize access="anonymous">
    <a href="<c:url value='/login' />">Login</a>
  </security:authorize>
  <security:authorize access="authenticated">
    <security:authorize access="hasAnyRole('ADMIN','ADVISOR')">
      <a href="course/list">Courses</a> |
      <a href="department/list">Departments</a> |
      <a href="program/list">Programs</a> |
    </security:authorize>
    <a href="grade/list">Grades</a> |
    <a href="<c:url value='/logout' />">Logout</a>
  </security:authorize>
</p>
<p>OnCourse is a system that helps students to stay on course in their
academic career.</p>
</body>
</html>
