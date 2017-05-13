﻿  <%@ page contentType="text/html" pageEncoding="UTF-8"%>	<!-- GBK -->
<%@taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML>
<html>
<head>
<title>视康云</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
<link href="css/main.min.css" rel="stylesheet" type="text/css">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<link href="bootstrap/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript" src="jquery/jquery.min.js"></script>


</head>
<body>
	<div class="content sky-content" id="page-container">
		<div class="frame-records">
			<div class="records-new part4">
				<div class="title">选择学校数据进行下载
				<!-- <span style="font-size: 12px;color:#f00;">&nbsp;&nbsp;带*为必填项</span> -->
				</div>
				<a href="downloadStuInfo.action" id="search" style="position:absolute;left:200px;top:2px;background-color: #3CBE86;color: #fff;"	
					class="btn btn-sm " >切换至社区数据</a>
				<div class="context" style="padding-left: 10px !important;">
					<form name="addform" id="addform" class="form-horizontal"
						action="downloadSchoolInfo" method="post">
						<div class="table-responsive" style="overflow-y: auto;">
							<table class="table table-hover table-bordered big-data table-striped">
								<colgroup>
									<col style="">	<!-- width: 50px -->
									<col style="">	<!-- width: 50px -->
									<col style="">
									<!-- 
									<col style="">
									 -->
									<col style="">
									
									<col style="width: 225px">
								</colgroup>
								<thead style="background-color:#EEEEEE;">
									<tr>
										<th style="text-align: center;">序号</th>
										<th style="text-align: center;">勾选</th>
										<th style="text-align: center;">学校</th>
										<!-- 
										<th style="text-align: center;">街道</th>
										<th style="text-align: center;">社区</th>
										 -->
										<th style="text-align: center;">学校人数</th>
										<th style="text-align: center;">操作</th>
									</tr>
								</thead>
								<tbody id="schoolinfoTbody">
									<s:iterator value="list" status="st">
										<tr class="gradec">
											<td style="display:none"><s:property value="schoolid" /></td>
											<td style="text-align: center;"><s:property value="#st.count"/></td>
											<td style="text-align: center;"><input type="checkbox" name="downloadbox" 
												value="<s:property value='schoolname' />"/>
											</td>
											<td style="text-align: center;"><s:property value="schoolname" /></td>
											<!-- 
											<td><s:property value="street" /></td>
											<td><s:property value="community" /></td>
											 -->
											<td style="text-align: center;">
												<s:property value="peopleSchoolComputing(schoolname)" /></td>
											<td style="text-align: center;">
												<a class="btn-sm" href="downloadSingleSchoolInfo.action?
													schoolid=<s:property value='schoolid'/>" >下载</a> 
											</td>
										</tr>
									</s:iterator>
								</tbody>
	
							</table>
						</div>
						
						
						<div class="modal-footer" style="padding-right: 13%;">
							<button type="button" class="btn btn-warning" style="position:absolute;left:20px;"
								id="choosebox" onclick="chooseAll()">全选</button>
							<button type="submit" class="btn btn-primary" id="submit">下载</button>
						</div>
					</form>
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
		var xmlHttpReq;
		function createXMLHttpRequest() {
			if (window.XMLHttpRequest) {
				xmlHttpReq = new XMLHttpRequest();
			} else if (window.ActiveXObject) {
				try {
					xmlHttpReq = new ActiveXObject("MSXML2.XMLHTTP");
				} catch (e) {
					xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
				}
			}
		}
		
		function chooseAll(){
			//alert("chooseAll!");
			
			//var downloadbox = document.getElementsByTagName("checkbox");
			var downloadbox = document.getElementsByName("downloadbox");
			
			//alert(downloadbox.length);
			if(document.getElementById("choosebox").innerHTML=="全选"){
				for(var i=0;i<downloadbox.length;i++){
					downloadbox[i].checked = true;
				}
				document.getElementById("choosebox").innerHTML="取消";
				//alert(document.getElementById("choosebox").innerHTML);
			}
			else{
				for(var i=0;i<downloadbox.length;i++){
					downloadbox[i].checked = false;
				}
				document.getElementById("choosebox").innerHTML="全选";
				//alert(document.getElementById("choosebox").innerHTML);
			}
		}
	</script>

</body>

</html>