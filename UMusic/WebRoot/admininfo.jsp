<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.luyi.umusic.model.Admin" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
 
<% 
	String path = request.getContextPath(); 
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 

<html> 
	<head>
		<title>JSP for ShareForm form</title>
		<link rel="stylesheet" href="<%=basePath%>rez/data/css/style.css" type="text/css"></link>
	</head>
	<body>
	<div id="panel">
		<div id="head">w<img src="<%=basePath%>rez/data/images/bg_login.jpg"></img></div>
		<div id="navigation">
			<span id="logo" style="font-size:18px;font-weight:bold;font-style:italic;">
				UMusic
			</span>
			<ul id="menu">
			  <li><a href="/UMusic/shareM.do?method=all">首页</a></li>
			  <li><a href="/UMusic/shareM.do?method=all">音乐</a>
			    <ul>
			    <li><a href="sharem.jsp">分享音乐</a></li>
			    <li><a href="/UMusic/shareM.do?method=list">我的乐库</a></li>
			    </ul>
			  </li>
			  <li><a href="useredit.jsp">个人</a>
			    <ul>
			    <li><a href="/UMusic/shareP.do?method=list">我的相册</a></li>
			    <li><a href="useredit.jsp">个人资料</a></li>
			    </ul>
			  </li>
			  <li><a href="guestbook.jsp">留言</a>
			  </li>
			  <li><a href="adminlogin.jsp">管理</a>
			    <ul>
			    <li><a href="adminlogin.jsp">管理员登录</a></li>
			    <li><a href="admininfo.jsp">管理员资料</a></li>
			    <li><a href="admin.jsp">维护</a></li>
			    </ul>
			  </li>
			  <li><a href="about.jsp">关于</a>
			    <ul>
			    <li><a href="about.jsp">联系Luyi</a></li>
			    <li><a href="about.jsp">特别说明</a></li>
			    </ul>
			  </li>
			  <li id="login">
			  <%
				if(request.getSession().getAttribute("userName") == null &&
					request.getSession().getAttribute("userPwd") == null)
				{
				%>
			  <a href="login.jsp">登录</a>
			  <% 
			  	}
			  	else
			  	{
			  %>
			  <font style="color:red;font-size:16px;font-style:italic;">
			  <%=request.getSession().getAttribute("userName").toString() %>
			  </font>
			  <a href="/UMusic/user.do?method=cancel">注销</a>
			  <% 
			  }
			  %>
			  </li>
			</ul>
		</div>
		<%
		if(request.getSession().getAttribute("adminName") != null &&
			request.getSession().getAttribute("adminPwd") != null)
		{
		%>
	
		<div id="main">
			<table id="admin">
				<tr>
					<td>
					管理员
					</td>
					<td>
					上次登录时间
					</td>
					<td>
					上次登录IP
					</td>
				</tr>
				<% 
				List adminlist = (List)request.getSession().getAttribute("adminlist");
		    	if(adminlist != null)
		    	{
			    	Iterator adminitr = adminlist.iterator();
	
					while(adminitr.hasNext())
					{
						Admin a = (Admin)adminitr.next();
				%>
				<tr>
					<td>
						<%=a.getAdminName() %>
					</td>
					<td>
						<%=a.getLastDate() %>
					</td>
					<td>
						<%=a.getLastIp() %>
					</td>
				</tr>
				<% 
					}
				}
				%>
			</table>
		</div>
		<%	
			}
			else
			{
		%>
		<div id="main">
			<center>
				<h4>管理员未登录</h4>
				<hr/>
				<a href="adminlogin.jsp">请先登录>></a>
				<hr/>
				<img src="<%=basePath%>rez/data/images/error.jpg"></img>
			</center>
		</div>
		<%	
			}
		%>
		<div id="footer">
			<span id="you">你</span>
			<span id="you">的</span>
			<span id="you">音</span>
			<span id="you">乐</span>
			<span id="me">我</span>
			<span id="me">的</span>
			<span id="me">追</span>
			<span id="me">求</span>	
		</div>
	</div>
	</body>
	
</html>

