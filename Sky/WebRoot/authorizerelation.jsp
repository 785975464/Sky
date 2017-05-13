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
				<div class="title">授权请求</div>
				<!-- <s:hidden name="#session.loginuser.username" id="specialistname"></s:hidden> -->
				<div class="context">
					<div class="table-responsive">
						<table class="table table-hover table-bordered big-data">
							<colgroup>
								<col style="">
								<col style="">
								<col style="">
								<col style="">
								<col style="">
								<col style="">
								<col style="">
								<col style="">
								<col style="">
								<col style="">
								<col style="">
								<col style="width:9%;">
							</colgroup>
							<thead>
								<tr>
									<th>学号</th>
									<th>姓名</th>
									<th>性别</th>
									<th>年龄</th>
									<th>学校</th>
									<th>年级</th>
									<th>班级</th>
									<th>民族</th>
									<th>身高</th>
									<th>体重</th>
									<th>社区</th>
									<th style="text-align: center;">授权</th>
								</tr>
							</thead>
							<tbody id="auinfoTbody">
								<s:iterator value="list">
									<tr class="gradec">
										<td><s:property value="username" />
										</td>
										<td><s:property value="realname" />
										</td>
										<td><s:property value="gender" />
										</td>
										<td><s:property value="age" />
										</td>
										<td><s:property value="school" />
										</td>
										<td><s:property value="grade" />
										</td>
										<td><s:property value="stuClass" />
										</td>
										<td><s:property value="nation" />
										</td>
										<td><s:property value="height" />
										</td>
										<td><s:property value="weight" />
										</td>
										<td><s:property value="address" />
										</td>
										<td style="text-align: center;">
											<a class="btn-sm" onclick="update(this)">是</a>
											<span style="color: #E0E0E0">|</span>
											<a class="btn-sm" onclick="del(this)">否</a>
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
										<a href="noAuthorizedInfo!noAuthorizedInfo?page=1">首页</a>
										<a
											href="noAuthorizedInfo!noAuthorizedInfo?page=<s:property value="%{pageBean.currentPage-1}"/>" />上一页</a>
									</s:else></td>
								<td><s:if
										test="%{pageBean.currentPage != pageBean.totalPage}">
										<a
											href="noAuthorizedInfo!noAuthorizedInfo?page=<s:property value="%{pageBean.currentPage+1}"/>">下一页</a>
										<a
											href="noAuthorizedInfo!noAuthorizedInfo?page=<s:property value="pageBean.totalPage"/>">尾页</a>
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
		$(window) .resize( function() {
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
		function update(obj) {
			var tr = obj.parentNode.parentNode;
			var tds = tr.cells;
			var username = tds[0].innerHTML;
			if (confirm("您确定同意授权？")){
				var url = "updateAuthorizedInfo.action?username=" + username;
				createXMLHttpRequest();
				xmlHttpReq.open("POST", url, true);
				xmlHttpReq.send(null);
				actionname = "noAuthorizedInfo!noAuthorizedInfo?page=";
				xmlHttpReq.onreadystatechange = getResult;
			}
		}
		
		function del(obj) {
			var tr = obj.parentNode.parentNode;
			var tds = tr.cells;
			var username = tds[0].innerHTML;
			if (confirm("您确定拒绝授权？")){
				var url = "delAuthorizedInfo.action?username=" + username;
				createXMLHttpRequest();
				xmlHttpReq.open("POST", url, true);
				xmlHttpReq.send(null);
				actionname = "noAuthorizedInfo!noAuthorizedInfo?page=";
				xmlHttpReq.onreadystatechange = getResult;
			}
		}

		function getResult() {
			if (xmlHttpReq.readyState == 4) {
				var auList = eval('(' + xmlHttpReq.responseText + ')');
				var au = eval(auList.STURESULT);
				var pageObj = eval('(' + xmlHttpReq.responseText + ')');

				var Sturesult = "";
				for ( var i = 0; i < au.length; i++) {

					Sturesult += "<tr class='gradec'>";
					Sturesult += "<td>" + au[i].username + "</td>";
					Sturesult += "<td>" + au[i].realname + "</td>";
					Sturesult += "<td>" + au[i].gender + "</td>";
					Sturesult += "<td>" + au[i].age + "</td>";
					Sturesult += "<td>" + au[i].school + "</td>";
					Sturesult += "<td>" + au[i].grade + "</td>";
					Sturesult += "<td>" + au[i].stuClass + "</td>";
					Sturesult += "<td>" + au[i].nation + "</td>";
					Sturesult += "<td>" + au[i].height + "</td>";
					Sturesult += "<td>" + au[i].weight + "</td>";
					Sturesult += "<td>" + au[i].address + "</td>";
					Sturesult += "<td style='text-align: center;'><a class='btn-sm' style='margin: 0px 4px 0px 0px;' onclick='update(this)'>是</a>";
					Sturesult += "<span style='color: #E0E0E0'>|</span>";
					Sturesult += "<a class='btn-sm' style='margin: 0px 0px 0px 4px;' onclick='del(this)'>否</a></td>";
					Sturesult += "</tr>";
				}

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
				document.getElementById('auinfoTbody').innerHTML = Sturesult;
				document.getElementById('pageTable').innerHTML = Pageresult;
			}
		}
	</script>
</body>
</html>
