
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
				
				<div class="title">个人基础信息</div>
				<div class="context" style="padding-left: 10px !important;">
                    <div class="my-info"> 
                        <div class="f2" style="padding-left: 2%;">
                            <div class="info-item">社区：<span>${session.stuInfo.address}</span></div>
                             <div class="info-item">学校：<span>${session.stuInfo.school}</span></div>
                            <div class="info-item">学号：<span>${session.stuInfo.username}</span></div>
                            <div class="info-item">真实姓名：<span>${session.stuInfo.realname}</span></div>
                            <div class="info-item">性别：<span>${session.stuInfo.gender}</span></div>
                            <div class="info-item">年级：<span>${session.stuInfo.grade}</span></div>
                             <div class="info-item">班级：<span>${session.stuInfo.stuClass}</span></div>
                             
                        </div>
                        <div class="f2">
                            <div class="info-item">年龄：<span>${session.stuInfo.age}</span></div>
                            <div class="info-item">联系电话：<span>${session.stuInfo.phone}</span></div>
                            <div class="info-item">邮箱：<span>${session.stuInfo.email}</span></div>
                            <div class="info-item">监护人：<span>${session.stuInfo.guardianName}</span></div>
                             <div class="info-item">民族：<span>${session.stuInfo.nation}</span></div>
                            <div class="info-item">身份证号：<span>${session.stuInfo.idNumber}</span></div>
                             <div class="info-item">身高：<span>${session.stuInfo.height}</span></div>
                             <div class="info-item">体重：<span>${session.stuInfo.weight}</span></div>
                        </div>
                        <a class="btn btn-info" style="margin:5px;" href="studentApplyExpert.action">添加专家</a>
                    </div>
                    <div class="table-responsive">
					<table class="table table-hover table-bordered big-data">
						<colgroup>
							<col style="width:60px;">
							<col style="width:200px;">
							<col style="width:100px;">
						</colgroup>
						<thead class="text-center">
								<tr>
									<th>已授权专家</th>
									<th>取消授权</th>
								</tr>
						</thead>
						<tbody id="doctorTable">
								<s:iterator value="list1">
									<tr class="gradec">
									<td><s:property value="specialistName" /></td>
									<td><input type="button" class="btn btn-danger btn-sm" value="删除"
											onclick="del(this,<s:property value='id' />)"></input>	
										</td>
									</tr>
								</s:iterator>
						</tbody>
					</table>
				</div>
                </div>
			</div>
		</div>
			
		<div class="frame-records">
			<div class="records-new part4">	
				<div class="title">视觉信息</div>
				<div class="context">
					<div class="table-responsive">
						<table class="table table-hover table-bordered big-data">
						<colgroup>
							<col style="width:70px;">
							<col style="width:200px;">
							<col style="width:120px;">
							<col style="">
							<col style="width:200px;">
						</colgroup>
							<thead>
								<tr>
									<th>档案号</th>
									<th>检查时间</th>
									<th>查看详情</th>
								</tr>
							</thead>
							<tbody>
								<s:iterator value="list">
									<tr class="gradec">
										<td><s:property value="tableId" /></td>
										<td><s:property value="checkTime" /></td>
										<td><a class="btn btn-info btn-sm"
											href="detailVisionInfo.action?tableId=<s:property value='tableId'/>">查看详情</a>
											<a class="btn btn-info btn-sm"
											href="stuCheckAssessmentFromId.action?tableId=<s:property value='tableId'/>">查看诊断意见</a>
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
										<a href="stuMainInfo!stuMainInfo?page=1">首页</a>
										<a
											href="stuMainInfo!stuMainInfo?page=<s:property value="%{pageBean.currentPage-1}"/>" />上一页</a>
									</s:else>
								</td>
								<td><s:if
										test="%{pageBean.currentPage != pageBean.totalPage}">
										<a
											href="stuMainInfo!stuMainInfo?page=<s:property value="%{pageBean.currentPage+1}"/>">下一页</a>
										<a
											href="stuMainInfo!stuMainInfo?page=<s:property value="pageBean.totalPage"/>">尾页</a>
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
</body>


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
	function del(obj,id) {
	//	var tr = obj.parentNode.parentNode;
	//	var tds = tr.cells;
	//	var str = tds[0].innerHTML;
	alert(id);
		if (confirm("确定取消授权？"))
			confimdel(obj, id);
		return false;
	}
	//处理删除操作
	//先删除数据库中数据，如果执行成功则删除页面上相应的行 
	function confimdel(obj, id) {
		//var un=document.getElementById("un").innerHTML;
		//	var tr = obj.parentElement.parentElement;//本行的tr对象
		var url = "delAuthorizerelation.action?id="+id;//处理删除操作
		createXMLHttpRequest();
		xmlHttpReq.open("POST", url, true);
		xmlHttpReq.send(null);
		
		xmlHttpReq.onreadystatechange = getResult;
	}
	function getResult() {
		if (xmlHttpReq.readyState == 4) {
			var authorizerelationList = eval('(' + xmlHttpReq.responseText + ')');
			var authorizerelation = eval(authorizerelationList.STURESULT);

			var Sturesult = "<tbody id='doctorTable'>";
			for ( var i = 0; i < authorizerelation.length; i++) {
				Sturesult += "<tr>";
				Sturesult += "<td>" + authorizerelation[i].specialistName + "</td>";			
				Sturesult += "<td>";
				Sturesult += "<input type='button' class='btn btn-danger' value='取消授权' onclick='del(this,"+authorizerelation[i].id+")'></input>";
				Sturesult += "</td>";
				Sturesult += "</tr>";
			}
			Sturesult += "</tbody>";
			document.getElementById('doctorTable').innerHTML = Sturesult;
		}
	}
</script>
</html>
