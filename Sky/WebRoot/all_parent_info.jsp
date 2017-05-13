<%@taglib prefix="s" uri="/struts-tags"%>
<%@ page pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=GBK"%>
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
				<div class="title">监护人管理 
					<a href="create_parent_info.jsp?name=${session.loginuser.username}" class="btn btn-sm"
					    	style="position:absolute;left:120px;top:2px;background-color: #3CBE86;color: #fff;"	>添加监护人</a>
					<input type="text"
						class="input-sm search-query title-search-input"
						id="searchusername" placeholder="请输入监护人用户名" required="required"
						style="color: #000"> <input type="button" style="background-color: #3CBE86;color: #fff;"
						class="btn btn-sm title-search-btn" value="搜索"
						onclick="search()" />
				</div>
				<div class="context">
					<div class="table-responsive">
						<table class="table table-hover table-bordered big-data table-striped" id="users">
							<thead style="background-color:#EEEEEE;">
								<tr>
									<th></th>
									<th>家长账户</th>
									<th>姓名</th>
									<th>性别</th>
									<th style="text-align: center;">操作</th>
								</tr>
							</thead>
							<tbody id="userinfoTbody">
								<s:iterator value="list">
									<tr class="gradec">
										<td><input type="radio" name="parent"
											value="<s:property value="username" />">
										</td>
										<td><s:property value="username" />
										</td>
										<td><s:property value="realname" />
										</td>
										<td><s:property value="gender" />
										</td>
										
										<td style="text-align: center;">
											<!-- 
											<a class="btn-sm" href="modifyParentInfo.action?username=<s:property value='username'/>">修改</a>
											<span style="color: #E0E0E0">|</span>
											 -->
											<a class="btn-sm" onclick="del(this)" >删除</a>
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
										<a href="allParent!allParent?page=1">首页</a>
										<a
											href="allParent!allParent?page=<s:property value="%{pageBean.currentPage-1}"/>" />上一页</a>
									</s:else></td>
								<td><s:if
										test="%{pageBean.currentPage != pageBean.totalPage}">
										<a
											href="allParent!allParent?page=<s:property value="%{pageBean.currentPage+1}"/>">下一页</a>
										<a
											href="allParent!allParent?page=<s:property value="pageBean.totalPage"/>">尾页</a>
									</s:if> <s:else>下一页  尾页</s:else>
								</td>
								<td>页次 <s:property value="pageBean.currentPage" /> / <s:property
										value="pageBean.totalPage" /> 共 <s:property
										value="pageBean.allRow" /> 记录</td>
							</tr>
						</table>
					</div>
					<div class="text-center">
						<button class="btn btn-primary btn-sm" onclick="checkRadio()">保存</button>
						<button class="btn btn-default btn-sm" onclick="reset()">重置</a>
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
		function search() {
			var searchusername = document.getElementById("searchusername").value;
			var url = "searchParentInfo.action?username=" + searchusername;//处理删除操作
			createXMLHttpRequest();
			xmlHttpReq.open("POST", url, true);
			xmlHttpReq.send(null);
			actionname = "searchParentInfo!searchParentInfo?username=" + searchusername + "&page=";
			xmlHttpReq.onreadystatechange = getResult;
		}
		
		
		//弹出删除提示 obj："删除"对象（位于td内的对象）
		function del(obj) {
			var tr = obj.parentNode.parentNode;
			var tds = tr.cells;
			var str = tds[1].innerHTML;
			if (confirm("您确定删除？"))
				confimdel(obj, str);
			return false;
		}
		//处理删除操作
		//先删除数据库中数据，如果执行成功则删除页面上相应的行 
		function confimdel(obj, str) {
			//alert("str为："+str);
			
			var url = "delParentInfo.action?username=" + str;//处理删除操作
			//alert("删除操作中的URL为"+url);
			createXMLHttpRequest();
			xmlHttpReq.open("POST", url, true);
			xmlHttpReq.send(null);
			actionname = "allParentInfo!allParentInfo?page=";
			xmlHttpReq.onreadystatechange = getResult;
		}
		

		function getResult() {
			if (xmlHttpReq.readyState == 4) {
				var userList = eval('(' + xmlHttpReq.responseText + ')');
				var user = eval(userList.STURESULT);
				var pageObj = eval('(' + xmlHttpReq.responseText + ')');

				var Sturesult = "";
				for ( var i = 0; i < user.length; i++) {
					Sturesult += "<tr>";
					Sturesult += "<td><input type='radio' name='parent' value='" + user[i].username + "' /></td>";
					Sturesult += "<td>" + user[i].username + "</td>";
					Sturesult += "<td>" + user[i].realname + "</td>";
					Sturesult += "<td>" + user[i].gender + "</td>";
					Sturesult += "<td style='text-align: center;'><a class='btn-sm' style='margin: 0px 4px;' onclick='del(this)'>删除</a></td>";
					Sturesult += "</tr>";
				}

				var Pageresult = "<tr>";
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
				Pageresult += "</tr>";
				document.getElementById('userinfoTbody').innerHTML = Sturesult;
				document.getElementById('pageTable').innerHTML = Pageresult;

			}
		}
	</script>
</body>
<script type="text/javascript">
			function checkRadio() {
	            if ($('#users input:radio[name="parent"]:checked').length == 0) {
	                alert('选择不能为空！');
	            }
	            else{
	            	var guardianName = $('#users input:radio[name="parent"]:checked').val();
            		$.ajax({
		                type:"POST",
		                url:"updateParent?guardianName="+guardianName,
		                success:function(){
		                    alert('保存成功！');
		                    return true;
		                },
		                error:function(){
		                    alert('保存失败！');
		                    return false;
		                }
		            });
	            }
	        }
	        
	        $(document).on('click', '#users tr', function()  
		    {
		        //使点击每一行，自动选中第一列的checkbox
		        $(this).find('input')[0].checked = true;
		    });
		    
		    function reset() {
				$('#users input:radio[name="parent"]').attr('checked',false);
			}
</script>
</html>
