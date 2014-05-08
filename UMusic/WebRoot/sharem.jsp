<%@ page language="java" pageEncoding="UTF-8"%>
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
		%>
	
		<div id="main">
			<div id="upload">
				<iframe name="sharem" src="sharem.jsp" style="display:none;"></iframe>
				<form name="form1" action="upload" method="post" enctype="multipart/form-data" target="sharem">
			    	<h4>请选择文件</h4>
			    	<hr/><br/>
			    	<input type="file" multiple="true" size="20" name="file" /><br/><br/>
			    	<input name="upload" type="submit" value="上传" />
			    	<hr/>
			    	<h5>Tips</h5>
			    	<p>请先上传文件再发表内容哦！</p>
			    </form>
		    </div>
		    <div id="musicInfo">
		    	<html:form action="/shareM"> 
		    	<html:hidden property="method" value="save"></html:hidden>
					<b>音乐之门 :</b>
					<html:text styleId="musicTitle" property="musicTitle"/>
					<html:errors property="musicTitle"/><br/>
					<b>歌者之灵 :</b>
					<html:text styleId="singer" property="singer"/>
					<html:errors property="singer"/><br/>
					<b>归类之途 :</b> 
					<html:select property="musicType">
					<html:option value="勿忘心安">勿忘心安</html:option>
					<html:option value="忧伤情怀">忧伤情怀</html:option>
					<html:option value="失恋33天">失恋33天</html:option>
					<html:option value="恋爱ing">恋爱ing</html:option>
					<html:option value="奋斗向上">奋斗向上</html:option>
					<html:option value="让我静静">让我静静</html:option>
					</html:select>
					<html:errors property="musicType"/><br/>
					<h3>音乐之声 :</h3>
					<html:textarea property="musicDcpt" cols="50" rows="10" value="写些感想吧..."/>
					<html:errors property="musicDcpt"/><br/>
					<html:submit disabled="true" styleId="submit">发表</html:submit>
					<html:reset>取消</html:reset>
				</html:form>
		    </div>
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
			var musicPath = document.form1.file.value;
			var musicTitle = musicPath.substring(musicPath.lastIndexOf("\\")+1);
			var musicName = musicTitle.substring(musicTitle.indexOf("-")+1);
			var singer = musicTitle.substring(0, musicTitle.indexOf("-"));
			
			document.getElementById("musicTitle").value = musicTitle;
			document.getElementById("singer").value = singer;
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

