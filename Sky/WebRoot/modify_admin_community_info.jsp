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
<link href="css/main.min.css" rel="stylesheet" type="text/css">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<link href="bootstrap/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript" src="jquery/jquery.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="bootstrap/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript"
	src="bootstrap/js/bootstrap-datetimepicker.zh-CN.js"></script>

</head>
<body>
	<div class="content sky-content" id="page-container">
		<div class="frame-records">
			<div class="records-new part4">
				<div class="title">社工信息修改——管理员界面</div>
				<div class="context" style="padding-left: 10px !important;">
					<form name="updateform" id="updateform" class="form-horizontal"
						action="updateAdminStuInfo" method="post">
						<fieldset>
							<div class="f2">
								<div class="form-group">
									<label for="IDCard" class="col-sm-3 control-label">学号</label>
									<div class="col-sm-6">
										<input type="text" class="form-control col-sm-6" id="username"
											name="username" value='${userinfo.username}'
											readonly="readonly" required="required">
									</div>
								</div>
								<div class="form-group">
									<label for="IDCard" class="col-sm-3 control-label"><span style="color: red;padding-right: 5px;vertical-align: middle;">*</span>姓名</label>
									<div class="col-sm-6">
										<input type="text" class="form-control col-sm-6" id="realname"
											name="realname" value='${userinfo.realname}'
											required="required">
									</div>
								</div>
								<div class="form-group">
									<label for="IDCard" class="col-sm-3 control-label">性别</label>
									<div class="col-sm-6">
										<input type="text" class="form-control col-sm-6" id="gender"
											name="gender" value='${userinfo.gender}'>
									</div>
								</div>
								<div class="form-group">
									<label for="IDCard" class="col-sm-3 control-label">年龄</label>
									<div class="col-sm-6">
										<input type="text" class="form-control col-sm-6" id="age"
											name="age" value='${userinfo.age}'>
									</div>
								</div>
								<div class="form-group">
									<label for="IDCard" class="col-sm-3 control-label">社区</label>
									<div class="col-sm-6">
										<input type="text" class="form-control col-sm-6" id="address"
											name="address" value='${userinfo.address}'>
									</div>
								</div>
								<div class="form-group">
									<label for="IDCard" class="col-sm-3 control-label">联系电话</label>
									<div class="col-sm-6">
										<input type="text" class="form-control col-sm-6" id="phone"
											name="phone" value='${userinfo.phone}'>
									</div>
								</div>
								<div class="form-group">
									<label for="IDCard" class="col-sm-3 control-label">E-mail</label>
									<div class="col-sm-6">
										<input type="email" class="form-control col-sm-6" id="email"
											name="email" value='${userinfo.email}'>
									</div>
								</div>
								<div class="form-group">
									<label for="IDCard" class="col-sm-3 control-label">监护人</label>
									<div class="col-sm-6">
										<input type="text" class="form-control col-sm-6"
											id="guardianName" name="guardianName"
											value='${userinfo.guardianName}'>
									</div>
								</div>
							</div>
							<div class="f2" style="padding-left:1%;">
								<div class="form-group">
									<label for="IDCard" class="col-sm-3 control-label">学校</label>	<!-- <span style="color: red;padding-right: 5px;vertical-align: middle;">*</span> -->
									<div class="col-sm-6">
										<input type="text" class="form-control col-sm-6" id="school"
											name="school" value='${userinfo.school}' > <!-- required="required" -->
									</div>
								</div>
								<div class="form-group">
									<label for="IDCard" class="col-sm-3 control-label">年级</label>
									<!--<div class="col-sm-6">
										 <input type="hidden" class="form-control col-sm-6" id="grade"
											name="grade" value='${userinfo.grade}'>
											 -->
									<div class="col-sm-3" ><!--  class="col-sm-3" align="center" -->
										<select type="select" id="grade" name="grade" class="form-control" value='${userinfo.grade}'> <!--  style="text-align:center;" -->
								         <option value='${userinfo.grade}'>${userinfo.grade}</option>
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
									<!-- </div> -->
								</div>
								<div class="form-group">
									<label for="IDCard" class="col-sm-3 control-label">班级</label>
									
									<div class="col-sm-3" >
										<select type="select" id="stuClass" name="stuClass" class="form-control" value='${userinfo.stuClass}'>
											<option value='${userinfo.stuClass}'>${userinfo.stuClass}</option>
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
									
								</div>
								<div class="form-group">
									<label for="IDCard" class="col-sm-3 control-label">身份证号</label>
									<div class="col-sm-6">
										<input type="text" class="form-control col-sm-6" id="idNumber"
											name="idNumber" value='${userinfo.idNumber}'>
									</div>
								</div>
								<div class="form-group">
									<label for="IDCard" class="col-sm-3 control-label">民族</label>
									<div class="col-sm-6">
										<input type="text" class="form-control col-sm-6" id="nation"
											name="nation" value='${userinfo.nation}'>
									</div>
								</div>

								<div class="form-group">
									<label for="IDCard" class="col-sm-3 control-label">身高</label>
									<div class="col-sm-6">
										<input type="text" class="form-control col-sm-6" id="height"
											name="height" value='${userinfo.height}'>
									</div>
								</div>
								<div class="form-group">
									<label for="IDCard" class="col-sm-3 control-label">体重</label>
									<div class="col-sm-6">
										<input type="text" class="form-control col-sm-6" id="weight"
											name="weight" value='${userinfo.weight}'>
									</div>
								</div>
							</div>

						</fieldset>
						<div class="modal-footer" style="padding-right: 22%;">
							<button type="button" class="btn btn-warning"
								onClick="history.back(-1)">取消</button>
							<button type="submit" class="btn btn-primary" id="submit">确定</button>
						</div>
					</form>
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