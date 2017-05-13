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
					学生站内信
				</div>
				
				<div class="context">
					<div class="table-responsive">
						<table class="table table-hover table-bordered big-data table-striped">
							<colgroup>
								<col style="">
								<col style="">
								<col style="">
								<col style="">
								<col style="">
							</colgroup>
							<thead style="background-color:#EEEEEE;">
								<tr>
									<th>编号</th>
									<th>主要内容</th>
									<th>推送时间</th>
									<th>推送人</th>
									<th style="text-align: center;">操作</th>
								</tr>
							</thead>
							<tbody id="userinfoTbody">
								<s:iterator value="list" status="st">
									<tr class="gradec">
										<td style="display:none"><s:property value="messageId" /></td>
										<td><s:property value="#st.count"/></td>
										<td><s:property value="text" /></td>
										<td><s:property value="pdate" /></td>
										<td><s:property value="senderlevel" /></td>
										<td style="text-align: center;">
											<a class="btn-sm" href="clickmessage?messageId=<s:property value='messageId'/>">查看</a>
										</td>
									</tr>
								</s:iterator>
							</tbody>

						</table>
					</div>
					<div>
						<div id="pageTable">
								<s:if test="%{pageBean.currentPage == 1}">首页 上一页 </s:if>
								<s:else>
									<a href="listParentsMessage!listParentsMessage?page=1">首页 </a>
									<a href="listParentsMessage!listParentsMessage?page=<s:property value="%{pageBean.currentPage-1}"/>" />上一页 </a>
								</s:else>
								<s:if test="%{pageBean.currentPage != pageBean.totalPage}">
									<a href="listParentsMessage!listParentsMessage?page=<s:property value="%{pageBean.currentPage+1}"/>">下一页 </a>
									<a href="listParentsMessage!listParentsMessage?page=<s:property value="pageBean.totalPage"/>">尾页 </a>
								</s:if>
								<s:else>下一页 尾页 </s:else>
								第 <s:property value="pageBean.currentPage" />/<s:property value="pageBean.totalPage" />页 
								共<s:property value="pageBean.allRow" />条记录
							</div>
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