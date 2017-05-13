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
<link href="css/main.min.css" rel="stylesheet" type="text/css">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<link href="bootstrap/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript" src="jquery/jquery.min.js"></script>


</head>
<body onload="setup()">	<!-- onload="setup();promptinfo();setdisabled();" -->
	<div class="content sky-content" id="page-container">
		<div class="frame-records">
			<div class="records-new part4">
				<div class="title">添加学校<span style="font-size: 12px;color:#f00;">&nbsp;&nbsp;带*为必填项</span></div>
				<div class="context" style="padding-left: 10px !important;">
							
							
							
							<form name="addform" id="addform" class="form-horizontal"
								action="addSchoolInfo" method="post">	<!-- onsubmit="return checkform()" -->
								<fieldset>
								<!-- <div class="f2"> -->
									<div class="form-group">
										<label for="IDCard" class="col-sm-3 control-label">
										<span style="color: red;padding-right: 5px;vertical-align: middle;">*</span>学校名称</label>
										<div class="col-sm-6">
											<input type="text" class="form-control col-sm-6" id="schoolname"
												name="schoolname" placeholder="请填写学校名称" value='' required onblur="checkschoolname()">
											
										</div>
										<span style="color:#f00;position: relative;top: 5px;left: 20px" id="checkschoolnameinfo"></span>
									</div>
									
									<div class="form-group">
										<label for="IDCard" class="col-sm-3 control-label">授权社区</label>
										<div class="col-sm-6">
											<select type="select" id="addressid" name="addressid" class="form-control" 
												style="color: #000;" value="list2">
												<option value='0'>请选择授权社区</option>
												<s:iterator value="list2" status="adslist">
													<option value='<s:property value="addressid" />'>
														<s:property value="community+'（'+district+','+street+'）'" /></option>
												</s:iterator>
											</select>
										</div>
									</div>
									
									
								</fieldset>
							<!-- 
								<div>
					 			<select type="select" id="search_school" name="search_school" class="form-control" style="position:absolute;width:150px;right:380px;top:0px;color: #000;" value="list">
									<s:iterator value="list" status="st">
										<option value='<s:property value="schoolid" />'><s:property value="schoolname" /></option>
									</s:iterator>
								</select>
								</div>
							 -->
								<div class="modal-footer" style="padding-right: 13%;">
									<a href="allSchoolInfo.action" class="btn btn-warning">返回</a>
									<button type="submit" class="btn btn-primary" id="submit">增加</button>
								</div>
							</form>
						<!-- </div>
					</div> -->
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
		function checkschoolname() {
			var schoolname = document.getElementById("schoolname").value;
			if(schoolname==''){
				var checkschoolnameinfo = document.getElementById("checkschoolnameinfo");
				checkschoolnameinfo.innerText = "输入不得为空！";
				return null;
			}
			var url = "checkSchInfo.action?schoolname="+encodeURI(encodeURI(schoolname));
			createXMLHttpRequest();
			xmlHttpReq.open("POST", url, true);
			xmlHttpReq.onreadystatechange = getResult;
			xmlHttpReq.send(null);
		}
		function getResult() {
			if (xmlHttpReq.readyState == 4) {
				var res = eval('(' + xmlHttpReq.responseText + ')');
				var msg = res.MSG;
				//alert("msg为："+msg);
				var checkschoolnameinfo = document.getElementById("checkschoolnameinfo");
				if (msg) {
					checkschoolnameinfo.innerText = msg;	//学校名称输入不合法 2016-1-10
					document.getElementById("submit").disabled = true;
				} else {
					//checkschoolnameinfo.innerText = msg;
					checkschoolnameinfo.innerText = "输入正确！";
					document.getElementById("submit").disabled = false;
				}
			}
		}
		function setup(){
			document.getElementById("submit").disabled = true;
		}
	</script>

</body>

</html>