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
				<div class="title">视觉档案
					<a href="createVisionArchive.action?username=${username}" class="btn btn-sm" 
					style="position:absolute;right:60px;top:2px;background-color: #3CBE86;color: #fff;">给用户${tUserinfo.realname}添加视觉档案</a>
					<button type="button" class="btn btn-sm"
						style="position:absolute;right:10px;top:2px;background-color: #3CBE86;color: #fff;"
						onClick="history.back(-1)">返回</button>
				<input type="hidden" id="userID" value=${username} /><!-- 保存用户名 -->
				</div>
				
				<div class="context">
					<div class="table-responsive">
						<table class="table table-hover table-bordered big-data table-striped">
							<colgroup>
								<col style="">
								<col style="">
								<col style="">
								<col style="">
								<col style="">
								<col style="">
								<col style="width:350px;">
							</colgroup>
							<thead>
								<tr>
									<th>档案编号</th>
									<!-- <th>检查序列</th> -->
									<th>屈光矫正方法</th>
									<th>检查时间</th>
									<th>检查数据检查者</th>
									<th>录入人</th>
									<th>录入时间</th>
									<th style="text-align: center;">操作</th>
								</tr>
							</thead>
							<tbody>
								<s:iterator value="list">
									<tr class="gradec">
										<td><s:property value="tableId" /></td>
										<!-- <td><s:property value="checkSequence" /></td> -->
										<td><s:property value="refractiveCorrectionMethod" />										
										<td><s:property value="checkTime" /></td>
										<td><s:property value="checkTheDataExaminer" /></td>
										<!-- <td><s:property value="recorder" /></td> -->
										<td><s:property value="rUserinfo.realname" />${rUserinfo.realname }</td>
										<td><s:property value="recordTime" /></td>
										<td class="text-center"><a class="btn-sm"
											href="detailVisionInfo.action?tableId=<s:property value='tableId'/>">查看详情</a>
											<span style="color: #E0E0E0">|</span><a class="btn-sm"
											href="stuCheckAssessmentFromId.action?tableId=<s:property value='tableId'/>">查看诊断意见</a>
											<span style="color: #E0E0E0">|</span><a class="btn-sm"
											href="modifydetailVisionInfo.action?tableId=<s:property value='tableId'/>">修改</a>
											<span style="color: #E0E0E0">|</span>
											<a href="updateDeleteStuVisionSuccess.jsp" class="btn-sm" onclick="del(this)">删除</a>
										</td>
									</tr>
								</s:iterator>
							</tbody>

						</table>
						<!--新增视觉合并功能 2015-12-26--> 
						<div>
							<input type="button"  id="mergeVisionBtn" style=" left: 0px; top: 2px; background-color: #3CBE86;color: #fff;" onclick="mergeVision();" value="合并视觉档案"/>
							<input type="text"  id="mergeVisionID" style=" left: 0px; top: 2px;width:320px" value="" placeholder="请输入要合并的人员ID"/>
						</div>
						
					</div>
					<div>
						<table id="pageTable">
							<tr>
								<td><s:if test="%{pageBean.currentPage == 1}">首页      上一页</s:if>
									<s:else>
										<a href="stuVisionInfo!stuVisionInfo?username=${username}&page=1">首页</a>
										<a
											href="stuVisionInfo!stuVisionInfo?username=${username}&page=<s:property value="%{pageBean.currentPage-1}"/>" />上一页</a>
									</s:else>
								</td>
								<td><s:if
										test="%{pageBean.currentPage != pageBean.totalPage}">
										<a
											href="stuVisionInfo!stuVisionInfo?username=${username}&page=<s:property value="%{pageBean.currentPage+1}"/>">下一页</a>
										<a
											href="stuVisionInfo!stuVisionInfo?username=${username}&page=<s:property value="pageBean.totalPage"/>">尾页</a>
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
    	function mergeVision(){
    		var mergeVisionID = document.getElementById("mergeVisionID").value;
    		var userID = document.getElementById("userID").value;
    		//alert("userID为"+userID);
    		if(mergeVisionID==""){
    			alert("请输入要合并的人员ID！");
    		}
    		else if(mergeVisionID==userID){
    			alert("非法操作！不得与自身进行合并操作！");
    		}
    		else{		//处理合并操作 2015-12-26username +"& mergeVisionID="+
    			alert("此操作将会删除被合并的用户，请谨慎操作！");
    			if (confirm("您确定要合并？")){
    				var url = "mergeVision.action?username=" + userID + "&mergeVisionID=" + mergeVisionID;
					//alert("删除操作中的URL为"+url);
					createXMLHttpRequest();
					xmlHttpReq.open("GET", url, true);
					xmlHttpReq.send(null);
					alert("操作完成，请刷新！");
				}
			}
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
			
			var url = "delStuVision.action?tableId=" + str;//处理删除操作
			//alert("删除操作中的URL为"+url);
			createXMLHttpRequest();
			xmlHttpReq.open("POST", url, true);
			xmlHttpReq.send(null);
			//actionname = "stuVisionInfo!stuVisionInfo?page=";
			//xmlHttpReq.onreadystatechange = getResult;
		}
		/**
		function getResult() {
			if (xmlHttpReq.readyState == 4) {
				alert("已接收到完整信息！xmlHttpReq.responseText为"+xmlHttpReq.responseText);
				var userList = eval('(' + xmlHttpReq.responseText + ')');
				//alert("userList！userList.STURESULT为："+userList.STURESULT);
				var user = eval(userList.STURESULT);
				var pageObj = eval('(' + xmlHttpReq.responseText + ')');

				var Sturesult = "";
				//var Sturesult = "<tbody id='userinfoTbody'>";
				for ( var i = 0; i < user.length; i++) {
					Sturesult += "<tr>";
					Sturesult += "<td>" + user[i].tableId + "</td>";
					Sturesult += "<td>" + user[i].refractiveCorrectionMethod + "</td>";
					Sturesult += "<td>" + user[i].checkTime + "</td>";
					Sturesult += "<td>" + user[i].checkTheDataExaminer + "</td>";
					Sturesult += "<td>" + user[i].realname + "</td>";
					Sturesult += "<td>" + user[i].recordTime + "</td>";
					Sturesult += "<td style='text-align: center;'>"
							+ "<a class='btn-sm' style='margin: 0px 4px 0px 0px;' href='detailVisionInfo.action?tableId="
							+ user[i].tableId + "'>查看详情</a>";
					Sturesult += "<span style='color: #E0E0E0'>|</span>"
							+ "<a class='btn-sm' style='margin: 0px 4px 0px 0px;' href='stuCheckAssessmentFromId.action?tableId="
							+ user[i].tableId + "'>查看诊断意见</a>";
					Sturesult += "<span style='color: #E0E0E0'>|</span>"
							+ "<a class='btn-sm' style='margin: 0px 4px 0px 0px;' href='modifydetailVisionInfo.action?tableId="
							+ user[i].tableId + "'>修改</a>";
					Sturesult += "<span style='color: #E0E0E0'>|</span>"
							+ "<a class='btn-sm' style='margin: 0px 4px;' onclick='del(this)'>删除</a>";
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
		**/
    </script>
</body>
</html>