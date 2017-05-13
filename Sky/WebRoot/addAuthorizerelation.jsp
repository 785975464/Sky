
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
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
				<div class="title">添加专家
				<button type="button" class="btn btn-info btn-sm"
						style="position:absolute;right:10px;top:2px;background-color: #3CBE86;color: #fff;"
						onClick="history.back(-1)">返回</button>
				</div>

				<div class="context">
					<div class="table-responsive">
						<table class="table table-hover table-bordered big-data">
							<colgroup>
								<col style="">
								<col style="">
								<col style="">
								<col style="">
								<col style="width:100px;">
							</colgroup>
							<thead>
								<tr>
									<th>专家号</th>
									<th>姓名</th>
									<th>性别</th>
									<th>年龄</th>
									<th style="text-align: center;">操作</th>
								</tr>
							</thead>
							<tbody id="specialistTbody">
								<s:iterator value="list">
									<tr class="gradec">
										<td><s:property value="username" />
										<td><s:property value="realname" />
										<td><s:property value="gender" />
										<td><s:property value="age" />
										</td>
										<td style="text-align: center;"><input type="button" class="btn btn-danger btn-sm"
											value="授权" onclick="apply(this)"></input></td>
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
										<a href="studentApplyExpert!studentApplyExpert?page=1">首页</a>
										<a
											href="studentApplyExpert!studentApplyExpert?page=<s:property value="%{pageBean.currentPage-1}"/>" />上一页</a>
									</s:else></td>
								<td><s:if
										test="%{pageBean.currentPage != pageBean.totalPage}">
										<a
											href="studentApplyExpert!studentApplyExpert?page=<s:property value="%{pageBean.currentPage+1}"/>">下一页</a>
										<a
											href="studentApplyExpert!studentApplyExpert?page=<s:property value="pageBean.totalPage"/>">尾页</a>
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

		//弹出删除提示 obj："删除"对象（位于td内的对象）
		function apply(obj) {
			var tr = obj.parentNode.parentNode;
			var tds = tr.cells;
			var str = tds[0].innerHTML;
			if (confirm("您确定授权于" + str + "?"))
				confimdel(obj, str);
			return false;
		}
		//处理删除操作
		//先删除数据库中数据，如果执行成功则删除页面上相应的行 
		function confimdel(obj, str) {
			//	var tr = obj.parentElement.parentElement;//本行的tr对象
			var url = "studentInsertAuthorizerelation.action?specialname="
					+ str;//处理删除操作
			createXMLHttpRequest();
			xmlHttpReq.open("POST", url, true);
			xmlHttpReq.send(null);
			actionname = "studentApplyExpert!studentApplyExpert?page=";
			xmlHttpReq.onreadystatechange = getResult;
		}

		function getResult() {
			if (xmlHttpReq.readyState == 4) {
				var userList = eval('(' + xmlHttpReq.responseText + ')');
				var user = eval(userList.STURESULT);
				var pageObj = eval('(' + xmlHttpReq.responseText + ')');

				var Sturesult = "<tbody id='specialistTbody'>";
				for ( var i = 0; i < user.length; i++) {
					Sturesult += "<tr>";
					Sturesult += "<td>" + user[i].username + "</td>";
					Sturesult += "<td>" + user[i].realname + "</td>";
					Sturesult += "<td>" + user[i].gender + "</td>";
					Sturesult += "<td>" + user[i].age + "</td>";
					Sturesult += "<td style='text-align: center;'>"
							+ "<input type='button' class='btn btn-danger btn-sm' value='授权' onclick='apply(this)'></input>";
					Sturesult += "</td>";
					Sturesult += "</tr>";
				}
				Sturesult += "</tbody>";

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
				document.getElementById('specialistTbody').innerHTML = Sturesult;
				document.getElementById('pageTable').innerHTML = Pageresult;
			}
		}
	</script>
</body>
</html>
