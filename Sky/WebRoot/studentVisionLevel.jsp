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

<body>
	<div class="content sky-content" id="page-container">
		<div class="frame-records">
			<div class="records-new part4">
				<div class="title" id="community-manage" >学校视觉档案管理
					<div>	
					 	<select type="select" id="search_visionlevel" name="search_visionlevel" class="form-control" 
					 			style="position:absolute;width:150px;right:70px;top:0px;color: #000;" onchange="visionchange()">
							<option value=''>请选择视觉等级</option>
							<option value='0'>正常</option>
							<option value='1'>预警</option>
							<option value='2'>亚健康</option>
							<option value='3'>异常</option>
							<option value='4'>错误</option>
							<option value='5'>未知</option>
							<option value='6'>暂无视觉等级</option>
						</select>
					</div>
					 
					 
					 <!-- 
					<input type="text"	class="input-sm search-query title-search-input" id="search_realname" placeholder="请输入姓名" required="required" style="position:absolute;right:220px;color: #000;">
					<input type="text"	class="input-sm search-query title-search-input" id="search_phone" placeholder="请输入电话号码" required="required" style="color: #000">
					
					<input type="button" style="background-color: #3CBE86;color: #fff;"	class="btn btn-sm title-search-btn" value="搜索"	onclick="search()" /> 
					 -->
					<a href="communityVisionInfo.action?visionlevel=" id="search" style="background-color: #3CBE86;color: #fff;"	
							class="btn btn-sm title-search-btn"  value="搜索"	 >搜索</a>
				</div>
				

				<div class="context">
					<div class="table-responsive" style="height: 500px;overflow-y: auto;">
						<table class="table table-hover table-bordered big-data table-striped" id="table_export" name="table_export" >
							<colgroup>
								<col style="">
								<col style="">
								<col style="">
								<col style="width: 225px">
							</colgroup>
							<thead style="background-color:#EEEEEE;">
								<tr>
								
									<!-- <th style="display:none">ID</th> -->
									<th>用户名</th>
									<th>姓名</th>
									<th>视觉等级</th>
									<!-- <th>视觉等级</th> -->
									<th style="text-align: center;" id="operate">操作</th>
								</tr>
							</thead>
							<tbody id="userinfoTbody">
								<s:iterator value="list" id="v">
									<tr class="gradec">
										 
										<!-- <td style="display:none"><s:property value="" />
										</td> -->
										<td><s:property value="#v[0]" />
										</td>
										<td><s:property value="#v[1]" />
										</td>
										<td><s:property value="#v[11]" />
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
						  <form action="EyesightServlet.servlet" method="POST" id="visionTj">
  							<div>
  								<input type="hidden" value="${session.loginuser.getSchool()}" name="login_school" id="login_school"/>
        						<input type="submit" name="btn" id="btn" style="position:relative;top: 20px;width:120px;
        							background-color: #3CBE86;color: #fff;" value="查看视觉统计图" />
        					</div>
  						</form>
					</div>
					<div>
						<table id="pageTable">
							<tr>
								<td><s:if test="%{pageBean.currentPage == 1}">首页      上一页</s:if>
									<s:else>
										<a href="stuVisionLevel!stuVisionLevel?page=1">首页</a>
										<a
											href="stuVisionLevel!stuVisionLevel?page=<s:property value="%{pageBean.currentPage-1}"/>" />上一页</a>
									</s:else></td>
								<td><s:if
										test="%{pageBean.currentPage != pageBean.totalPage}">
										<a
											href="stuVisionLevel!stuVisionLevel?page=<s:property value="%{pageBean.currentPage+1}"/>">下一页</a>
										<a
											href="stuVisionLevel!stuVisionLevel?page=<s:property value="pageBean.totalPage"/>">尾页</a>
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
			var search_visionlevel=document.getElementById("search_visionlevel").value;
			if(search_visionlevel==''){
				alert("未选择！");
			}
			//alert("search_visionlevel"+search_visionlevel);
			//alert(document.getElementById("search").href);
			document.getElementById("search").href = "stuVisionLevel.action?visionlevel="+search_visionlevel;
			//alert(document.getElementById("search").href);
		}
		/**
		function getResult() {
			//alert("xmlHttpReq.readyState为："+xmlHttpReq.readyState);
			if (xmlHttpReq.readyState == 4) {
				alert("已接收到完整信息！xmlHttpReq.responseText为"+xmlHttpReq.responseText+xmlHttpReq.status);
				//alert( eval('(' + xmlHttpReq.responseText + ')') );
				var userList = eval('(' + xmlHttpReq.responseText + ')');
				alert("userList！userList.STURESULT为："+userList.STURESULT);
				var user = eval(userList.STURESULT);
				alert("user为："+user);
				var pageObj = eval('(' + xmlHttpReq.responseText + ')');
				alert("user.length为："+user.length);
				var Sturesult = "";
				//var Sturesult = "<tbody id='userinfoTbody'>";
				for ( var i = 0; i < user.length; i++) {
					
					Sturesult += "<tr>";
					Sturesult += "<td>#v[0]"  + "</td>";
					Sturesult += "<td>" + user[i].realname + "</td>";
					Sturesult += "<td>" + user[i].visionlevel + "</td>";

					Sturesult += "<td style='text-align: center;'>"
							+ "<a class='btn-sm' style='margin: 0px 4px 0px 0px;' href='modifyCommunityInfo.action?username="
							+ user[i].username + "'>修改</a>";
					Sturesult += "<span style='color: #E0E0E0'>|</span>";
					Sturesult += "<a class='btn-sm' style='margin: 0px 4px;' onclick='del(this)'>删除</a>";
					Sturesult += "<span style='color: #E0E0E0'>|</span>";
					Sturesult += "<a class='btn-sm' style='margin: 0px 0px 0px 4px;' href='stuVisionInfo.action?username="
							+ user[i].username + "'>视觉档案</a>" + "</td>";
					Sturesult += "</tr>";
				}
				//Sturesult += "</tbody>";

				var Pageresult = "<table id='pageTable'><tr>";
				if (pageObj.PAGEBEAN.currentPage == 1) {
					Pageresult += "<td>首页      上一页</td>";
				} else {

					Pageresult += "<td>" + "<a href='"+actionname+"1'>首页</a>";
					Pageresult += "<a href='" + actionname
							+ parseInt(pageObj.PAGEBEAN.currentPage - 1)
							+ "'/>" + "上一页</a>";
					Pageresult += "</td>";
				}
				if (pageObj.PAGEBEAN.currentPage != pageObj.PAGEBEAN.totalPage) {

					Pageresult += "<td>" + "<a href='" + actionname
							+ parseInt(pageObj.PAGEBEAN.currentPage + 1)
							+ "'/>" + "下一页</a>";
					Pageresult += "<a href='"+actionname+pageObj.PAGEBEAN.totalPage+"'/>"
							+ "尾页</a>";
					Pageresult += "</td>";
				} else {
					Pageresult += "<td>下一页  尾页</td>";
				}
				Pageresult += "<td>页次" + pageObj.PAGEBEAN.currentPage + "/"
						+ pageObj.PAGEBEAN.totalPage;
				Pageresult += "共" + pageObj.PAGEBEAN.allRow + "记录";
				Pageresult += "</td>";
				Pageresult += "</tr></tbody>";
				document.getElementById('userinfoTbody').innerHTML = Sturesult;
				document.getElementById('pageTable').innerHTML = Pageresult;

			}
		}
		**/
	</script>
	<script type="text/javascript">   
       function downloadfile()    
      {
              var communitymanage = document.getElementById("community-manage");
              //var importForm = document.getElementById("importForm");
              //var userID = document.getElementById("userID");
              //var operate = document.getElementById("operate");
              var pageTable = document.getElementById("pageTable");
              var exportBtn = document.getElementById("exportBtn");
              var visionTj = document.getElementById("visionTj");
              
              communitymanage.style.display="none";				//隐藏控件
              exportBtn.style.display="none";
              pageTable.style.display="none";
              visionTj.style.display="none";

			  var tb=document.getElementById("table_export");    //获取表格对象
			  //alert("tb.rows.length为："+tb.rows.length);
			  //alert("tb.rows.cells.length为："+tb.rows[0].cells.length);
			  
			  for(var i = 0; i<tb.rows.length; i++){
			  	//tb.rows[i].cells[0].style.display="";
			  	tb.rows[i].cells[tb.rows[0].cells.length-1].style.display="none";
              }
              

              window.document.execCommand("SelectAll");
	          window.document.execCommand("Copy");
	          
	          communitymanage.style.display="";			//恢复显示
	          //importForm.style.display="";
	          //userID.style.display="display";
	          //operate.style.display="";
			  
			  for(var i = 0; i<tb.rows.length; i++){
			  	//tb.rows[i].cells[0].style.display="none";
			  	tb.rows[i].cells[tb.rows[0].cells.length-1].style.display="";
              }
              
              exportBtn.style.display="";
              pageTable.style.display="";
              visionTj.style.display="";
			  alert("已成功复制表格！请粘贴至Excel中！");
      }    
    </script>
</body>
</html>
