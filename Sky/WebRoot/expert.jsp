<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
				<div class="title">患者信息</div>
				<div class="context">
					<div class="table-responsive">
						<table class="table table-hover table-bordered big-data">
							<colgroup>
								<col style="">
								<col style="">
								<col style="">
								<col style="">
								<col style="">
								<col style="">
								<col style="">
								<col style="">
								<col style="">
								<col style="">
								<col style="">
								<col style="width: 11%">
							</colgroup>
							<thead>
								<tr>									
									<th>学号</th>
									<th>姓名</th>
									<th>性别</th>
									<th>年龄</th>
									<th>学校</th>
									<th>年级</th>
									<th>班级</th>
									<th>民族</th>
									<th>身高</th>
									<th>体重</th>
									<th>社区</th>
									<th style="text-align: center;">操作</th>
								</tr>
							</thead>
							<tbody>
								<s:iterator value="list">
									<tr class="gradec">
										<td><s:property value="username" /></td>
										<td><s:property value="realname" /></td>
										<td><s:property value="gender" /></td>
										<td><s:property value="age" /></td>
										<td><s:property value="school" /></td>
										<td><s:property value="grade" /></td>
										<td><s:property value="stuClass" /></td>
										<td><s:property value="nation" /></td>
										<td><s:property value="height" /></td>
										<td><s:property value="weight" /></td>
										<td><s:property value="address" /></td>
										<td style="text-align: center;"><a class="btn-sm"
											href="expertDiagnoseOneStu.action?username=<s:property value='username'/>">查看视觉档案</a>
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
										<a href="expertDiagnose!expertDiagnose?page=1">首页</a>
										<a
											href="expertDiagnose!expertDiagnose?page=<s:property value="%{pageBean.currentPage-1}"/>" />上一页</a>
									</s:else>
								</td>
								<td><s:if
										test="%{pageBean.currentPage != pageBean.totalPage}">
										<a
											href="expertDiagnose!expertDiagnose?page=<s:property value="%{pageBean.currentPage+1}"/>">下一页</a>
										<a
											href="expertDiagnose!expertDiagnose?page=<s:property value="pageBean.totalPage"/>">尾页</a>
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
