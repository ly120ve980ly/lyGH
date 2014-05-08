<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.luyi.umusic.model.*" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
 
<% 
	String path = request.getContextPath(); 
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 

<html> 
	<head>
		<title>JSP for MusicLib form</title>
		<link rel="stylesheet" href="<%=basePath%>rez/data/css/style.css" type="text/css"></link>
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
		if(request.getSession().getAttribute("userName") != null &&
			request.getSession().getAttribute("userPwd") != null)
		{
			List userlist = (List)request.getSession().getAttribute("userlist");
			Iterator useritr = userlist.iterator();
			UserInfo uu = (UserInfo)useritr.next();
		%>
	
		<div id="main">
			<div id="user">
				<span style="font-size:18px;font-style:italic;font-weight:bold;">
				<%=uu.getUserName() %></span>
				<span style="margin:0 0 0 50px;font-size:10px;"><a href="useredit.jsp">编辑</a></span>
				<span id="userHead">
					<hr/><img id="imgHead" width="70" height="70"
							src="<%=basePath%>UserData/UserPhoto/<%=uu.getPhoto() %>" />
				</span><br/>
		    </div>
		    
		    <%
		    	List musiclist = (List)request.getSession().getAttribute("musiclist");
		    	if(musiclist.size() == 0)
		    	{
		    %>
		    <div id="music">
		    	<center>
		    		<h4>乐库空空如也</h4>
		    		<p>快去<a href="sharem.jsp">分享</a>你的音乐！</p>
		    	</center>
		    </div>
		    <%	
		    	}
		    	else
		    	{
			    	Iterator musicitr = musiclist.iterator();
					while(musicitr.hasNext())
					{
						Music m = (Music)musicitr.next();
						String type = null;
						if(m.getMusicType().equals("勿忘心安"))
						{
							type="1";
						}
						if(m.getMusicType().equals("忧伤情怀"))
						{
							type="2";
						}
						if(m.getMusicType().equals("失恋33天"))
						{
							type="3";
						}
						if(m.getMusicType().equals("恋爱ing"))
						{
							type="4";
						}
						if(m.getMusicType().equals("奋斗向上"))
						{
							type="5";
						}
						if(m.getMusicType().equals("让我静静"))
						{
							type="6";
						}
		    %>
		    <div id="music">
		    	<table>
		    		<tr>
		    		<td><img id="imgHead" src="<%=basePath%>rez/data/images/<%=type %>.jpg"/></td>
		    		<td style="font-size:15px;font-weight:bold;"><%=m.getMusicTitle() %></td>
		    		</tr>
		    		<tr>
		    		<td style="font-size:8px;"><%=m.getMusicType() %></td>
		    		<td style="text-align:right;">---<%=m.getSinger() %></td>
		    		</tr>
		    		<tr>
						<td><audio controls="controls" id="audio_player"
								src="<%=basePath%>UserData/UserMusic/<%=m.getMusicTitle() %>" >
						</audio></td>
						<td style="text-align:right;font-size:10px;">
						<a href="/UMusic/shareM.do?method=delete&musicId=<%=m.getId() %>">删除</a>
						</td>
					</tr>
				</table>
			</div>
			<%
					}
				}
			%>
		    
			
		</div>
		<%	
			}
			else
			{
		%>
		<div id="main">
			<center>
				<h4>用户未登录</h4>
				<hr/>
				<a href="login.jsp">请先登录>></a>
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

