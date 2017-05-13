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
				<div class="title" id="school-manage">学校管理
					<form action="searchSchoolInfo" method="post" name="searchschool" id="searchschool">
						<input type="text" name="inputschoolname" id="inputschoolname" class="input-sm search-query title-search-input" 
							 placeholder="请输入学校名称" required="required" style="color: #000" value=""> 		<!-- 学校搜索 -->
						<input type="hidden" name="schoolname" id="schoolname" value="">
						<input type="submit" class="btn btn-sm title-search-btn" 
							 style="background-color: #3CBE86;color: #fff;"value="搜索" onclick="search()"/>
						
						<!-- <button type="submit" class="btn btn-primary" id="submit">增加</button> --> 
					</form>
					<a href="createSchoolInfo.action" class="btn btn-sm"
						 style="position:absolute;left:120px;top:2px;background-color: #3CBE86;color: #fff;" >添加学校</a>
				</div>

				<div class="context">
					<div class="table-responsive" style="overflow-y: auto;">	<!-- height: 500px; -->
						<table class="table table-hover table-bordered big-data table-striped">
							<colgroup>
								<col style="width: 100px">
								<col style="">
								<col style="">
								<col style="">
								<col style="width: 225px">
							</colgroup>
							<thead style="background-color:#EEEEEE;">
								<tr>
									<th>序号</th>
									<th>学校</th>
									<th>授权社区</th>
									<th>所属街道</th>
									<th style="text-align: center;" >操作</th>
								</tr>
							</thead>
							<tbody id="schoolinfoTbody">
								<s:iterator value="list" id="list" status="st">
									<tr class="gradec">
										<td style="display:none"><s:property value="#list[0]" /></td>
										<td><s:property value="#st.count"/></td>
										<td><s:property value="#list[1]" /></td>
										<td><s:property value="#list[3]" /></td>
										<td><s:property value="#list[4]" /></td>
										<td style="text-align: center;">
											<a class="btn-sm" href="modifySchoolInfo.action?schoolid=<s:property value='#list[0]'/>">修改</a>
											<span style="color: #E0E0E0">|</span>
											
											<a class="btn-sm" onclick="del(this)">删除</a> <!-- href="deleteSchoolSuccess.jsp" -->
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
										<a href="allSchoolInfo!allSchoolInfo?page=1">首页</a>
										<a
											href="allSchoolInfo!allSchoolInfo?page=<s:property value="%{pageBean.currentPage-1}"/>" />上一页</a>
									</s:else></td>
								<td><s:if
										test="%{pageBean.currentPage != pageBean.totalPage}">
										<a
											href="allSchoolInfo!allSchoolInfo?page=<s:property value="%{pageBean.currentPage+1}"/>">下一页</a>
										<a
											href="allSchoolInfo!allSchoolInfo?page=<s:property value="pageBean.totalPage"/>">尾页</a>
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
			var inputschoolname = document.getElementById("inputschoolname").value;
			document.getElementById("schoolname").value = encodeURI(inputschoolname);
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
			var url = "delSchInfo.action?schoolid=" + str;//处理删除操作
			//alert("删除操作中的URL为"+url);
			createXMLHttpRequest();
			xmlHttpReq.open("POST", url, true);
			xmlHttpReq.send(null);
			actionname = "allSchoolInfo!allSchoolInfo?page=";
			xmlHttpReq.onreadystatechange = getResult;
		}

		function modify(obj) {
			var tr = obj.parentNode.parentNode;
			var tds = tr.cells;
			var str = tds[0].innerHTML;
			var url = "modifyStuInfo.action?username=" + str;//处理删除操作
			createXMLHttpRequest();
			xmlHttpReq.open("GRT", url, true);
			xmlHttpReq.send(null);
		}

		function getResult() {
			if (xmlHttpReq.readyState == 4) {
				/****/
				var del = eval('(' + xmlHttpReq.responseText + ')');
				var delMsg = del.DELRESULT
				//alert(delMsg);		//后台返回删除成功消息
				if(delMsg!=""){
					alert(delMsg);		//后台返回删除成功消息
				}
				//alert(xmlHttpReq.responseText);
				var schoolList = eval('(' + xmlHttpReq.responseText + ')');
				var sch = eval(schoolList.TEMPSCHRESULT);
				var add = eval(schoolList.TEMPADDRESULT);
				var pageObj = eval('(' + xmlHttpReq.responseText + ')');

				var Schresult = "";
				for ( var i = 0; i < sch.length; i++) {
					var j=i+1;
					//alert("第"+j+"次循环");
					Schresult += "<tr>";
					Schresult += "<td style='display:none'>" + sch[i].schoolid + "</td>";
					Schresult += "<td>" + j + "</td>";
					Schresult += "<td>" + sch[i].schoolname + "</td>";
					Schresult += "<td>" + add[i].community + "</td>";
					Schresult += "<td>" + add[i].street + "</td>";
					Schresult += "<td style='text-align: center;'>"
							+ "<a class='btn-sm' style='margin: 0px 4px 0px 0px;' href='modifySchoolInfo.action?schoolid="
							+ sch[i].schoolid + "'>修改</a>";
					Schresult += "<span style='color: #E0E0E0'>|</span>";
					Schresult += "<a class='btn-sm' style='margin: 0px 4px;' onclick='del(this)'>删除</a>";
					Schresult += "</tr>";
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
				document.getElementById('schoolinfoTbody').innerHTML = Schresult;
				document.getElementById('pageTable').innerHTML = Pageresult;
				
			}
		}

	</script>
</body>
</html>
