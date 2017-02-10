<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>

<%
    /*
     * ELB checks your application's health by periodically
     * sending an HTTP HEAD request to a resource in your application. By
     * default, this is the root or default resource in your application,
     * but can be configured for each environment.
     *
     * Here, we report success as long as the app server is up, but skip
     * generating the whole page since this is a HEAD request only. You
     * can employ more sophisticated health checks in your application.
     */
    if (request.getMethod().equals("HEAD")) return;
%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
    <title>A sample app for CodeDeploy</title>
    <meta name="viewport" content="initial-scale=1.0">
    <link rel='stylesheet' href='webjars/bootstrap/3.2.0/css/bootstrap.min.css'>
    <link rel='stylesheet' href='webjars/bootstrap/3.2.0/css/bootstrap-theme.min.css'>
    <link rel='stylesheet' href='css/theme.css'>
</head>
<body role="document">
  <nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#">Test Application</a>
      </div>
      <div id="navbar" class="navbar-collapse collapse">
        <ul class="nav navbar-nav">
          <li class="active"><a href="#">Home</a></li>
        </ul>
      </div>
    </div>
  </nav>
  <% if (!((String) request.getAttribute("deploymentGroupName")).contains("Production")) { %>
     <div class="container theme-showcase" role="main">
	 <div class="jumbotron">
      <p><strong>AWS CodeDeploy Application:</strong> ${applicationName}</p>
      <p><strong>AWS CodeDeploy Deployment Group:</strong> ${deploymentGroupName}</p>
      <strong>Amazon EC2 Instances associated with this fleet:</strong>
      <ul>
        <% for (final String instance : (List<String>) request.getAttribute("instanceIds")) { %>
          <% if (((Map<String, String>) request.getAttribute("instanceStates")).containsKey(instance)) { %>
            <li> <%= instance %> - Instance Health: <%= ((Map<String, String>) request.getAttribute("instanceStates")).get(instance) %></li>
          <% } else { %>
            <li> <%= instance %> - Instance Health: Unknown</li>
          <% } %>
        <% } %>
      </ul>
	</div>
    </div>
  <% } %>
  <script type="text/javascript" src="webjars/jquery/2.1.1/jquery.min.js"></script>
  <script type="text/javascript" src="webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</body>
</html>
