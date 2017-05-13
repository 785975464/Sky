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

<body>
	<div class="content sky-content" id="page-container">
		<div class="frame-records">
			<div class="records-new part4">
				<div class="title" id="school-manage">学生管理 
					<form action="searchStuInfo" method="post" name="searchstudent" id="searchstudent">
						<div>
							<select type="select" id="search_gradename" name="search_gradename" class="form-control" 
								style="position:absolute;width:120px;right:525px;top:0px;color: #000;"> <!--  style="text-align:center;" -->
         						<option value=""  selected="selected">请选择年级</option>
     						    <option value='一年级'>一年级</option>
       							<option value='二年级'>二年级</option>
       							<option value='三年级'>三年级</option>
       							<option value='四年级'>四年级</option>
       						  	<option value='五年级'>五年级</option>
      						   	<option value='六年级'>六年级</option>
       						  	<option value='初中一年级'>初中一年级</option>
       						  	<option value='初中二年级'>初中二年级</option>
       						  	<option value='初中三年级'>初中三年级</option>
       						  	<option value='高中一年级'>高中一年级</option>
        						<option value='高中二年级'>高中二年级</option>
        						<option value='高中三年级'>高中三年级</option>
							</select>
						</div>

					 
						<div>
							<select type="select" id="search_classname" name="search_classname" class="form-control" 
								style="position:absolute;width:120px;right:400px;top:0px;color: #000;">
								<option value=""  selected="selected">请选择班级</option>
								<option value='1班'>1班</option>
	         					<option value='2班'>2班</option>
	         					<option value='3班'>3班</option>
	         					<option value='4班'>4班</option>
	         					<option value='5班'>5班</option>
	         					<option value='6班'>6班</option>
	         					<option value='7班'>7班</option>
	         					<option value='8班'>8班</option>
	         					<option value='9班'>9班</option>
	         					<option value='10班'>10班</option>
	         					<option value='11班'>11班</option>
	         					<option value='12班'>12班</option>
	         					<option value='13班'>13班</option>
	         					<option value='14班'>14班</option>
	         					<option value='15班'>15班</option>
	         				</select>
						</div>
						 
						<input type="hidden" name="grade" id="grade" value="">
						<input type="hidden" name="stuClass" id="stuClass" value="">
						<input type="hidden" name="realname" id="realname" value="">
						 
						 
						<input type="text"	class="input-sm search-query title-search-input" id="searchrealname" name="searchrealname"
							 placeholder="请输入姓名" style="position:absolute;right:230px;color: #000;">
						<input type="text"	class="input-sm search-query title-search-input" id="username" name="username"
							 placeholder="请输入ID"  style="color: #000"> 		<!-- 学号搜索 -->
						
						<input type="submit" style="background-color: #3CBE86;color: #fff;"	
							class="btn btn-sm title-search-btn" value="搜索"	onclick="search()" />	 					  
					</form>
				    <a href="create_stu_info.jsp" style="position:absolute;left:120px;top:2px;background-color: #3CBE86;color: #fff;"
						class="btn btn-sm">添加学生</a>
					<a href="download.action?fileName=muban.xlsx" style="position:absolute;left:200px;top:2px;background-color: #3CBE86;color: #fff;"
						class="btn btn-sm">Excel文件模板</a>
				
				</div>
				<!-- <form action="importExcelFile.action" enctype="multipart/form-data" method="post">
            			<input type="file" id="exampleInputFile" name="uploadfile" style="font-size:12px;width:160px; height:30px; position:absolute;right:370px;top:2px;color: #fff;background-color: #3CBE86;"/>
                		<input class="btn btn-sm" type="submit" value="批量导入" style="position:absolute;right:295px;top:2px;background-color: #3CBE86;color: #fff;"/>
        		</form>
        		 -->
        		<form action="importExcelFile.action" enctype="multipart/form-data" method="post" id="importForm">
                		<div style="position:relative;width:100%;height: 30px;margin-left: 10px;">
							<input id="fileSelect" name="uploadfile" type="file" style="border:1px solid; height: 30px;z-index:100;opacity: 0;position: absolute;top: 0;left: 0;width: 100px;" onchange="importFile()">
							<a id="importBtn" class="btn btn-default btn-sm" style="position: absolute; left: 0; top: 0; width: 100px;background-color: #3CBE86;color: #fff;">批量导入</a>
							<a id="importSubmitBtn" class="btn btn-primary btn-sm hidden" style="position: absolute; left: 110px; top: 0; width: 80px;"
								 onclick="a();$('#importForm').submit();" data-toggle="modal"  data-target="#myModal">确认提交</a>
								 <!-- 这两个属性data-toggle="modal"  data-target="#myModal"用来创建模态框 -->
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
							<a class="btn-sm" href="downloadFile.action?loadsql=<s:property value='loadsql'/>&loadvalues=<s:property value='loadvalues'/>" 
								style="position:absolute;right:20px;top:2px;background-color: #3CBE86;color: #fff;" id="download">点击此处可将查询结果下载至本地</a>
						</div>
        		</form>

				<!-- 按钮触发模态框 -->
        		<!-- 
        		<h2>创建模态框（Modal）</h2>
				<button class="btn btn-primary btn-lg" data-toggle="modal" 
				   data-target="#myModal" onclick="a();">
				   开始演示模态框
				</button>
				 -->
				 
				<!-- 模态框（Modal） -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
				   aria-labelledby="myModalLabel" aria-hidden="true" >
				   <div class="modal-dialog">
				      <div class="modal-content">
				         <div class="modal-header">
				            <button type="button" class="close" 
				               data-dismiss="modal" aria-hidden="true">
				                  &times;
				            </button>
				            <h4 class="modal-title" id="myModalLabel">
				              	 上传进度
				            </h4>
				         </div>
				         <div class="modal-body">
				      		正在上传中，请勿关闭页面！
				      		<div class="progress progress-striped active" >	<!-- style="width: 60%;" margin-left:20%; -->
							   <div class="progress-bar progress-bar-info" role="progressbar" id="myProBar"
							      aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" 	
							      style="width: 0%;">
							      <span class="sr-only">30% 完成（信息）</span>	<!-- 30% 完成（信息） -->
							   </div>
							</div>
							<div>
								<h3>
								当前进度：
								</h3>
								<!-- 
								<button type="button" class="btn btn-info" onclick="setPro();">信息按钮</button>
								 -->
								<span style="color:#f00; text-align:center;display:block;font-size:20px;" id="check"></span>
							</div>
				         </div>
				         <div class="modal-footer">
				            <button type="button" class="btn btn-default" 
				               data-dismiss="modal" onclick="stopSchoolImport.action">停止		<!-- stopImport.action -->
				            </button>
				            <!-- 
				            <button type="button" class="btn btn-primary">
				             	  提交更改
				            </button>
				             -->
				         </div>
				      </div><!-- /.modal-content -->
					</div><!-- /.modal -->
				</div>


				<div class="context">
					<div class="table-responsive" style="height: 500px;overflow-y: auto;">
						<table class="table table-hover table-bordered big-data table-striped" id="table_export" name="table_export" >
							<colgroup>
								<!-- <col style=""> -->
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
								<col style=""><!-- width: 225px -->
							</colgroup>
							<thead style="background-color:#EEEEEE;">
								<tr>
									<th style="display:none">ID</th>
									<th>姓名</th>
									<th>性别</th>
									<th>年龄</th>
									<th>年级</th>
									<th>班级</th>
									<th>民族</th>
									<th>身高</th>
									<th>体重</th>
									<th>社区</th>
									<th>监护人</th>
									<th style="text-align: center;" id="operate">操作</th>
								</tr>
							</thead>
							<tbody id="userinfoTbody">
								<s:iterator value="list">
									<tr class="gradec">
										<td style="display:none"><s:property value="username" />
										</td>
										<td><s:property value="realname" />
										</td>
										<td><s:property value="gender" />
										</td>
										<td><s:property value="age" />
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
										<td><s:property value="address" />
										</td>
										<td><s:property value="guardianName" />
										</td>
										<td style="text-align: center;">
											<a class="btn-sm" href="modifyStuInfo.action?username=<s:property value='username'/>">修改</a>
											<span style="color: #E0E0E0">|</span>
											<!-- <a class="btn-sm" onclick="del(this)" href="allStuInfo.action">删除</a -->
											<!-- <a class="btn-sm" onclick="del(this)" href="delStuInfo.action">删除</a> -->
											<!-- <a class="btn-sm" onclick="delStuInfo.action">删除</a> -->
											<a class="btn-sm" onclick="del(this)">删除</a>
											<span style="color: #E0E0E0">|</span>
											<a class="btn-sm" href="stuVisionInfo.action?username=<s:property value='username'/>">查看视觉档案</a>
										</td>
									</tr>
								</s:iterator>
							</tbody>

						</table>
						<div>
							<!-- 
							<input type="button"  id="exportBtn" style=" left: 0px; top: 2px; background-color: #3CBE86;color: #fff;" onclick="downloadfile();" value="数据导出"/>
							 -->
						</div>
					</div>
					<div>
						<table id="pageTable">
							<tr>
								<td><s:if test="%{pageBean.currentPage == 1}">首页      上一页</s:if>
									<s:else>
										<a href="allStuInfo!allStuInfo?page=1">首页</a>
										<a
											href="allStuInfo!allStuInfo?page=<s:property value="%{pageBean.currentPage-1}"/>" />上一页</a>
									</s:else></td>
								<td><s:if
										test="%{pageBean.currentPage != pageBean.totalPage}">
										<a
											href="allStuInfo!allStuInfo?page=<s:property value="%{pageBean.currentPage+1}"/>">下一页</a>
										<a
											href="allStuInfo!allStuInfo?page=<s:property value="pageBean.totalPage"/>">尾页</a>
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
		
		var timerId;
		//var index=0;
		function a(){
			//每隔0.5秒自动调用方法，实现进度条的实时更新
			//timerId=window.setInterval(getForm,500);
			timerId=window.setInterval(checkprocess,500);
		}
		
		function checkprocess() {
			//alert("checkprocess");
			//var username = document.getElementById("username").value;
			var url = "checkSchoolProcess.action";
			createXMLHttpRequest();
			xmlHttpReq.open("POST", url, true);
			xmlHttpReq.onreadystatechange = getRowsPercentage;
			xmlHttpReq.send(null);
		}
		
		function getRowsPercentage() {
			//alert(xmlHttpReq.readyState);
			if (xmlHttpReq.readyState == 4) {
				//alert("已接收到完整信息！xmlHttpReq.responseText为"+xmlHttpReq.responseText);
				var rows = eval('(' + xmlHttpReq.responseText + ')');
				var currentrows = rows.CURRENTROWS-3;
				var totalrows = rows.TOTALROWS-4;
				if(totalrows<=0){
					document.getElementById("check").innerText = "0%";
					document.getElementById("myProBar").style.width="0%";
					//alert(currentrows*100/totalrows);		//后台返回删除成功消息
				}
				else{
					document.getElementById("check").innerText = Math.round(currentrows*100/totalrows)+"%";
					document.getElementById("myProBar").style.width=currentrows*100/totalrows+"%";
				}
				if(currentrows*100/totalrows>=100){
					window.clearInterval(timerId);
					document.getElementById("check").innerText = "已完成！";
				}
			}
		}
		
		function search(){
			//alert("搜索!");
			var grade = document.getElementById("search_gradename").value;
			document.getElementById("grade").value = encodeURI(grade);
			var stuClass = document.getElementById("search_classname").value;
			document.getElementById("stuClass").value = encodeURI(stuClass);
			var realname = document.getElementById("searchrealname").value;
			document.getElementById("realname").value = encodeURI(realname);
		}
		/*
		function search2() {
			var search_gradename = document.getElementById("search_gradename").value;
			var search_classname = document.getElementById("search_classname").value;
			var search_realname = document.getElementById("search_realname").value;
			var search_username = document.getElementById("search_username").value;
			//var url = "searchStuInfo.action?grade="+search_gradename+"&stuClass="+search_classname+"&realname=" + search_realname+"&username="+search_username;
			
			document.getElementById("search").href = "searchStuInfo.action?grade="+search_gradename+"&stuClass="
					+search_classname+"&realname=" + search_realname+"&username="+search_username;
			
			//createXMLHttpRequest();
			//xmlHttpReq.open("POST", url, true);
			//xmlHttpReq.send(null);
			//actionname = "searchStuInfo!searchStuInfo?username=" + search_username + "&page=";
			//actionname = "searchStuInfo!searchStuInfo?stuClass=" + search_classname + "&page=";
			//actionname = "searchStuInfo.action?grade="+search_grade+" &stuClass="+search_classname+" &realname=" + search_realname+" &username="+search_username+"&page=";
			//actionname = "searchStuInfo!searchStuInfo?grade=" + search_gradename +"&stuClass="+search_classname+ "&page=";
			//alert(actionname);
			//xmlHttpReq.onreadystatechange = getResult;
		}
		*/
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
			//	var tr = obj.parentElement.parentElement;//本行的tr对象
			var url = "delStuInfo.action?username=" + str;//处理删除操作
			//alert("删除操作中的URL为"+url);
			createXMLHttpRequest();
			xmlHttpReq.open("POST", url, true);
			xmlHttpReq.send(null);
			actionname = "allStuInfo!allStuInfo?page=";
			xmlHttpReq.onreadystatechange = getResult;
		}

		function modify(obj) {
			var tr = obj.parentNode.parentNode;
			var tds = tr.cells;
			var str = tds[0].innerHTML;
			var url = "modifyStuInfo.action?username=" + str;//处理删除操作
			createXMLHttpRequest();
			xmlHttpReq.open("GRT", url, true);
			xmlHttpReq.send(null);
		}

		function getResult() {
			if (xmlHttpReq.readyState == 4) {
				var userList = eval('(' + xmlHttpReq.responseText + ')');
				var user = eval(userList.STURESULT);
				var pageObj = eval('(' + xmlHttpReq.responseText + ')');
				var del = eval('(' + xmlHttpReq.responseText + ')');
				alert(del.DELRESULT);		//后台返回删除成功消息
				
				var Sturesult = "";
				//var Sturesult = "<tbody id='userinfoTbody'>";
				for ( var i = 0; i < user.length; i++) {
					Sturesult += "<tr>";
					Sturesult += "<td style='display:none'>" + user[i].username + "</td>";
					Sturesult += "<td>" + user[i].realname + "</td>";
					Sturesult += "<td>" + user[i].gender + "</td>";
					Sturesult += "<td>" + user[i].age + "</td>";
					Sturesult += "<td>" + user[i].grade + "</td>";
					Sturesult += "<td>" + user[i].stuClass + "</td>";
					Sturesult += "<td>" + user[i].nation + "</td>";
					Sturesult += "<td>" + user[i].height + "</td>";
					Sturesult += "<td>" + user[i].weight + "</td>";
					Sturesult += "<td>" + user[i].address + "</td>";
					Sturesult += "<td>" + user[i].guardianName + "</td>";
					Sturesult += "<td style='text-align: center;'>"
							+ "<a class='btn-sm' style='margin: 0px 4px 0px 0px;' href='modifyStuInfo.action?username="
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
       function downloadfile2()    
      {
              var schoolmanage = document.getElementById("school-manage");
              var importForm = document.getElementById("importForm");
              var operate = document.getElementById("operate");
              var pageTable = document.getElementById("pageTable");
              var exportBtn = document.getElementById("exportBtn");
              
              schoolmanage.style.display="none";				//隐藏控件
              importForm.style.display="none";
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
	          
	          schoolmanage.style.display="";			//恢复显示
	          importForm.style.display="";
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
