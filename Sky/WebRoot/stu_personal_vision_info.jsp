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
				<div class="title">视觉档案</div>
				<div class="context">
					<div class="table-responsive">
						<table class="table table-hover table-bordered big-data table-striped ">
							<colgroup>
								<col style="">
								<col style="">
								<col style="">
								<col style="">
								<col style="">
								<col style="">
								<col style="width:300px;" >
							</colgroup>
							<thead>
								<tr>
									<th>档案编号</th>
									<th>检查序列</th>
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
										<td><s:property value="checkSequence" /></td>
										<td><s:property value="checkTime" /></td>
										<td><s:property value="checkTheDataExaminer" /></td>
										<td><s:property value="recorder" /></td>
										<td><s:property value="recordTime" /></td>
										<td class="text-center"><a class="btn-sm"
											href="detailVisionInfo.action?tableId=<s:property value='tableId'/>">查看详情</a>
											<span style="color: #E0E0E0">|</span><a class="btn-sm"
											href="stuCheckAssessmentFromId.action?tableId=<s:property value='tableId'/>">查看诊断意见</a>
											<span style="color: #E0E0E0">|</span><a class="btn-sm"
											href="modifydetailVisionInfo.action?tableId=<s:property value='tableId'/>">修改</a>
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
										<a href="stuPersonalVisionInfo!stuPersonalVisionInfo?page=1">首页</a>
										<a
											href="stuPersonalVisionInfo!stuPersonalVisionInfo?page=<s:property value="%{pageBean.currentPage-1}"/>" />上一页</a>
									</s:else>
								</td>
								<td><s:if
										test="%{pageBean.currentPage != pageBean.totalPage}">
										<a
											href="stuPersonalVisionInfo!stuPersonalVisionInfo?page=<s:property value="%{pageBean.currentPage+1}"/>">下一页</a>
										<a
											href="stuPersonalVisionInfo!stuPersonalVisionInfo?page=<s:property value="pageBean.totalPage"/>">尾页</a>
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
</html>