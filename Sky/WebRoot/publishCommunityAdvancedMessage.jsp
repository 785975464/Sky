<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html>

<head>
<title>视康云</title>
<meta charset="UTF-8">
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
		<div  class="title">
			<label>【高级】信息发布：</label> 
		</div>
		<form role="form"  class="form-horizontal" action="publishCommunityAdvancedMessage" method="post">
			
			<div class="form-group" style="margin-left:20%;">
				<label class="col-sm-3 control-label">
				<span style="color: red;padding-right: 5px;vertical-align: middle;">*</span>接收对象</label>
				<div class="col-sm-3">
					<input type="text" class="form-control col-sm-6" id="receiverlevel"
						name="receiverlevel" value="<% //=request.getParameter("a")
						if( request.getParameter("a").equals("0"))
							out.println("学生");
						else
							out.println("家长");
						%>"  readonly="readonly">
				</div>
				
			</div>
			
			<div class="form-group" style="margin-left:20%;">
				<label class="col-sm-3 control-label">
				<span style="color: red;padding-right: 5px;vertical-align: middle;">*</span>选择视觉等级</label>
				<div class="col-sm-3">
					<select class="form-control" name="visionlevel" id="visionlevel">
						<option value='-1'  selected="selected">请选择视觉等级</option>
						<option value="正常">正常</option>
						<option value="预警">预警</option>
						<option value="异常">异常</option>
					</select>
				</div>
			</div>
			
			<div class="form-group" style="margin-left:20%;">
				<label class="col-sm-3 control-label">
				<span style="color: red;padding-right: 5px;vertical-align: middle;">*</span>是否超期未复查</label>
				<div class="col-sm-3">
					<select class="form-control" name="isrecheck" id="isrecheck">
						<option value='-1'  selected="selected">请选择是否超期</option>
						<option value="1">是</option>
						<option value="0">否</option>
					</select>
				</div>
			</div>
			
			<div>
				<input class="form-control" type="text" id="text" name="text"
					required="required"/>
				<!-- 
				<textarea rows="5" cols="100" id="text" name="text" style="text-align:center;margin:auto;">
				测试textarea
				</textarea>
				 -->
				<div style="text-align:center;margin-top: 20px;">
					<button type="button" class="btn btn-warning"
								onClick="history.back(-1)">取消</button>
					<button type="submit" class="btn btn-primary" id="submit"
					 	style="text-align:center;">发布</button>
				</div>
			</div>
			<!-- 
			<div class="modal-footer" style="padding-right: 50%;">
				<a href="allSchoolInfo.action" class="btn btn-warning">返回</a>
				<button type="submit" class="btn btn-primary" id="submit">增加</button>
			</div>
			 -->
		</form>
	</div>

</body>
<script type="text/javascript">
	var height = document.getElementById("page-container").scrollHeight;
	parent.AdjustIframeHeight(height);
	$(window).resize(function() {
		var height = document.getElementById("page-container").scrollHeight;
		parent.AdjustIframeHeight(height);
	});
	$(function() {
		$("#docs-tab a")
				.click(
						function(e) {
							$(this).tab('show');
							var height = document
									.getElementById("page-container").scrollHeight;
							parent.AdjustIframeHeight(height);
						});
	});
</script>


</html>