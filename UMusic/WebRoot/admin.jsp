<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.luyi.umusic.model.*" %>
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
		<script>
			function music()
			{
				document.getElementById('adminuser').style.display = "none";
				document.getElementById('adminmusic').style.display = "block";
				document.getElementById('adminfeedback').style.display = "none";
				document.getElementById('adminguestbook').style.display = "none";
			}
			function user()
			{
				document.getElementById('adminuser').style.display = "block";
				document.getElementById('adminmusic').style.display = "none";
				document.getElementById('adminfeedback').style.display = "none";
				document.getElementById('adminguestbook').style.display = "none";
			}
			function feedback()
			{
				document.getElementById('adminuser').style.display = "none";
				document.getElementById('adminmusic').style.display = "none";
				document.getElementById('adminfeedback').style.display = "block";
				document.getElementById('adminguestbook').style.display = "none";
			}
			function guestbook()
			{
				document.getElementById('adminuser').style.display = "none";
				document.getElementById('adminmusic').style.display = "none";
				document.getElementById('adminfeedback').style.display = "none";
				document.getElementById('adminguestbook').style.display = "block";
			}
		</script>
	</head>
	<body>
	<div id="panel">
		<div id="head"><img src="<%=basePath%>rez/data/images/bg_login.jpg"></img></div>
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
			<div id="adminleft">
				<span><a href="#" onClick="user()">
				用户管理</a>
				</span><br/>
				<span><a href="#" onClick="music()">
				音乐管理</a>
				</span><br/>
				<span><a href="#" onClick="feedback()">
				评论管理</a>
				</span><br/>
				<span><a href="#" onClick="guestbook()">
				留言管理</a>
				</span><br/>
				<span><a href="/UMusic/admin.do?method=all">查看日志</a></span><br/>
			</div>
			<div id="adminright">
				<table id="adminuser" style="display:block;">
				<tr>
					<td>
					ID
					</td>
					<td>
					姓名
					</td>
					<td>
					性别
					</td>
					<td>
					邮箱
					</td>
					<td>
					地址
					</td>
					<td>
					操作
					</td>
				</tr>
				<% 
				List userlist = (List)request.getSession().getAttribute("userlist");
		    	if(userlist != null)
		    	{
			    	Iterator useritr = userlist.iterator();
	
					while(useritr.hasNext())
					{
						UserInfo u = (UserInfo)useritr.next();
				%>
				<tr>
					<td>
						<%=u.getId() %>
					</td>
					<td>
						<%=u.getUserName() %>
					</td>
					<td>
						<%=u.getSex() %>
					</td>
					<td>
						<%=u.getEmail() %>
					</td>
					<td>
						<%=u.getAddress() %>
					</td>
					<td>
						<a href="#">删除</a>
					</td>
				</tr>
				<% 
					}
				}
				%>
			</table>
				<table id="adminmusic" style="display:none;">
				<tr>
					<td>
					音乐名称
					</td>
					<td>
					用户ID
					</td>
					<td>
					储存路径
					</td>
					<td>
					上传时间
					</td>
					<td>
					操作
					</td>
				</tr>
				<% 
				List musiclist = (List)request.getSession().getAttribute("musiclist");
		    	if(musiclist != null)
		    	{
			    	Iterator musicitr = musiclist.iterator();
	
					while(musicitr.hasNext())
					{
						Music m = (Music)musicitr.next();
				%>
				<tr>
					<td>
						<%=m.getMusicTitle() %>
					</td>
					<td>
						<%=m.getUserId() %>
					</td>
					<td>
						<%=m.getMusicPath() %>
					</td>
					<td>
						<%=m.getPubTime() %>
					</td>
					<td>
						<a href="#">删除</a>
					</td>
				</tr>
				<% 
					}
				}
				%>
			</table>
			<table id="adminfeedback" style="display:none;">
				<tr>
					<td>
					评论用户
					</td>
					<td>
					评论内容
					</td>
					<td>
					评论时间
					</td>
					<td>
					所属音乐
					</td>
					<td>
					操作
					</td>
				</tr>
				<% 
				List feedbacklist = (List)request.getSession().getAttribute("feedbacklist");
		    	if(feedbacklist != null)
		    	{
			    	Iterator feedbackitr = feedbacklist.iterator();
	
					while(feedbackitr.hasNext())
					{
						Feedback f = (Feedback)feedbackitr.next();
				%>
				<tr>
					<td>
						<%=f.getUserName() %>
					</td>
					<td>
						<%=f.getContent() %>
					</td>
					<td>
						<%=f.getPubTime() %>
					</td>
					<td>
						<%=f.getMusicId() %>
					</td>
					<td>
						<a href="#">删除</a>
					</td>
				</tr>
				<% 
					}
				}
				%>
			</table>
			<table id="adminguestbook" style="display:none;">
				<tr>
					<td>
					用户
					</td>
					<td>
					邮箱
					</td>
					<td>
					主题
					</td>
					<td>
					正文
					</td>
					<td>
					时间
					</td>
					<td>
					操作
					</td>
				</tr>
				<% 
				List guestbooklist = (List)request.getSession().getAttribute("guestbooklist");
		    	if(guestbooklist != null)
		    	{
			    	Iterator guestbookitr = guestbooklist.iterator();
	
					while(guestbookitr.hasNext())
					{
						Guestbook g = (Guestbook)guestbookitr.next();
				%>
				<tr>
					<td>
						<%=g.getName() %>
					</td>
					<td>
						<%=g.getEmail() %>
					</td>
					<td>
						<%=g.getTitle() %>
					</td>
					<td>
						<%=g.getContent() %>
					</td>
					<td>
						<%=g.getPubDate() %>
					</td>
					<td>
						<a href="#">删除</a>
					</td>
				</tr>
				<% 
					}
				}
				%>
			</table>
			</div>
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

