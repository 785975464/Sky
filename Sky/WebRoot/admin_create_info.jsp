<%@ page contentType="text/html" pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="bootstrap/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript"
	src="bootstrap/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript" src="js/geo.js"></script>

</head>
<body onload="setup();promptinfo();setdisabled();">
	<div class="content sky-content" id="page-container">
		<div class="frame-records">
			<div class="records-new part4">
				<div class="title">添加用户<span style="font-size: 12px;color:#f00;">&nbsp;&nbsp;带*为必填项</span></div>
				<div class="context" style="padding-left: 10px !important;">
					<form role="form" name="addform" id="addform"
						class="form-horizontal" action="addUser" method="post" onsubmit="return checkform()">
						<fieldset>
							<div class="form-group">
								<label class="col-sm-3 control-label">用户名</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="username"
										name="username" value="" required="required"
										onblur="checkusername()" />
									<span style="font-size:20px; color:#f00;position: absolute;top:5px;right:-2px;">*</span>
								</div>
								<span style="color:#f00;position: absolute;top: 10px;right: 38%""
									id="checkusernameinfo"></span>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">姓名</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="realname"
										name="realname" value="" required="required" />
									<span style="font-size:20px; color:#f00;position: absolute;top:5px;right:-2px;">*</span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">身份</label>
								<div class="col-sm-4">
									<select class="form-control" name="level" id="level">
										<option value="学生">学生</option>
										<option value="家长">家长</option>
										<option value="校医">校医</option>
										<option value="社工">社工</option>
										<option value="专家">专家</option>
										<option value="管理员">管理员</option>
									</select>
									<span style="font-size:20px; color:#f00;position: absolute;top:5px;right:-2px;">*</span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">性别</label>
								<div class="col-sm-4">
									<select class="form-control" name="gender" id="gender">
										<option value="男">男</option>
										<option value="女">女</option>
									</select>
									<span style="font-size:20px; color:#f00;position: absolute;top:5px;right:-2px;">*</span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">年龄</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="age" name="age"
										value="" required="required" />
										<span style="font-size:20px; color:#f00;position: absolute;top:5px;right:-2px;">*</span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">学校</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="school" name="school"
										value="" />
									<span style="font-size:20px; color:#f00;position: absolute;top:5px;right:-2px;">*</span>
									<span style="font-size:12px; color:#f00;position: absolute;top:7px;right:-90px;">学生、校医必填</span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">通信地址</label>
								
								<div class="col-sm-4">
									<!-- <input type="text" class="form-control" id="address"
										name="address" value="" /> -->
								<input type="hidden" class="form-control" id="address"
										name="address" value="" />
							 	<span style="font-size:20px; color:#f00;position: absolute;top:5px;right:-2px;">*</span>
							 	<span style="font-size:12px; color:#f00;position: absolute;top:7px;right:-125px;">社区人员务必准确填写</span>

					            <select class="select" name="province" id="s1">
					              <option></option>
					            </select>
					            <select class="select" name="city" id="s2">
					              <option></option>
					            </select>
					            <select class="select" name="town" id="s3" onclick="setabled()">
					              <option></option>
					            </select>
      <!-- 
        <input type="text" class="form-control" id="s4" name="street" placeholder="请输入所在街道" value='' 
      	  style="margin-top:10px" required="required" onblur="promptinfo()"/>
      -->
      										
								<input type="text" class="form-control" id="s4" name="street" placeholder="请输入所在街道" value='' 
									style="margin-top:10px" required="required" onblur="promptinfo()"/>
								<input type="text" class="form-control" id="s5" name="community" placeholder="请输入所在社区" value='' 
									style="margin-top:10px" required="required" onblur="promptinfo()"/>
								
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">联系电话</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="phone" name="phone"
										value="" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">E-mail</label>
								<div class="col-sm-4">
									<input type="email" class="form-control" id="email"
										name="email" value=""/>
								</div>
							</div>
						</fieldset>
						<div class="modal-footer" style="padding-right: 43%;">
							<button type="submit" class="btn btn-primary" id="submit">增加</button>
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

		function checkusername() {
			var username = document.getElementById("username").value;
			var url = "checkUser.action?username=" + username;
			createXMLHttpRequest();
			xmlHttpReq.open("POST", url, true);
			xmlHttpReq.onreadystatechange = getResult;
			xmlHttpReq.send(null);

		}
		function checkform()
		{
			if((document.getElementById("level").value=="学生" || document.getElementById("level").value=="校医") && document.getElementById("school").value=='')
			{
				alert("请填写学校名称！");
				return false;
			}
			if(document.getElementById("s1").value=="省份" || document.getElementById("s2").value=="地级市"  || document.getElementById("s3").value=="县级市、县"
			 || document.getElementById("s4").value=='' || document.getElementById("s5").value=='')
			{
				alert("请填写通信地址！");
				return false;
			}
			else{
				//alert(document.getElementById("s1").value+document.getElementById("s2").value+document.getElementById("s3").value+document.getElementById("s4").value);
				alert("成功添加信息！");
				return true;
			}
		}
		function setdisabled(){
			document.getElementById("s4").disabled=true;
			document.getElementById("s5").disabled=true;
		}
		function setabled(){
			if(document.getElementById("s3").value!="县级市、县"){
				document.getElementById("s4").disabled=false;
				document.getElementById("s5").disabled=false;
			}
		}
		function getResult() {
			if (xmlHttpReq.readyState == 4) {
				var res = eval('(' + xmlHttpReq.responseText + ')');
				var msg = res.MSG;
				var checkusernameinfo = document
						.getElementById("checkusernameinfo");
				if (msg) {
					checkusernameinfo.innerText = msg;
					document.getElementById("submit").disabled = true;
				} else {
					checkusernameinfo.innerText = msg;
					document.getElementById("submit").disabled = false;
				}
			}
		}
	</script>
	<script>

//这个函数是必须的，因为在geo.js里每次更改地址时会调用此函数
function promptinfo()
{
    var address = document.getElementById('address');
    var s1 = document.getElementById('s1');
    var s2 = document.getElementById('s2');
    var s3 = document.getElementById('s3');
    var s4 = document.getElementById('s4');
    var s5 = document.getElementById('s5');
    address.value = s1.value +"," + s2.value + "," + s3.value + "," + s4.value + "," + s5.value;
}
</script>
</body>

</html>