<%@taglib prefix="s" uri="/struts-tags" %><!-- pageEncoding="GB2312" -->
<%@ page pageEncoding="utf-8"%>

<%@ page contentType="text/html;charset=GBK"%>
<!DOCTYPE HTML>
<html>
<head>
<title>视康云</title>
<meta charset="GBK">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
<script src="jquery/jquery.min.js"></script>
<link href="css/main.min.css" rel="stylesheet" type="text/css">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<script src="bootstrap/js/bootstrap.min.js"></script>

</head>

<body>
	<div class="content sky-content" id="page-container">
		<div class="frame-records">
			<div class="records-new part4">
				<div class="title">社工管理 ——管理员界面
					<!-- 
					<input type="text"	class="input-sm search-query title-search-input" id="search_realname" placeholder="请输入姓名" required="required" style="position:absolute;right:220px;color: #000;">
					<input type="text"	class="input-sm search-query title-search-input" id="search_school" placeholder="请输入学校" required="required" style="color: #000">
					<input type="button" style="background-color: #3CBE86;color: #fff;"	class="btn btn-sm title-search-btn" value="搜索"	onclick="search()" /> 
 					-->
				</div>
				
				<div class="context">
					<div class="table-responsive" style="height: 500px;overflow-y: auto;">
						<table class="table table-hover table-bordered big-data table-striped" >
							<colgroup>
								<col style="">
								<col style="">
								<col style="">
								<col style="">
								<col style="">
								<col style="">
								
								<!-- 
								<col style="">
								<col style="">
								<col style="">
								<col style="">
								<col style="">
								 -->
								<col style=""><!-- width: 225px -->
							</colgroup>
							<thead style="background-color:#EEEEEE;">
								<tr>
									<th>ID</th>
									<!-- 
									<th>密码（加密）</th>
									 -->
									<th>姓名</th>
									<th>角色</th>
									<th>性别</th>
									<th>年龄</th>
									<th>社区</th>
									<!-- 
									<th>学校</th>
									<th>年级</th>
									<th>班级</th>
									
									<th>民族</th>
									<th>身高</th>
									<th>体重</th>
									
									<th>监护人</th>
									 -->
									<th style="text-align: center;">操作</th>
								</tr>
							</thead>
							<tbody id="userinfoTbody">
								<s:iterator value="list">
									<tr class="gradec">
										<td><s:property value="username" />
										</td>
										<!-- 
										<td><s:property value="password" />
										</td>
										 -->
										<td><s:property value="realname" />
										</td>
										<td><s:property value="level" />
										</td>
										<td><s:property value="gender" />
										</td>
										<td><s:property value="age" />
										</td>
										<td><s:property value="address" />
										</td>
										<td style="text-align: center;">
											<a class="btn-sm" href="modifyAdminStuInfo.action?username=<s:property value='username'/>">修改</a>
											<span style="color: #E0E0E0">|</span>
											<a class="btn-sm" onclick="del(this)">删除</a>		<!-- 返回到管理员页面 -->
											<span style="color: #E0E0E0">|</span>
											<a class="btn-sm" href="stuVisionInfo.action?username=<s:property value='username'/>">查看视觉档案</a>
										</td>
									</tr>
								</s:iterator>
							</tbody>

						</table>
					</div>
					<div>
						<table id="pageTable">
							<tr>
								<td><s:if test="%{pageBean.currentPage == 1}">首页      上一页</s:if>
									<s:else>
										<a href="socialWorkerInfo!socialWorkerInfo?page=1">首页</a>
										<a
											href="socialWorkerInfo!socialWorkerInfo?page=<s:property value="%{pageBean.currentPage-1}"/>" />上一页</a>
									</s:else></td>
								<td><s:if
										test="%{pageBean.currentPage != pageBean.totalPage}">
										<a
											href="socialWorkerInfo!socialWorkerInfo?page=<s:property value="%{pageBean.currentPage+1}"/>">下一页</a>
										<a
											href="socialWorkerInfo!socialWorkerInfo?page=<s:property value="pageBean.totalPage"/>">尾页</a>
									</s:if> <s:else>下一页  尾页</s:else>
								</td>
								<td>页次 <s:property value="pageBean.currentPage" /> / <s:property
										value="pageBean.totalPage" /> 共 <s:property
										value="pageBean.allRow" /> 记录</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var height = document.getElementById("page-container").scrollHeight;
		parent.AdjustIframeHeight(height);
		$(window).resize(function() {
			var height = document.getElementById("page-container").scrollHeight;
			parent.AdjustIframeHeight(height);
		});
	</script>
	<script type="text/javascript">
		//创建XMLHttpRequest对象
		var xmlHttpReq;
		var actionname = "";
		function createXMLHttpRequest() {
			if (window.ActiveXObject) {
				xmlHttpReq = new ActiveXObject("MSXML2.XMLHTTP.3.0");
			} else {
				xmlHttpReq = new XMLHttpRequest();
			}
		}
		function search() {
			var search_gradename = document.getElementById("search_gradename").value;
			var search_classname = document.getElementById("search_classname").value;
			var search_realname = document.getElementById("search_realname").value;
			//var search_username = document.getElementById("search_username").value;
			var search_school = document.getElementById("search_school").value;

			//var url = "searchStuInfo.action?grade=" + search_gradename;		//年级
			//var url = "searchStuInfo.action?stuClass=" + search_classname;	//班级
			//var url = "searchStuInfo.action?realname=" + search_realname;	//真实姓名
			//var url = "searchStuInfo.action?username=" + search_username;	//学号
			//var url = "searchAllStuInfo.action?grade="+search_gradename+"&stuClass="+search_classname+"&realname=" + search_realname+"&username="+search_username;
			var url = "searchAllStuInfo.action?grade="+search_gradename+"&stuClass="+search_classname+"&realname=" + search_realname+"&school="+search_school;

			createXMLHttpRequest();
			xmlHttpReq.open("POST", url, true);
			xmlHttpReq.send(null);
			//actionname = "searchStuInfo!searchStuInfo?username=" + search_username + "&page=";
			//actionname = "searchStuInfo!searchStuInfo?stuClass=" + search_classname + "&page=";
			//actionname = "searchStuInfo.action?grade="+search_grade+" &stuClass="+search_classname+" &realname=" + search_realname+" &username="+search_username+"&page=";
			//actionname = "searchStuInfo!searchStuInfo?grade=" + search_gradename +"&stuClass="+search_classname+ "&page=";
			//alert(actionname);
			xmlHttpReq.onreadystatechange = getResult;
		}
		//弹出删除提示 obj："删除"对象（位于td内的对象）
		function del(obj) {
			var tr = obj.parentNode.parentNode;
			var tds = tr.cells;
			var str = tds[0].innerHTML;
			if (confirm("您确定删除？"))
				confimdel(obj, str);
			return false;
		}
		//处理删除操作
		//先删除数据库中数据，如果执行成功则删除页面上相应的行 
		function confimdel(obj, str) {
			//	var tr = obj.parentElement.parentElement;//本行的tr对象
			var url = "delAdminSocialInfo.action?username=" + str;//处理删除操作
			createXMLHttpRequest();
			xmlHttpReq.open("POST", url, true);
			xmlHttpReq.send(null);
			actionname = "socialWorkerInfo!socialWorkerInfo?page=";
			xmlHttpReq.onreadystatechange = getResult;
		}


		function getResult() {
			if (xmlHttpReq.readyState == 4) {
				var del = eval('(' + xmlHttpReq.responseText + ')');
				//alert(delMsg);		//后台返回删除成功消息
				var delMsg = del.DELRESULT
				if(delMsg!=""){
					alert(delMsg);		//后台返回删除成功消息
				}
				
				var userList = eval('(' + xmlHttpReq.responseText + ')');
				var user = eval(userList.STURESULT);
				var pageObj = eval('(' + xmlHttpReq.responseText + ')');

				var Sturesult = "";
				//var Sturesult = "<tbody id='userinfoTbody'>";
				for ( var i = 0; i < user.length; i++) {
					Sturesult += "<tr>";
					Sturesult += "<td>" + user[i].username + "</td>";
					//Sturesult += "<td>" + user[i].password + "</td>";
					Sturesult += "<td>" + user[i].realname + "</td>";
					Sturesult += "<td>" + user[i].level + "</td>";
					Sturesult += "<td>" + user[i].gender + "</td>";
					Sturesult += "<td>" + user[i].age + "</td>";
					Sturesult += "<td>" + user[i].address + "</td>";
					Sturesult += "<td style='text-align: center;'>"
							+ "<a class='btn-sm' style='margin: 0px 4px 0px 0px;' href='modifyAdminStuInfo.action?username="
							+ user[i].username + "'>修改</a>";
					Sturesult += "<span style='color: #E0E0E0'>|</span>";
					Sturesult += "<a class='btn-sm' style='margin: 0px 4px;' onclick='del(this)'>删除</a>";
					Sturesult += "<span style='color: #E0E0E0'>|</span>";
					Sturesult += "<a class='btn-sm' style='margin: 0px 0px 0px 4px;' href='stuVisionInfo.action?username="
							+ user[i].username + "'>视觉档案</a>" + "</td>";
					Sturesult += "</tr>";
				}
				//Sturesult += "</tbody>";

				var Pageresult = "<table id='pageTable'><tr>";
				if (pageObj.PAGEBEAN.currentPage == 1) {
					Pageresult += "<td>首页      上一页</td>";
				} else {

					Pageresult += "<td>" + "<a href='"+actionname+"1'>首页</a>";
					Pageresult += "<a href='" + actionname
							+ parseInt(pageObj.PAGEBEAN.currentPage - 1)
							+ "'/>" + "上一页</a>";
					Pageresult += "</td>";
				}
				if (pageObj.PAGEBEAN.currentPage != pageObj.PAGEBEAN.totalPage) {

					Pageresult += "<td>" + "<a href='" + actionname
							+ parseInt(pageObj.PAGEBEAN.currentPage + 1)
							+ "'/>" + "下一页</a>";
					Pageresult += "<a href='"+actionname+pageObj.PAGEBEAN.totalPage+"'/>"
							+ "尾页</a>";
					Pageresult += "</td>";
				} else {
					Pageresult += "<td>下一页  尾页</td>";
				}
				Pageresult += "<td>页次" + pageObj.PAGEBEAN.currentPage + "/"
						+ pageObj.PAGEBEAN.totalPage;
				Pageresult += "共" + pageObj.PAGEBEAN.allRow + "记录";
				Pageresult += "</td>";
				Pageresult += "</tr></tbody>";
				document.getElementById('userinfoTbody').innerHTML = Sturesult;
				document.getElementById('pageTable').innerHTML = Pageresult;

			}
		}
	</script>
</body>
</html>
