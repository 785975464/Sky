<%@taglib prefix="s" uri="/struts-tags"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>视康云</title>
<meta charset="utf-8">
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
				<div class="title">用户信息</div>
				<div class="context">
					<div class="table-responsive">
						<table class="table table-hover table-bordered big-data table-striped">
							<thead style="background-color:#EEEEEE;">
								<tr>
									<th>用户名</th>
									<th>密码（加密）</th>
									<th>角色</th>
									<th>姓名</th>
									<th>联系电话</th>
									<th>Email</th>
									<th style="text-align: center;">操作</th>
								</tr>
							</thead>
							<tbody id="userinfoTbody">
								<s:iterator value="list">
									<tr class="gradec">
										<td><s:property value="username" /></td>
										<td><s:property value="password" /></td>
										<td><s:property value="level" /></td>
										<td><s:property value="realname" /></td>
										<td><s:property value="phone" /></td>
										<td><s:property value="email" /></td>
										<td style="text-align: center;">
												<a class="btn-sm" onclick="del(this)">删除</a>
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
										<a href="adminInfo!adminInfo?page=1">首页</a>
										<a href="adminInfo!adminInfo?page=<s:property value="%{pageBean.currentPage-1}"/>" />上一页</a>
									</s:else>
								</td>
								<td><s:if
										test="%{pageBean.currentPage != pageBean.totalPage}">
										<a
											href="adminInfo!adminInfo?page=<s:property value="%{pageBean.currentPage+1}"/>">下一页</a>
										<a
											href="adminInfo!adminInfo?page=<s:property value="pageBean.totalPage"/>">尾页</a>
									</s:if> <s:else>下一页  尾页</s:else></td>
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
		$(window)
				.resize(
						function() {
							var height = document
									.getElementById("page-container").scrollHeight;
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
			var url = "delAdminInfo.action?username=" + str;//处理删除操作
			createXMLHttpRequest();
			xmlHttpReq.open("POST", url, true);
			xmlHttpReq.send(null);
			actionname = "adminInfo!adminInfo?page=";
			xmlHttpReq.onreadystatechange = getResult;
		}

		function getResult() {
			if (xmlHttpReq.readyState == 4) {
				var userList = eval('(' + xmlHttpReq.responseText + ')');
				var user = eval(userList.STURESULT);
				var pageObj = eval('(' + xmlHttpReq.responseText + ')');

				var Sturesult = "";
				//var Sturesult = "<tbody id='userinfoTbody'>";
				for ( var i = 0; i < user.length; i++) {
					Sturesult += "<tr>";
					Sturesult += "<td>" + user[i].username + "</td>";
					Sturesult += "<td>" + user[i].password + "</td>";
					Sturesult += "<td>" + user[i].level + "</td>";
					Sturesult += "<td>" + user[i].realname + "</td>";
					Sturesult += "<td>" + user[i].phone + "</td>";
					Sturesult += "<td>" + user[i].email + "</td>";
					Sturesult += "<td style='text-align: center;'>"						
					Sturesult += "<a class='btn-sm' style='margin: 0px 4px;' onclick='del(this)'>删除</a>";
					Sturesult += "</td>";
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
