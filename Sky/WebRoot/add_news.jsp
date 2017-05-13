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

</head>
<body>
	<div class="content sky-content" id="page-container">
		<div class="frame-records">
			<div class="records-new part4">
				<div class="title">增加新闻<span style="font-size: 12px;color:#f00;">&nbsp;&nbsp;带*为必填项</span></div>
				<div class="context" style="padding-left: 10px !important;">
							<form name="addform" id="addform" class="form-horizontal"
								action="addNews" method="post">
								<fieldset>
								<div >
									<div class="form-group">
										<label for="IDCard" class="col-sm-3 control-label">标题</label>
										<div class="col-sm-6">
											<input type="text" class="form-control col-sm-6" id="title"
												name="title" placeholder="标题" value='' required
												onblur="" />
											<span style="font-size:20px; color:#f00;position: absolute;top:5px;">&nbsp;&nbsp;*</span>
										</div>
										
										
									</div>
									<div class="form-group">
										<label for="IDCard" class="col-sm-3 control-label">内容</label>
										<div class="col-sm-6">
											<textarea rows="20" type="text" class="form-control col-sm-6" id="content"
												name="content" placeholder="内容" value='' required></textarea>
											
										</div>
									</div>
									
								
									</div>
									
								</fieldset>
								<div class="modal-footer" style="padding-right: 13%;">
									<a href="findNews.action" class="btn btn-warning">返回</a>
									<button type="submit" class="btn btn-primary" id="submit">发布</button>
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

		function checkusername() {
			var username = document.getElementById("username").value;
			var url = "checkStuInfo.action?username=" + username;
			createXMLHttpRequest();
			xmlHttpReq.open("POST", url, true);
			xmlHttpReq.onreadystatechange = getResult;
			xmlHttpReq.send(null);

		}
		function getResult() {
			if (xmlHttpReq.readyState == 4) {
				var res = eval('(' + xmlHttpReq.responseText + ')');
				var msg = res.MSG;
				var checkusernameinfo = document.getElementById("checkusernameinfo");
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

</body>

</html>