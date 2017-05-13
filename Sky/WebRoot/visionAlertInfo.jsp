<%@taglib prefix="s" uri="/struts-tags" %><!-- pageEncoding="GB2312" -->

<%@ page pageEncoding="utf-8"%>

<%@ page contentType="text/html;charset=utf-8"%>
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

<body onload="setup()">
	<div class="content sky-content" id="page-container">
		<div class="frame-records">
			<div class="records-new part4">
				<div class="title" id="community-manage" >预警人员信息查询
					<!--  -->
					<div>	
					 	<select type="select" id="visionalert" name="visionalert" class="form-control" 
					 			style="position:absolute;width:180px;right:70px;top:0px;color: #000;" onchange="visionchange()">	<!-- onchange="visionchange()" -->
							<option value='0'>请选择预警人群</option>
							<option value='1'>预警待复查通知人群</option>
							<option value='2'>预警超出期限人群</option>
							<option value='3'>全部预警人群</option>
						</select>
					</div>
					<a href="javascript:void(0)" id="search" style="background-color: #3CBE86;color: #fff;"	
							class="btn btn-sm title-search-btn"  value="搜索"	 >搜索</a>
					
				</div>
				

				<div class="context">
					<div class="table-responsive" style="height: 500px;overflow-y: auto;">
						<table class="table table-hover table-bordered big-data table-striped" id="table_export" name="table_export" >
							<colgroup>
								<col style="">
								<col style="">
								<col style="">
								<col style="">
								<col style="">
								<col style="">
								<col style="">
								<col style="width: 150px">
							</colgroup>
							<thead style="background-color:#EEEEEE;">
								<tr>
								
									<!-- <th>ID</th> -->
									<th>姓名</th>
									<th>出生日期</th>
									<th>视觉级别</th>
									<th>最近筛查时间</th>
									<th>复查天数</th>
									<th>联系电话</th>
									<th>学校</th>
									<!-- <th>视觉等级</th> -->
									<th style="text-align: center;" id="operate">操作</th>
								</tr>
							</thead>
							<tbody id="userinfoTbody">
								<s:iterator value="list" id="v">
									<tr class="gradec">
										
										<!-- <td><s:property value="#v[0]" />
										</td> -->
										<td><s:property value="#v[1]" />
										</td>
										<td><s:property value="#v[3]" />
										</td>
										<td><s:property value="#v[11]" />
										</td>
										<td><s:property value="#v[12]" />
										</td>
										<td><s:property value="timeComputing(#v[12],#v[11])" />
										</td>
										<td><s:property value="#v[13]" />
										</td>
										<td><s:property value="#v[4]" />
										</td>
										<td style="text-align: center;"><!--  id="operation" -->
											<!-- 
											<a class="btn-sm" href="modifyCommunityInfo.action?username=<s:property value='username'/>">修改</a>
											<span style="color: #E0E0E0">|</span>
											<a class="btn-sm" onclick="del(this)" >删除</a>
											<span style="color: #E0E0E0">|</span>
											 -->
											<a class="btn-sm" href="stuVisionInfo.action?username=<s:property value='#v[0]'/>">查看视觉档案</a>
										</td>
									</tr>
								</s:iterator>
							</tbody>
						

						</table>
						<div>
							<input type="button"  id="exportBtn" style=" left: 0px; top: 2px;width:120px;
								 background-color: #3CBE86;color: #fff;" onclick="downloadfile();" value="数据导出"/>
						</div>
					</div>
					<!-- 
					<div>
						<table id="pageTable">
							<tr>
								<td><s:if test="%{pageBean.currentPage == 1}">首页      上一页</s:if>
									<s:else>
										<a href="visionAlertInfo!visionAlertInfo?page=1">首页</a>
										<a
											href="visionAlertInfo!visionAlertInfo?page=<s:property value="%{pageBean.currentPage-1}"/>" />上一页</a>
									</s:else></td>
								<td><s:if
										test="%{pageBean.currentPage != pageBean.totalPage}">
										<a
											href="visionAlertInfo!visionAlertInfo?page=<s:property value="%{pageBean.currentPage+1}"/>">下一页</a>
										<a
											href="visionAlertInfo!visionAlertInfo?page=<s:property value="pageBean.totalPage"/>">尾页</a>
									</s:if> <s:else>下一页  尾页</s:else>
								</td>
								<td>页次 <s:property value="pageBean.currentPage" /> / <s:property
										value="pageBean.totalPage" /> 共 <s:property
										value="pageBean.allRow" /> 记录</td>
							</tr>
						</table>
					</div>
					 -->
					 <div id="recordnum">
						 共 <s:property value="list.size()" /> 条记录
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
	<script type="text/javascript">
		//创建XMLHttpRequest对象
		var xmlHttpReq;
		var actionname = "";
		function createXMLHttpRequest() {
			if (window.ActiveXObject) {
				xmlHttpReq = new ActiveXObject("MSXML2.XMLHTTP.3.0");
			} else {
				xmlHttpReq = new XMLHttpRequest();
			}
		}
		function visionchange(){
			var visionalert=document.getElementById("visionalert").value;
			//var search=document.getElementById("search").disabled;
			if(visionalert==''){
				document.getElementById("search").disabled=true;
				document.getElementById("search").href = "javascript:void(0)";
			}
			else{
				//document.getElementById("search").disabled=false;
				//document.getElementById("search").href = "success.jsp";
				document.getElementById("search").href = "theVisionAlertPeople.action?visionalert="+visionalert;
			}
		}
		function setup(){
			document.getElementById("search").disabled=true;
		}
	</script>
	<script type="text/javascript">   
       function downloadfile()    
      {
              var communitymanage = document.getElementById("community-manage");
              var exportBtn = document.getElementById("exportBtn");
              var recordnum = document.getElementById("recordnum");
              
              communitymanage.style.display="none";				//隐藏控件
              exportBtn.style.display="none";
              recordnum.style.display="none";
              
			  var tb=document.getElementById("table_export");    //获取表格对象 
			  for(var i = 0; i<tb.rows.length; i++){
			  	tb.rows[i].cells[tb.rows[0].cells.length-1].style.display="none";
              }
              

              window.document.execCommand("SelectAll");
	          window.document.execCommand("Copy");
	          
	          communitymanage.style.display="";			//恢复显示
	          
			  for(var i = 0; i<tb.rows.length; i++){
			  	//tb.rows[i].cells[0].style.display="none";
			  	tb.rows[i].cells[tb.rows[0].cells.length-1].style.display="";
              }
              
              exportBtn.style.display="";
              recordnum.style.display="";
			  alert("已成功复制表格！请粘贴至Excel中！");
      }    
    </script>
</body>
</html>
