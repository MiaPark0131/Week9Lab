<%-- 
    Document   : users
    Created on : 19-Oct-2022, 7:53:10 PM
    Author     : meeye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users</title>
    </head>
    <body>
        <h1>Manage Users</h1>
        <table border="1">
            <tr>
                <th>Email</th><th>First Name</th><th>Last Name</th><th>Role</th><th></th><th></th>
            </tr>
            <c:forEach items="${users}" var="user">
            <tr>
                <td>${user.email}</td><td>${user.firstname}</td><td>${user.lastname}</td><td>${user.role.roleName}</td>
                <td><a href="<c:url value="user">
                           <c:param name="action" value="edit"/>
                           <c:param name="userEmail" value="${user.email}"/>
                       </c:url>">Edit</a></td>
                <td><a href="user?action=delete&amp;userEmail=${userEmail}">Delete</a></td>
            </tr>
            </c:forEach>
        </table>
        <c:if test="${message eq null}">
        <h2>Add User</h2>
        <form action="user" method="post">
            Email: <input type="text" name="email" value=""><br>
            First name: <input type="text" name="firstname" value=""><br>
            Last name: <input type="text" name="lastname" value=""><br>
            Password: <input type="text" name="password" value=""><br>
            <label for="role">Role:</label>
                <select id="role" name="role">
                    <c:forEach items="${roles}" var="role">
                        <option value="${role.roleID}">${role.roleName}</option>
                    </c:forEach>
                </select>
            <input type="hidden" name="action" value="add"><br>
            <input type="submit" value="Add user">
        </form>
        </c:if>
        <c:if test="${message eq 'edit'}">
        <h2>Edit User</h2>
        <form action="user" method="post">
            Email: ${user.email}<br>
            First name: <input type="text" name="firstname" value="${user.firstname}"><br>
            Last name: <input type="text" name="lastname" value="${user.lastname}"><br>
            Password: <input type="text" name="password" value=""><br>
            <label for="role">Role: ${user.role.roleName}</label>
                <select id="role" name="role">
                    <c:forEach items="${roles}" var="role">
                        <option value="${role.roleID}"
                                <c:if test="${user.role.roleID == role.roleID}"> selected</c:if>
                        >${role.roleName}</option>
                    </c:forEach>
                </select>
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="email" value="${user.email}"><br>
            <input type="submit" value="Edit user">
        </form>
        </c:if>
    </body>
</html>