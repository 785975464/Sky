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

<body>	<!-- onload="code();" -->
	<div class="content sky-content" id="page-container">
		<div class="frame-records">
			<div class="records-new part4">
				<div class="title" id="community-manage" >数据批量导入结果
				    <!-- 
				    <a href="createCommunityInfo.action" class="btn btn-sm"
				    	style="position:absolute;left:120px;top:2px;background-color: #3CBE86;color: #fff;"	>添加学生</a>
					<a href="download.action?fileName=muban.xlsx" class="btn btn-sm"
						style="position:absolute;left:200px;top:2px;background-color: #3CBE86;color: #fff;" >Excel文件模板</a>
					 -->
					<a href="communityInfo.action" class="btn btn-sm"
				    	style="position:absolute;right:10px;top:2px;background-color: #3CBE86;color: #fff;"	>返回</a>
				</div>
        		
				 
				<div class="context">
					<div class="table-responsive" style="overflow-y: auto;">		<!-- style="height: 500px;overflow-y: auto;" -->
						<h3>
						错误记录	<!-- （用户信息未导入） -->
						</h3>
						<table class="table table-hover table-bordered big-data table-striped">
							<colgroup>
								<col style="">
								<col style="">
								<col style=""><!-- width: 225px -->
							</colgroup>
							<thead style="background-color:#EEEEEE;">
								<tr>
									<th>序号</th>
									<th>错误行数</th>
									<th>错误原因</th>
									
									<!-- 
									<th>年龄</th>
									<th>学校</th>
									
									<th style="text-align: center;">操作</th>
									 -->
								</tr>
							</thead>
							<tbody id="userinfoTbody">
								<s:iterator value="errorList" id="l" status="st">
									<tr class="gradec">
										
										<!-- 
										<td><s:property value="#l" />
										</td>
										<td><s:property value="errorList[0]" />
										</td>
										 -->
										<td><s:property value="#st.count"/></td>
										<td><s:property value="errorList[#st.index]" /></td>
										<td><s:property value="%{errorReason[#st.index]}" /></td>
										
									</tr>
								</s:iterator>
								<tr>
									<s:if test="%{errorList.size == 0}">
										<td>暂无</td>
										<td>暂无</td>
										<td>暂无</td>
									</s:if>
								</tr>
							</tbody>
						</table>
						
						<h3>
						相似记录（建议社工复查）
						</h3>
						<table class="table table-hover table-bordered big-data table-striped">
							<colgroup>
								<col style="">
								<col style="">
								<col style="">
							</colgroup>
							<thead style="background-color:#EEEEEE;">
								<tr>
									<th>序号</th>
									<th>所在行数</th>
									<th>相似用户</th>
								</tr>
							</thead>
							<tbody id="userinfoTbody">
								<s:iterator value="similarList" id="l" status="st">
									<tr class="gradec">
										<td><s:property value="#st.count"/></td>
										<td><s:property value="similarList[#st.index]" /></td>
										<td><s:property value="%{similarReason[#st.index]}" /></td>
									</tr>
								</s:iterator>
								<tr>
									<s:if test="%{similarList.size == 0}">
										<td>暂无</td>
										<td>暂无</td>
										<td>暂无</td>
									</s:if>
								</tr>
							</tbody>
						</table>
						
						<div>
						</div>
					</div>
					<h3>
						本次共导入${actualrows }条数据
					</h3>
					</br>
					<h4>
					说明：
					</h4>
					<h5>
					1、请确保上传的数据格式与模板一致，切勿随意更改表头名称与顺序；
					</h5>
					<h5>
					2、错误原因为“年龄错误”的记录未被录入系统中。解决方法：修改用户的年龄后重新导入即可；
					</h5>
					<h5>
					3、错误原因为“视觉档案重复”的记录未被录入系统中。解决方法：检查用户的视觉档案是否重复；
					</h5>
					<h5>
					4、错误原因为“视力、视功能数值错误”的记录，用户信息被正确录入，但是用户的视觉档案由于视力值或视功能值错误而未被录入系统中。解决方法：修改用户的视力、视功能后重新导入即可；
					</h5>
					<h5>
					5、上传结果暂无的，表示数据已正常录入；
					</h5>
					<h5>
					6、出现在“相似记录”中的视觉档案，建议社工复查用户的档案以确保信息的正确录入；
					</h5>
					<h5>
					7、其他问题请咨询管理员。
					</h5>
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
			//alert("搜索!");
			var school = document.getElementById("searchschool").value;
			document.getElementById("school").value = encodeURI(school);
			var realname = document.getElementById("searchrealname").value;
			document.getElementById("realname").value = encodeURI(realname);
			var phone = document.getElementById("phone").value;
			//alert(school);
			//document.getElementById("search").href = "searchCommunityInfo.action?school="+school+"&realname="+realname+"&phone="+phone;
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
			//var tr = obj.parentElement.parentElement;//本行的tr对象
			//alert("tr为："+tr);
			
			var url = "delCommunityInfo.action?username=" + str;//处理删除操作
			//alert("删除操作中的URL为"+url);
			createXMLHttpRequest();
			xmlHttpReq.open("POST", url, true);
			xmlHttpReq.send(null);
			actionname = "communityInfo!communityInfo?page=";
			xmlHttpReq.onreadystatechange = getResult;
		}

		function modify(obj) {
			var tr = obj.parentNode.parentNode;
			var tds = tr.cells;
			var str = tds[0].innerHTML;
			var url = "modifyCommunityInfo.action?username=" + str;//处理删除操作
			createXMLHttpRequest();
			xmlHttpReq.open("GET", url, true);
			xmlHttpReq.send(null);
		}

		function getResult() {
			if (xmlHttpReq.readyState == 4) {
				//alert("已接收到完整信息！xmlHttpReq.responseText为"+xmlHttpReq.responseText);
				
				var del = eval('(' + xmlHttpReq.responseText + ')');
				var delMsg = del.DELRESULT
				if(delMsg!=""){
					alert(delMsg);		//后台返回删除成功消息
				}
				
				var userList = eval('(' + xmlHttpReq.responseText + ')');
				//alert("userList！userList.STURESULT为："+userList.STURESULT);
				
				var user = eval(userList.STURESULT);
				//alert(user);
				var pageObj = eval('(' + xmlHttpReq.responseText + ')');
				
				var Sturesult = "";
				//var Sturesult = "<tbody id='userinfoTbody'>";
				for ( var i = 0; i < user.length; i++) {
					Sturesult += "<tr>";
					Sturesult += "<td style='display:none'>" + user[i].username + "</td>";
					Sturesult += "<td>" + user[i].realname + "</td>";
					Sturesult += "<td>" + user[i].gender + "</td>";
					Sturesult += "<td>" + user[i].age + "</td>";
					Sturesult += "<td>" + user[i].school + "</td>";
					Sturesult += "<td>" + user[i].grade + "</td>";
					Sturesult += "<td>" + user[i].stuClass + "</td>";
					Sturesult += "<td>" + user[i].nation + "</td>";
					Sturesult += "<td>" + user[i].height + "</td>";
					Sturesult += "<td>" + user[i].weight + "</td>";
					Sturesult += "<td>" + user[i].guardianName + "</td>";
					Sturesult += "<td style='text-align: center;'>"
							+ "<a class='btn-sm' style='margin: 0px 4px 0px 0px;' href='modifyCommunityInfo.action?username="
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

				//alert("Sturesult:"+Sturesult);
				//alert("Pageresult:"+Pageresult);
			}
		}
	</script>
</body>
</html>
