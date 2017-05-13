<%@taglib prefix="s" uri="/struts-tags" %><!-- pageEncoding="GB2312" -->
<%@ page import="java.util.*,java.sql.*" %>
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

<body>
	<div class="content sky-content" id="page-container">
		<div class="frame-records">
			<div class="records-new part4">
				<div class="title" id="community-manage" >社区查询
					<!-- 用于实现下拉框查询学校 -->
					<form action="searchCommunityInfo" method="post" name="searchcommunity" id="searchcommunity">
					
						<div>	
					 		<select type="select" id="searchschool" name="searchschool" value="list2"
					 			 class="form-control" style="position:absolute;width:150px;right:380px;top:0px;color: #000;" >
								<option value=''>请选择授权学校</option>
								<s:iterator value="list2" status="st" id="l">
									<option value='<s:property value="#l" />'><s:property value="#l" /></option>
								</s:iterator>
							</select>
						</div>
						
						<input type="text"	class="input-sm search-query title-search-input" id="searchrealname" name="searchrealname"
							 placeholder="请输入姓名" style="position:absolute;right:220px;color: #000;">
						<input type="text"	class="input-sm search-query title-search-input" id="phone" name="phone"
							 placeholder="请输入电话号码" style="color: #000">
						
						<input type="hidden" name="school" id="school" value="">
						<input type="hidden" name="realname" id="realname" value="">
						
						<input type="submit" style="background-color: #3CBE86;color: #fff;"	class="btn btn-sm title-search-btn"
							 value="搜索"	onclick="search()" /> 
						
					</form>
					    <a href="createCommunityInfo.action" class="btn btn-sm"
					    	style="position:absolute;left:120px;top:2px;background-color: #3CBE86;color: #fff;"	>添加学生</a>
						<a href="download.action?fileName=muban.xlsx" class="btn btn-sm"
							style="position:absolute;left:200px;top:2px;background-color: #3CBE86;color: #fff;" >Excel文件模板</a>
					 
				</div>
				
        		<form action="importCommunityExcelFile.action" enctype="multipart/form-data" method="post" id="importForm">
                		<div style="position:relative;width:100%;height: 30px;margin-left: 10px;">
							<input id="fileSelect" name="uploadfile" type="file" style="border:1px solid; height: 30px;z-index:100;opacity: 0;position: absolute;top: 0;left: 0;width: 100px;" onchange="importFile()">
							<a id="importBtn" class="btn btn-default btn-sm" style="position: absolute; left: 0; top: 0; width: 100px;background-color: #3CBE86;color: #fff;">批量导入</a>
							<a id="importSubmitBtn" class="btn btn-primary btn-sm hidden" style="position: absolute; left: 110px; top: 0; width: 80px;" onclick="$('#importForm').submit();">确认提交</a>
							<input id="fileName" type="text" class="hidden" value="" style="width:auto;height:30px;border:0;position:absolute;left:200px;top:0;" readonly>
							<script type="text/javascript">
								function importFile() {
									$('#importSubmitBtn').removeClass('hidden');
									$('#fileName').removeClass('hidden');
									document.getElementById('importBtn').innerHTML = '重新选择';
									$('#fileName').val($('#fileSelect').val());  //显示选择的文件
									var textWidth = $('#fileName').parent().width()-200;
									$('#fileName').width(textWidth);
								}
							</script>
						</div>
						
        		</form>
        		<!-- 
						<div>
							<a id="exportBtn" style="position: absolute; left: 330px; top: 2px; background-color: #3CBE86;color: #fff;" class="btn btn-sm" onclick="exportExcel('table_export');">批量导出</a>
						</div>
				 -->


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
								<col style="">
								<col style="">
								<col style="">
								
								<col style="width: 225px">
							</colgroup>
							<thead style="background-color:#EEEEEE;">
								<tr>
								
									<th style="display:none">ID</th>
								
									<th>姓名</th>
									<th>性别</th>
									<th>年龄</th>
									<th>学校</th>
									<th>年级</th>
									<th>班级</th>
									<th>民族</th>
									<th>身高</th>
									<th>体重</th>
									<!-- 
									<th>社区</th>
									 -->
									
									<th>监护人</th>
									<!-- 
									<th>视觉等级</th>
									 -->
									<th style="text-align: center;" id="operate">操作</th>
								</tr>
							</thead>
							<tbody id="userinfoTbody">
								<s:iterator value="list" id="l">
									<tr class="gradec">
										
										<td style="display:none"><s:property value="username" />
										</td>
										<td><s:property value="realname" />
										</td>
										<td><s:property value="gender" />
										</td>
										<td><s:property value="age" />
										</td>
										<td><s:property value="school" />
										</td>
										<td><s:property value="grade" />
										</td>
										<td><s:property value="stuClass" />
										</td>
										<td><s:property value="nation" />
										</td>
										<td><s:property value="height" />
										</td>
										<td><s:property value="weight" />
										</td>
										
										<td><s:property value="guardianName" />
										</td>
										<!-- 
										<td><s:property value="visionlevel" />
										</td>
										 -->
										<td style="text-align: center;"><!--  id="operation" -->
											<a class="btn-sm" href="modifyCommunityInfo.action?username=<s:property value='username'/>">修改</a>
											<span style="color: #E0E0E0">|</span>
											<!--<a class="btn-sm" onclick="del(this)" href="communityInfo.action">删除</a>	  -->
											<a class="btn-sm" onclick="del(this)" >删除</a>
											<span style="color: #E0E0E0">|</span>
											<a class="btn-sm" href="stuVisionInfo.action?username=<s:property value='username'/>">查看视觉档案</a>
										</td>
									</tr>
								</s:iterator>
							</tbody>
						

						</table>
						<div>
							<input type="button"  id="exportBtn" style=" left: 0px; top: 2px; background-color: #3CBE86;color: #fff;" onclick="downloadfile();" value="数据导出"/>
						</div>
					</div>
					<div>
						<table id="pageTable">
							<tr>
								<!-- -->
								<td><s:if test="%{pageBean.currentPage == 1}">首页      上一页</s:if>
									<s:else>
										<a href="searchCommunityInfo!searchCommunityInfo?page=1">首页</a>
										<a
											href="searchCommunityInfo!searchCommunityInfo?page=<s:property value="%{pageBean.currentPage-1}"/>" />上一页</a>
									</s:else></td>
								<td><s:if
										test="%{pageBean.currentPage != pageBean.totalPage}">
										<a
											href="searchCommunityInfo!searchCommunityInfo?page=<s:property value="%{pageBean.currentPage+1}"/>">下一页</a>
										<a
											href="searchCommunityInfo!searchCommunityInfo?page=<s:property value="pageBean.totalPage"/>">尾页</a>
									</s:if> <s:else>下一页  尾页</s:else>
								</td>
								
								<td>
									<!--  -->
									页次 <s:property value="pageBean.currentPage" /> / <s:property
										value="pageBean.totalPage" />
									
										共 <s:property value="pageBean.allRow" /> 条记录</td>
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
		/**
		function search() {
			var search_school = document.getElementById("search_school").value;
			var search_realname = document.getElementById("search_realname").value;
			var search_phone = document.getElementById("search_phone").value;
			var url = "searchCommunityInfo.action?school=" + search_school + "&realname=" + search_realname+"&phone="+search_phone;
			createXMLHttpRequest();
			xmlHttpReq.open("POST", url, true);
			xmlHttpReq.send(null);
			actionname = "searchCommunityInfo!searchCommunityInfo?school=" + search_school + "&realname=" + search_realname+" &phone="+search_phone+" &page=";
			xmlHttpReq.onreadystatechange = getResult;
		}**/
		function search() {
			//alert("搜索!");
			var school = document.getElementById("searchschool").value;
			document.getElementById("school").value = encodeURI(school);
			var realname = document.getElementById("searchrealname").value;
			document.getElementById("realname").value = encodeURI(realname);
			var phone = document.getElementById("searchphone").value;
			alert(school);
			document.getElementById("search").href = "searchCommunityInfo.action?school="+school+"&realname="+realname+"&phone="+phone;
		}
		function schoolchange(){
			alert("改变!");
			var school = document.getElementById("searchschool").value;
			var realname = document.getElementById("searchrealname").value;
			var phone = document.getElementById("phone").value;
			alert("school:"+school+"realname:"+realname+"phone:"+phone);
			document.getElementById("search").href = "searchCommunityInfo.action?school="+school+"&realname="+realname+"&phone="+phone;
		}
		//弹出删除提示 obj："删除"对象（位于td内的对象）
		function del(obj) {
			var tr = obj.parentNode.parentNode;
			var tds = tr.cells;
			var str = tds[0].innerHTML;
			if (confirm("您确定删除？"))
				confimdel(obj, str);
			return false;
		}
		//处理删除操作
		//先删除数据库中数据，如果执行成功则删除页面上相应的行 
		function confimdel(obj, str) {
			//var tr = obj.parentElement.parentElement;//本行的tr对象
			//alert("tr为："+tr);
			
			var url = "delCommunityInfo.action?username=" + str;//处理删除操作
			//alert("删除操作中的URL为"+url);
			createXMLHttpRequest();
			xmlHttpReq.open("POST", url, true);
			xmlHttpReq.send(null);
			actionname = "communityInfo!communityInfo?page=";
			xmlHttpReq.onreadystatechange = getResult;
		}

		function modify(obj) {
			var tr = obj.parentNode.parentNode;
			var tds = tr.cells;
			var str = tds[0].innerHTML;
			var url = "modifyCommunityInfo.action?username=" + str;//处理删除操作
			createXMLHttpRequest();
			xmlHttpReq.open("GET", url, true);
			xmlHttpReq.send(null);
		}

		function getResult() {
			if (xmlHttpReq.readyState == 4) {
				//alert("已接收到完整信息！xmlHttpReq.responseText为"+xmlHttpReq.responseText);
				var userList = eval('(' + xmlHttpReq.responseText + ')');
				//alert("userList！userList.STURESULT为："+userList.STURESULT);
				var user = eval(userList.STURESULT);
				var pageObj = eval('(' + xmlHttpReq.responseText + ')');

				var Sturesult = "";
				//var Sturesult = "<tbody id='userinfoTbody'>";
				for ( var i = 0; i < user.length; i++) {
					Sturesult += "<tr>";
					Sturesult += "<td style='display:none'>" + user[i].username + "</td>";
					Sturesult += "<td>" + user[i].realname + "</td>";
					Sturesult += "<td>" + user[i].gender + "</td>";
					Sturesult += "<td>" + user[i].age + "</td>";
					Sturesult += "<td>" + user[i].school + "</td>";
					Sturesult += "<td>" + user[i].grade + "</td>";
					Sturesult += "<td>" + user[i].stuClass + "</td>";
					Sturesult += "<td>" + user[i].nation + "</td>";
					Sturesult += "<td>" + user[i].height + "</td>";
					Sturesult += "<td>" + user[i].weight + "</td>";
					Sturesult += "<td>" + user[i].guardianName + "</td>";
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
	</script>
	<script type="text/javascript">   
       function downloadfile()    
      {
              var communitymanage = document.getElementById("community-manage");
              var importForm = document.getElementById("importForm");
              var userID = document.getElementById("userID");
              var operate = document.getElementById("operate");
              var pageTable = document.getElementById("pageTable");
              var exportBtn = document.getElementById("exportBtn");
              
              communitymanage.style.display="none";				//隐藏控件
              importForm.style.display="none";
              //userID.style.display="";
              operate.style.display="none";
              exportBtn.style.display="none";
              pageTable.style.display="none";

			  var tb=document.getElementById("table_export");    //获取表格对象
			  //alert("tb.rows.length为："+tb.rows.length);
			  //alert("tb.rows.cells.length为："+tb.rows[0].cells.length);

			  for(var i = 0; i<tb.rows.length; i++){
			  	tb.rows[i].cells[0].style.display="";
			  	tb.rows[i].cells[tb.rows[0].cells.length-1].style.display="none";
              }

              window.document.execCommand("SelectAll");
	          window.document.execCommand("Copy");
	          
	          communitymanage.style.display="";			//恢复显示
	          importForm.style.display="";
	          //userID.style.display="display";
	          operate.style.display="";
			  for(var i = 0; i<tb.rows.length; i++){
			  	tb.rows[i].cells[0].style.display="none";
			  	tb.rows[i].cells[tb.rows[0].cells.length-1].style.display="";
              }
              exportBtn.style.display="";
              pageTable.style.display="";
			  alert("已成功复制表格！请粘贴至Excel中！");
      }    
    </script>
</body>
</html>
