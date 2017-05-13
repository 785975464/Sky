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
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">	<!-- 与表格的格式有关 2016-1-9 -->
<script type="text/javascript" src="jquery/jquery.min.js"></script>

</head>
<body>	<!-- onload="setup()" -->
	<div class="content sky-content" id="page-container">
		<div class="frame-records">
			<div class="records-new part4">
				<div class="title">修改地址</div>
				<div class="context" style="padding-left: 10px !important;">
					<form name="updateform" id="updateform" class="form-horizontal"
						action="updateAddressInfo" method="post" >	<!--   onsubmit="return checkform()" -->
						<fieldset>
								<div class="form-group" >	<!-- style="display:none;" -->
									<label for="IDCard" class="col-sm-3 control-label">地址编号</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="addressid"
											name="addressid" value='${addressinfo.addressid}'
											readonly="readonly" required="required">
									</div>
								</div>
								
								<div class="form-group" >
									<label for="IDCard" class="col-sm-3 control-label"><span style="color: red;padding-right: 5px;vertical-align: middle;">*</span>城市</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="district"
											name="district" value='${addressinfo.district}'
											readonly="readonly" required="required">
									</div>
								</div>
								
								<div class="form-group">
									<label for="IDCard" class="col-sm-3 control-label"><span style="color: red;padding-right: 5px;vertical-align: middle;">*</span>街道</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="street"
											name="street" value='${addressinfo.street}'
											readonly="readonly" required="required">	<!-- onblur="checkaddress()"  -->
									</div>
									<span style="color:#f00;position: relative;top: 5px;left: 20px" id="checkaddressinfo"></span>
								</div>
								
								<div class="form-group" >
									<label for="IDCard" class="col-sm-3 control-label"><span style="color: red;padding-right: 5px;vertical-align: middle;">*</span>社区</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="community"
											name="community" value='${addressinfo.community}'
											required="required">
									</div>
								</div>
								
						</fieldset>
						<div class="modal-footer" style="padding-right: 22%;">
							<button type="button" class="btn btn-warning"
								onClick="history.back(-1)">取消</button>
							<button type="submit" class="btn btn-primary" id="submit">确定</button>
						</div>
					</form>
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
			var schoolid = document.getElementById("schoolid").value;
			var schoolname = document.getElementById("schoolname").value;
			if(schoolname==''){
				var checkschoolnameinfo = document.getElementById("checkschoolnameinfo");
				checkschoolnameinfo.innerText = "输入不得为空！";
				return null;
			}
			//alert("schoolname为："+schoolname);
			var url = "checkSchInfo.action?schoolid=" + schoolid +"&schoolname="+encodeURI(encodeURI(schoolname));
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