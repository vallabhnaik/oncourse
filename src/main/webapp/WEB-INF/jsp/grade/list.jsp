<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OnCourse - Grades</title>
</head>
<body>
<h2><a href="..">OnCourse</a></h2>
<h3>${user.name}'s Grades</h3>
<form action="add" method="post">
<p>
  <select name="season">
    <option value="F">Fall</option>
    <option value="W">Winter</option>
    <option value="S">Spring</option>
    <option value="X">Summer</option>
  </select>
  <select name="year">
    <c:forEach items="${years}" var="year">
    <option>${year}</option>
    </c:forEach>
  </select>
  <select name="courseId">
    <c:forEach items="${courses}" var="course">
    <option value="${course.id}">${course.code}</option>
    </c:forEach>
  </select>
  <select name="gradeId">
    <c:forEach items="${grades}" var="grade">
    <option value="${grade.id}">${grade.symbol}</option>
    </c:forEach>
  </select>
  <input type="submit" name="add" value="Add" />
</p>
</form>

<table border="1">
<tr><th>Term</th><th>Course</th><th>Grade</th></tr>
<c:forEach items="${gradeRecords}" var="gradeRecord">
<tr>
  <td>${gradeRecord.term.fullName}</td>
  <td>${gradeRecord.course.code}</td>
  <td style="text-align: center">${gradeRecord.grade.symbol}</td>
</tr>
</c:forEach>
</table>
</body>
</html>
