<%@taglib prefix="s" uri="/struts-tags" %><!-- pageEncoding="GB2312" -->
<%@ page pageEncoding="utf-8"%>

<%@ page contentType="text/html;charset=GBK"%>
<!DOCTYPE HTML>
<html>
<head>
<title>视康云</title>
<meta charset="GBK">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
<script src="jquery/jquery.min.js"></script>
<link href="css/main.min.css" rel="stylesheet" type="text/css">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<script src="bootstrap/js/bootstrap.min.js"></script>

</head>

<body>	<!-- onload="code();" -->
	<div class="content sky-content" id="page-container">
		<div class="frame-records">
			<div class="records-new part4">
				<div class="title" id="community-manage" >数据批量导入结果
				    <!-- 
				    <a href="createCommunityInfo.action" class="btn btn-sm"
				    	style="position:absolute;left:120px;top:2px;background-color: #3CBE86;color: #fff;"	>添加学生</a>
					<a href="download.action?fileName=muban.xlsx" class="btn btn-sm"
						style="position:absolute;left:200px;top:2px;background-color: #3CBE86;color: #fff;" >Excel文件模板</a>
					 -->
					<a href="allStuInfo.action" class="btn btn-sm"
				    	style="position:absolute;right:10px;top:2px;background-color: #3CBE86;color: #fff;"	>返回</a>
				</div>
        		
				 
				<div class="context">
					<div class="table-responsive" style="overflow-y: auto;">		<!-- style="height: 500px;overflow-y: auto;" -->
						<h3>
						错误记录	<!-- （用户信息未导入） -->
						</h3>
						<table class="table table-hover table-bordered big-data table-striped">
							<colgroup>
								<col style="">
								<col style="">
								<col style=""><!-- width: 225px -->
							</colgroup>
							<thead style="background-color:#EEEEEE;">
								<tr>
									<th>序号</th>
									<th>错误行数</th>
									<th>错误原因</th>
								</tr>
							</thead>
							<tbody id="userinfoTbody">
								<s:iterator value="errorList" id="l" status="st">
									<tr class="gradec">
										<td><s:property value="#st.count"/></td>
										<td><s:property value="errorList[#st.index]" /></td>
										<td><s:property value="%{errorReason[#st.index]}" /></td>
										
									</tr>
								</s:iterator>
								<tr>
									<s:if test="%{errorList.size == 0}">
										<td>暂无</td>
										<td>暂无</td>
										<td>暂无</td>
									</s:if>
								</tr>
							</tbody>
						</table>
						
						<h3>
						相似记录（建议校医复查）
						</h3>
						<table class="table table-hover table-bordered big-data table-striped">
							<colgroup>
								<col style="">
								<col style="">
								<col style="">
							</colgroup>
							<thead style="background-color:#EEEEEE;">
								<tr>
									<th>序号</th>
									<th>所在行数</th>
									<th>相似用户</th>
								</tr>
							</thead>
							<tbody id="userinfoTbody">
								<s:iterator value="similarList" id="l" status="st">
									<tr class="gradec">
										<td><s:property value="#st.count"/></td>
										<td><s:property value="similarList[#st.index]" /></td>
										<td><s:property value="%{similarReason[#st.index]}" /></td>
									</tr>
								</s:iterator>
								<tr>
									<s:if test="%{similarList.size == 0}">
										<td>暂无</td>
										<td>暂无</td>
										<td>暂无</td>
									</s:if>
								</tr>
							</tbody>
						</table>
						
						<div>
						</div>
					</div>
					<h3>
						本次共导入${actualrows }条数据
					</h3>
					</br>
					<h4>
					说明：
					</h4>
					<h5>
					1、请确保上传的数据格式与模板一致，切勿随意更改表头名称与顺序；
					</h5>
					<h5>
					2、错误原因为“年龄错误”的记录未被录入系统中。解决方法：修改用户的年龄后重新导入即可；
					</h5>
					<h5>
					3、错误原因为“视觉档案重复”的记录未被录入系统中。解决方法：检查用户的视觉档案是否重复；
					</h5>
					<h5>
					4、错误原因为“视力、视功能数值错误”的记录，用户信息被正确录入，但是用户的视觉档案由于视力值或视功能值错误而未被录入系统中。解决方法：修改用户的视力、视功能后重新导入即可；
					</h5>
					<h5>
					5、上传结果暂无的，表示数据已正常录入；
					</h5>
					<h5>
					6、出现在“相似记录”中的视觉档案，建议社工复查用户的档案以确保信息的正确录入；
					</h5>
					<h5>
					7、其他问题请咨询管理员。
					</h5>
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
