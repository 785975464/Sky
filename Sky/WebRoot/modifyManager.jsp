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
				<div class="title">修改管理者</div>
				<input type="value" id="uname" value="${uname}" style="display:none;"/>
				<div class="context">
					<div class="table-responsive">
						<table class="table table-hover table-bordered big-data table-striped" id="users">
							<thead style="background-color:#EEEEEE;">
								<tr>
									<th></th>
									<th>校医账户</th>
									<th>姓名</th>
									<th>性别</th>
									<th>年龄</th>
									<th>地址</th>
									<th>学校</th>
									<th>联系电话</th>
								</tr>
							</thead>
							<tbody>
								<s:iterator value="list">
									<tr class="gradec">
										<th><input type="radio" name="doctor"
											value="<s:property value="username" />">
										</th>
										<td><s:property value="username" />
										</td>
										<td><s:property value="realname" />
										</td>
										<td><s:property value="gender" />
										</td>
										<td><s:property value="age" />
										</td>
										<td><s:property value="address" />
										</td>
										<td><s:property value="school" />
										</td>
										<td><s:property value="phone" />
										</td>

									</tr>
								</s:iterator>
							</tbody>
						</table>
					</div>
					<div class="text-center">
						<button class="btn btn-primary btn-sm" onclick="checkRadio()">保存</button>
						<a class="btn btn-default btn-sm" href="allInfo">取消</a>
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
<script type="text/javascript">
			function checkRadio() {
	            if ($('#users input:radio[name="doctor"]:checked').length == 0) {
	                alert('选择不能为空！');
	            }
	            else{
	            	var username = document.getElementById("uname").value;
	            	var manager = $('#users input:radio[name="doctor"]:checked').val();
            		$.ajax({
		                type:"POST",
		                url:"updateManager?username="+username+"&manager="+manager,
		                success:function(){
		                    alert('保存成功！');
		                    window.location.href="allInfo";
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
</script>
</html>
