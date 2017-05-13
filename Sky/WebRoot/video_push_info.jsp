<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML>
<html>
<head>
<title>流媒体项目名称</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">

<!-- Css -->
<link href="css/stylesheet.css" rel="stylesheet" type="text/css" />
<!--  -->
<link href="css/main.css" rel="stylesheet" type="text/css">

<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<link href="css/main.min.css" rel="stylesheet" type="text/css">
<script src="bootstrap/js/bootstrap.min.js"></script>

<link href="css/dataTables.bootstrap.css"
	rel="stylesheet" type="text/css">

<script src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="jquery/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.js"></script>
<!-- 
<style type="text/css">    
 body{    
   	  background-image:url(images/112.jpg);
   	  repeat:x;
 }
 </style>
  -->
<!--
<link href="css/main.css" rel="stylesheet" type="text/css">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<link href="css/dataTables.bootstrap.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript" src="jquery/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.js"></script>
-->
</head>
<body>


	<div class="header sky-title shadow">
		<div class="header-item split-left">
			<a style="text-decoration: none;color: #F9F7F7" href="loginOutServlet" >退出</a>
		</div>
		<!-- <div class="header-item split-left">我的消息</div> -->
		<div class="header-item" style="width:50%;text-align:right;padding-right: 5px;">
			<span style="color:#FCCA08;"><%=request.getSession().getAttribute("username")%></span> ，欢迎您！
		</div>
	</div>
	<div class="main-top header-fix split-bottom" style="background-color: #0072C6;">
		<img src="images/projectname.png" style="position: absolute;top: 12%;left: 1%;">
	</div>
	<!--Menu Part start-->
	<div class="menu-part">	<!-- padding-left:20%;padding-right:auto; -->

		<ul>
			<li><a href="stream_media_web.jsp" style="position: relative;">首页</a>
			</li>
			<li><a href="allVideoInfoServlet" style="position: relative;">视频流管理</a>
			</li>
			<li><a href="allPhonesInfoServlet" style="position: relative;">移动设备管理</a>
			</li>
			<li><a href="allCamerasInfoServlet" style="position: relative;">摄像头管理</a>	<!-- allCamerasInfoServlet -->
			</li>
			<!--
			<li><a href="video_start_info.jsp" style="position: relative;">启动视频流</a>
			</li>
			-->
		</ul>

	</div>
	<!--Menu Part End-->

	<div class="content sky-content" id="page-container">
		<div class="frame-records">
			<div class="records-new part4">
				<div class="title" style="text-align:right;padding-right:20px;">视频流推送
					<!--<span style="font-size: 12px;color:#f00;">&nbsp;&nbsp;带*为必填项</span>-->
					<a href="allOnlinePhonesInfoServlet?iccid=<%=request.getParameter("iccid")%>" class="btn btn-sm"
					    style="position:absolute;right:120px;top:2px;background-color: #3CBE86;color: #fff;"	>显示在线设备</a>
					<!--
					<a href="stream_media_web.jsp" class="btn btn-sm"
						 style="position:absolute;right:20px;top:2px;background-color: #3CBE86;color: #fff;" >返回主界面</a>
					-->
				</div>
				<div class="context" style="padding-left: 10px !important;">
							
							
							
							<form name="addform" id="addform" class="form-horizontal"
								action="addPushInfoServlet" method="post">	<!-- onsubmit="return checkform()" -->
								<fieldset>
								<!-- <div class="f2"> -->
									<div class="form-group">
										<label for="IDCard" class="col-sm-3 control-label">
										<span style="color: red;padding-right: 5px;vertical-align: middle;">*</span>视频流ID</label>
										<div class="col-sm-6">
											<input type="text" class="form-control col-sm-6" id="iccid"
												name="iccid" value='<%=request.getParameter("iccid")%>' readonly="readonly">	<!-- onblur="checkschoolname()" -->
											
										</div>
									</div>
									
									<div class="context">
										<div class="table-responsive" style="overflow-y: auto;">
											<table class="table table-hover table-bordered table-condensed table-striped"
												 id="table_id" style="text-align:center">
												<colgroup>
													<col style="">
													<col style="">
													<col style="">
													<col style="">
													<!-- 
													<col style="">
													<col style="width: 225px">
													 -->
												</colgroup>
												<thead style="background-color:#EEEEEE;">
													<tr>
														<th style="text-align: center;">勾选<!-- <input type="checkbox" name="pushbox"/> --></th>
														<th style="text-align: center;">序号</th>
														<th style="text-align: center;">手机号</th>
														<th style="text-align: center;">设备号</th>
														<!-- 
														<th style="text-align: center;">是否授权</th>
														 -->
														<!-- 
														<th style="text-align: center;" id="operate">操作</th>
														 -->
													</tr>
												</thead>
												<tbody id="userinfoTbody">
													<c:forEach var="list" items="${list}"  varStatus="status">
														<tr class="gradec">
															<td><input type="checkbox" name="pushbox" value="${list.imsi}"/></td>
															<td>${status.index+1}</td>
															<td>${list.phone_number}</td>
															<td>${list.imsi}</td>
															<!-- 
															<td>${list.authorization}</td>
															 -->
															<!-- 
															<td style="text-align: center;">
																<a class="btn-sm" href="addPushInfoServlet?imsi=${list.IMSI}">视频推送</a>
															</td>
															 -->
														</tr>
													</c:forEach>
												</tbody>
					
											</table>
										</div>
										<div>
											<table id="pageTable">
												<tr>
													<td>共 ${size} 条记录
													</td>
												</tr>
											</table>
										</div>
									</div>									
									
									
								</fieldset>
								<div class="modal-footer" style="padding-right: 13%;">
									<button type="button" class="btn btn-warning"
										onClick="history.back(-1)">取消</button>
									<button type="submit" class="btn btn-primary" id="submit">推送</button>
								</div>
							</form>
				</div>
			</div>
		</div>
	</div>
    
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
		
		$(document).ready( function () {
   	 		$('#table_id').DataTable({
   	 			"oLanguage":{
   	 				"sLengthMenu":"每页显示 _MENU_ 条记录",
   	 				"sZeroRecords": "抱歉， 没有找到",
		          	"sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
		          	"sInfoEmpty": "没有数据",
		          	"sInfoFiltered": "(从 _MAX_ 条数据中检索)",
		          	"sZeroRecords": "没有检索到数据",
		          	"sSearch": "搜索:",
					"oPaginate": {
			          "sFirst": "首页",
			          "sPrevious": "前一页",
			          "sNext": "后一页",
			          "sLast": "尾页"
			          }

   	 			},
   	 		});
		});
		

	</script>

</body>

</html>