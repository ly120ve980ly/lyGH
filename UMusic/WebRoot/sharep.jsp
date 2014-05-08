<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.luyi.umusic.model.*" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

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
		    
		    <div id="sharephoto">
		    	<iframe name="sharep" src="sharep.jsp" style="display:none;"></iframe>
				<form name="form1" action="upload" method="post" enctype="multipart/form-data" target="sharep">
			    	照片 :
			    	<input type="file" multiple="true" size="20" name="file" />
			    	<input name="upload" type="submit" value="上传" />
			    </form>
			    <html:form action="/shareP"> 
		    	<html:hidden property="method" value="save"></html:hidden>
					<b>照片名称 :</b>
					<html:text styleId="photoTitle" property="photoTitle"/>
					<html:errors property="photoTitle"/>
					<b>照片感言 :</b>
					<html:text styleId="photoInfo" property="photoInfo"/>
					<html:errors property="photoInfo"/><br/>
					<html:submit disabled="true" styleId="submit">发表</html:submit>
					<html:reset>取消</html:reset>
				</html:form>
		    </div>
		    <hr/>
		    <%
		    	List photolist = (List)request.getSession().getAttribute("photolist");
		    	Iterator photoitr = photolist.iterator();
		    	
		    	if(photolist.size() == 0)
		    	{
		    %>
		    <div id="photoset">
		    	<center>
		    		<h4>相册空空如也</h4>
		    	</center>
		    </div>
		    <%	
		    	}
		    	else
		    	{
					while(photoitr.hasNext())
					{
						PhotoSet p = (PhotoSet)photoitr.next();
		    %>
		    <div id="photoset">
		    	<span>
		    		<font style="font-size:16px;font-weight:bold;">
		    			<%=p.getPhotoName() %>
		    		</font><br/>
		    		<img id="imgPhoto" style="max-width:200px;max-height:350px;" src="<%=basePath%>UserData/UserPhoto/<%=p.getPhotoName() %>"/><br/>
		    		<font style="font-size:12px;font-algin:center;"><%=p.getPhotoInfo() %></font><br/>
		    		<span style="font-size:10px;">
		    			<center>
			    		<a href="/UMusic/shareP.do?method=delete&photoId=<%=p.getId() %>">删除</a>
		    			</center>
		    		</span>
		    	</span>
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
	
	<script>
		document.form1.file.addEventListener('change', function(){
			var photoPath = document.form1.file.value;
			var photoTitle = photoPath.substring(photoPath.lastIndexOf("\\")+1);
			
			document.getElementById("photoTitle").value = photoTitle;
		}, false);
		
		document.form1.upload.addEventListener('click', function(){
			if(document.form1.file.value !== null)
			{
				document.getElementById("submit").disabled = false;
			}
		}, false);
		
	</script>
	
	</body>
	
</html>

