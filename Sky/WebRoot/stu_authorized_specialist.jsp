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
				<div class="title">
					授权专家<a href="studentApplyExpert.action"
						style="position:absolute;right:10px;top:2px;background-color: #3CBE86;color: #fff;"
						class="btn btn-sm">添加专家</a>
				</div>
				<div class="context">
					<div class="table-responsive">
						<table class="table table-hover table-bordered big-data">
							<colgroup>
								<col style="">
								<col style="">
								<col style="">
								<col style="">
								<col style="width:8%;">
							</colgroup>
							<thead class="text-center">
								<tr>
									<th>专家号</th>
									<th>姓名</th>
									<th>性别</th>
									<th>年龄</th>
									<th style="text-align: center;">操作</th>
								</tr>
							</thead>
							<tbody id="doctorTable">
								<s:iterator value="list" id="au">
									<tr class="gradec">
										<td>${au[0].specialistName}</td>
										<td>${au[1].realname}</td>
										<td>${au[1].gender}</td>
										<td>${au[1].age}</td>
										<td style="text-align: center;"><input type="button"
											class="btn btn-danger btn-sm" value="取消授权"
											onclick="del(this,${au[0].id})"></input></td>
									</tr>
								</s:iterator>
							</tbody>
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
				Sturesult += "<td>" + authorizerelation[i].realname + "</td>";
				Sturesult += "<td>" + authorizerelation[i].gender + "</td>";
				Sturesult += "<td>" + authorizerelation[i].age + "</td>";			
				Sturesult += "<td  style='text-align: center;'>";
				Sturesult += "<input type='button' class='btn btn-danger btn-sm' value='取消授权' onclick='del(this,"+authorizerelation[i].id+")'></input>";
				Sturesult += "</td>";
				Sturesult += "</tr>";
			}
			Sturesult += "</tbody>";
			document.getElementById('doctorTable').innerHTML = Sturesult;
		}
	}
</script>
</html>