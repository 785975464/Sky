<%@taglib prefix="s" uri="/struts-tags"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
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
				<div class="title">用户信息
					<!-- 
					<input type="text"	class="input-sm search-query title-search-input" id="search_realname" placeholder="请输入姓名" required="required" style="position:absolute;right:220px;color: #000;">
					<input type="text"	class="input-sm search-query title-search-input" id="search_username" placeholder="请输入学号" required="required" style="color: #000">	
					<input type="text"	class="input-sm search-query title-search-input" id="search_school" placeholder="请输入学校" required="required" style="color: #000">
					<input type="button" style="background-color: #3CBE86;color: #fff;"	class="btn btn-sm title-search-btn" value="搜索"	onclick="search()" /> 
					 -->
				</div>
				<div class="context">
					<div class="table-responsive">
						<table class="table table-hover table-bordered big-data table-striped">
							<colgroup>
								<col style="width: 180px">
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
							</colgroup>
							<thead style="background-color:#EEEEEE;">
								<tr>
									<th>ID</th>
									<th>密码</th>
									<th>角色</th>
									<th>姓名</th>
									<th>性别</th>
									<th>年龄</th>
									<th>地址</th>
									<th>联系电话</th>
									<th>创建者</th>
									<th>管理者</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="userinfoTbody">
								<s:iterator value="list">
									<tr class="gradec">
										<td><s:property value="username" />
										</td>
										<td><s:property value="password" />
										</td>
										<td><s:property value="level" />
										</td>
										<td><s:property value="realname" />
										</td>
										<td><s:property value="gender" />
										</td>
										<td><s:property value="age" />
										</td>
										<td><s:property value="address" />
										</td>
										<td><s:property value="phone" />
										</td>
										<td><s:property value="creater" />
										</td>
										<td><s:property value="manager" /></td>
										<td>
											<a href="modifyManager?username=<s:property value="username" />">修改管理者</a>
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
										<a href="allInfo!allInfo?page=1">首页</a>
										<a
											href="allInfo!allInfo?page=<s:property value="%{pageBean.currentPage-1}"/>" />上一页</a>
									</s:else></td>
								<td><s:if
										test="%{pageBean.currentPage != pageBean.totalPage}">
										<a
											href="allInfo!allInfo?page=<s:property value="%{pageBean.currentPage+1}"/>">下一页</a>
										<a
											href="allInfo!allInfo?page=<s:property value="pageBean.totalPage"/>">尾页</a>
									</s:if> <s:else>下一页  尾页</s:else>
								</td>
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
		$(window)
				.resize(
						function() {
							var height = document
									.getElementById("page-container").scrollHeight;
							parent.AdjustIframeHeight(height);
						});
	</script>
</body>

</html>
