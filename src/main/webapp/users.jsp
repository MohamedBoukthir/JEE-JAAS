<%@ page import="java.util.List" %>
<%@ page import="com.wissem.business.entities.User" %>
<%@ page import="com.wissem.util.DateFormatter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Users</title>
  <link rel="stylesheet" href="style/main.css">
  <script src="https://cdn.tailwindcss.com"></script>
</head>

<%
  if (session.getAttribute("user") == null) {
    response.sendRedirect("login.jsp");
  }
%>
<body>
<!-- Navbar -->
<nav class="bg-[#1D9BF0] sticky z-[99] top-0 left-0 text-white flex justify-between items-center py-3 px-5">
  <div class="flex items-center gap-5">
    <a href="/" class="text-2xl font-semibold tracking-wider">FEED</a>
    <a href="/users" class="text-base">users</a>
  </div>
  <form action="${pageContext.request.contextPath}/logout" method="POST" class="flex items-center space-x-5 text-xs">
    <div class="flex items-center space-x-5">
      <div class="w-10 h-10 rounded-full grid place-items-center bg-black text-white">
        <p class="uppercase font-medium">
          <% User user1 = (User) session.getAttribute("user");
            if (user1 != null) { %>
          <%= user1.getInitials() %>
          <% } %>
        </p>
      </div>
      <button class="btn btn-white" type="submit">Log out</button>
    </div>
  </form>
</nav>
<main class="w-full px-10 py-8">
  <h1 class="text-2xl font-semibold leading-tight mb-5">Accounts</h1>
  <div class="inline-block w-[840px] shadow-md rounded-lg overflow-hidden">
    <table class="table-auto w-full leading-normal">
      <thead>
      <tr>
        <th
          class="px-5 py-3 border-b-2 border-gray-200 bg-gray-200 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider"
        >
          #
        </th>
        <th
          class="px-5 py-3 border-b-2 border-gray-200 bg-gray-200 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider"
        >
          Fullname
        </th>
        <th
          class="px-5 py-3 border-b-2 border-gray-200 bg-gray-200 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider"
        >
          Email
        </th>
        <th
          class="px-5 py-3 border-b-2 border-gray-200 bg-gray-200 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider"
        >
          Member since
        </th>
        <th
          class="px-5 py-3 border-b-2 border-gray-200 bg-gray-200 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider"
        >
          Role
        </th>
        <th
          class="px-5 py-3 border-b-2 border-gray-200 bg-gray-200 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider"
        >
          Action
        </th>
      </tr>
      </thead>
      <tbody>
      <%
        List<User> users = (List<User>) request.getAttribute("users");
        for (User user : users) {
      %>
      <tr>
        <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
          <p class="text-gray-900 whitespace-no-wrap"><%= user.getId() %></p>
        </td>
        <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
          <div class="flex items-center">
            <div class="w-10 h-10 rounded-full grid place-items-center bg-[#1D9BF0]/70 text-white">
              <p class="uppercase">
              <%= user.getInitials() %>
              </p>
            </div>
            <div class="ml-3">
              <p class="text-gray-900 whitespace-no-wrap">
                <%= user.getFullname() %>
              </p>
            </div>
          </div>
        </td>
        <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
          <p class="text-gray-900 whitespace-no-wrap"><%= user.getEmail() %></p>
        </td>
        <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
          <p class="text-gray-900 whitespace-no-wrap"><%= DateFormatter.formatToCustomPattern(user.getCreatedAt(), "MMM d, yyyy") %></p>
        </td>
        <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                <span class="relative inline-block px-3 py-1 font-semibold text-green-900 leading-tight">
                  <span class="absolute inset-0 bg-green-200 opacity-50 rounded-full"></span>
                  <span class="relative capitalize text-xs"><%= user.getRole() %></span>
                </span>
        </td>
        <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
          <select
            class="text-black/70 bg-white px-3 py-2 transition-all cursor-pointer hover:border-blue-600/30 border border-gray-200 rounded-lg outline-blue-600/50 appearance-none invalid:text-black/30">
            <option value="role" disabled selected>Role</option>
            <option value="ADMIN">Admin</option>
            <option value="WRITER">Writer</option>
            <option value="READER">Reader</option>
          </select>
        </td>
      </tr>
      <% } %>
      </tbody>
    </table>
  </div>
</main>
</body>
</html>
