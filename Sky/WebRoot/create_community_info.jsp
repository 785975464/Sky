<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*"%> 
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
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>	<!-- 时间控件 2015-12-31 -->
<!-- <script type="text/javascript" src="js/geo.js"></script> -->

</head>
<body>	<!-- onload="setup();promptinfo();setdisabled();" -->
	<div class="content sky-content" id="page-container">
		<div class="frame-records">
			<div class="records-new part4">
				<div class="title">添加信息<span style="font-size: 12px;color:#f00;">&nbsp;&nbsp;带*为必填项</span></div>
				<div class="context" style="padding-left: 10px !important;">
							<form name="addform" id="addform" class="form-horizontal"
								action="addCommunityInfo" method="post" onsubmit="return checkform()">	<!-- onsubmit="return checkform()" -->
								<fieldset>
								<div class="f2">
									<div class="form-group">
										<label for="IDCard" class="col-sm-3 control-label">ID</label>
										<div class="col-sm-6">
											<input type="text" class="form-control col-sm-6" id="username"
												name="username" placeholder="ID" value="<%=UUID.randomUUID().toString()%>" required
												onblur="checkusername()" readonly="readonly" />
											<span style="font-size:20px; color:#f00;position: absolute;top:5px;">&nbsp;&nbsp;*</span>
										</div>
										
										<span style="color:#f00;position: absolute;top: 10px;left: 40%" id="checkusernameinfo"></span>
									</div>
									<div class="form-group">
										<label for="IDCard" class="col-sm-3 control-label">姓名</label>
										<div class="col-sm-6">
											<input type="text" class="form-control col-sm-6" id="realname"
												name="realname" placeholder="姓名" value='' required>
											<span style="font-size:20px; color:#f00;position: absolute;top:5px;">&nbsp;&nbsp;*</span>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label">性别</label>
										<div class="col-sm-6">
											<select class="form-control" name="gender" id="gender">
												<option value="男">男</option>
												<option value="女">女</option>
											</select>
											<span style="font-size:20px; color:#f00;position: absolute;top:5px;right:-6px;">*</span>
										</div>
										
									</div>
									<div class="form-group"><!-- 修改年龄录入方式，以控件的形式录入  2015-12-31 -->
										<label for="IDCard" class="col-sm-3 control-label">出生日期</label>
										
										<div class="col-sm-6">
											<!-- 
											<input type="text" class="form-control col-sm-6"  value='' required>
											 -->
											<input type="text" class="form-control col-sm-6" id="age"
												name="age" placeholder="请选择出生日期" onClick="WdatePicker()" required>
											<span style="font-size:20px; color:#f00;position: absolute;top:5px;">&nbsp;&nbsp;*</span>
										</div>
										
									</div>
									<div class="form-group">
										<label for="IDCard" class="col-sm-3 control-label">学校</label>
										<div class="col-sm-6">
											<span style="overflow:hidden;">
											<select type="select" id="schoolselection" name="schoolselection" class="form-control" 
												onchange="changeSchool()" value="">
												<!-- <option value='${userinfo.school}'>${userinfo.school}</option> -->
												<s:iterator value="list2" status="st">
													<option value='<s:property value="schoolname" />'><s:property value="schoolname" /></option>
												</s:iterator>
											</select>
											</span><input id="school" name="school" style="width:82%;height:33px;position:absolute;left:15px;top:0px;" placeholder="  请输入或选择学校" value=''> 
											<!-- 查询数据库得到学校集合，显示在下拉框中，并将更改的选项显示在文本框中  2015-12-20-->
										
										</div>
									</div>
									
									<div class="form-group">
										<label for="IDCard" class="col-sm-3 control-label">年级</label>
										<div class="col-sm-6">

											<div>								
												<select type="select" id="grade" name="grade" class="form-control col-sm-6" >
										         <option value=""  selected="selected">请选择年级</option>
										         <option value='小班'>小班</option>
										         <option value='中班'>中班</option>
										         <option value='大班'>大班</option>
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
												
												
												
												
											<!-- <span style="font-size:20px; color:#f00;position: absolute;top:5px;">&nbsp;&nbsp;*</span> -->
										</div>
									</div>
									<div class="form-group">
										<label for="IDCard" class="col-sm-3 control-label">班级</label>
										<div class="col-sm-6">
											<div>
												<select type="select" id="stuClass" name="stuClass" class="form-control col-sm-6">
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
												 
												 
												 
												 
											<!-- <span style="font-size:20px; color:#f00;position: absolute;top:5px;">&nbsp;&nbsp;*</span> -->
										</div>
									</div>
									</div>
									<div class="f2" style="padding-left:1%;">
									<div class="form-group">
										<label for="IDCard" class="col-sm-3 control-label">身份证号</label>
										<div class="col-sm-6">
											<input type="text" class="form-control col-sm-6"
												id="idNumber" name="idNumber" placeholder="身份证号" value=''>
											<!-- <span style="font-size:20px; color:#f00;position: absolute;top:5px;">&nbsp;&nbsp;*</span> -->
										</div>
									</div>
									<div class="form-group">
										<label for="IDCard" class="col-sm-3 control-label">联系电话</label>
										<div class="col-sm-6">
											<input type="text" class="form-control col-sm-6" id="phone"
												name="phone" placeholder="联系电话" value=''>
										</div>
									</div>
									<div class="form-group">
										<label for="IDCard" class="col-sm-3 control-label">E-mail</label>
										<div class="col-sm-6">
											<input type="email" class="form-control col-sm-6" id="email"
												name="email" placeholder="E-mail" value=''>
										</div>
									</div>
									<div class="form-group">
										<label for="IDCard" class="col-sm-3 control-label">监护人</label>
										<div class="col-sm-6">
											<input type="text" class="form-control col-sm-6"
												id="guardianName" name="guardianName" placeholder="监护人" value=''>
										</div>
									</div>
									
									<div class="form-group">
										<label for="IDCard" class="col-sm-3 control-label">民族</label>
										<div class="col-sm-6">
											<input type="text" class="form-control col-sm-6"
												id="nation" name="nation" placeholder="民族" value=''>
										</div>
									</div>
									<div class="form-group">
										<label for="IDCard" class="col-sm-3 control-label">身高</label>
										<div class="col-sm-6">
											<input type="text" class="form-control col-sm-6"
												id="height" name="height" placeholder="身高" value=''>
										</div>
									</div>
									<div class="form-group">
										<label for="IDCard" class="col-sm-3 control-label">体重</label>
										<div class="col-sm-6">
											<input type="text" class="form-control col-sm-6"
												id="weight" name="weight" placeholder="体重" value=''>
										</div>
									</div>
									</div>
								</fieldset>
								<div class="modal-footer" style="padding-right: 13%;">
									<a href="communityInfo.action" class="btn btn-warning">返回</a>
									<button type="submit" class="btn btn-primary" id="submit">增加</button>
								</div>
							</form>
						<!-- </div>
					</div> -->
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
		var xmlHttpReq;
		function createXMLHttpRequest() {
			if (window.XMLHttpRequest) {
				xmlHttpReq = new XMLHttpRequest();
			} else if (window.ActiveXObject) {
				try {
					xmlHttpReq = new ActiveXObject("MSXML2.XMLHTTP");
				} catch (e) {
					xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
				}
			}
		}
		function checkusername() {
			var username = document.getElementById("username").value;
			var url = "checkStuInfo.action?username=" + username;
			createXMLHttpRequest();
			xmlHttpReq.open("POST", url, true);
			xmlHttpReq.onreadystatechange = getResult;
			xmlHttpReq.send(null);
		}
		/**
		function birthdate(){
			var year = document.getElementById("year").value;
			var month = document.getElementById("month").value;
			var age = document.getElementById("age").value;
			document.getElementById("age").value = year + month;
			//document.getElementById("age").value = year +"-"+ month;
			//alert(document.getElementById("age").value = year +"-"+ month);
		}
		**/
		function checkform()
		{
			/**
			if(document.getElementById("s1").value=="省份" || document.getElementById("s2").value=="地级市"  
				|| document.getElementById("s3").value=="县级市、县" || document.getElementById("s4").value=='' || document.getElementById("s5").value=='')
			{
				alert("请填写通信地址！");
				return false;
			}
			if(document.getElementById("grade").value=="" )
			{
				alert("请选择年级！");
				return false;
			}
			else if(document.getElementById("stuClass").value=="")
			{
				alert("请选择班级！");
				return false;
			}
			**/
			
			//var year = document.getElementById("year").value;
			//var month = document.getElementById("month").value;
			var date = new Date();
			//alert(date);
			var nowyear = date.getFullYear();		//获取完整的年份(4位,1970-????)
			var nowmonth = date.getMonth()+1; 		//获取当前月份(0-11,0代表1月)
			var nowday = date.getDate();			//获取当前日(1-31)
			var nowtime = nowyear*10000 + nowmonth*100 + nowday;	//转换为20160104格式
			//var nowtime = nowyear.toString() + nowmonth.toString() + nowday.toString();
			//alert("当前日期nowtime为："+nowtime);
			//alert("当前日期为："+nowyear+nowmonth+nowday);
			
			var age = document.getElementById("age").value;
			var agetime = age.replace('-','').replace('-','');
			//alert("agetime为："+agetime);
			//alert(parseInt(nowtime)-parseInt(agetime));
			/**
			if( age == "")
			{
				alert("请选择出生日期！");
				return false;
			}
			else if( year > nowyear || ( year =nowyear && month-1 > nowmonth ))
			{
				alert("出生日期输入错误！"+year+"年"+month+"月");
				return false;
			}
			**/
			//alert( parseInt(nowtime) );
			//alert( parseInt(agetime) );
			if( parseInt(nowtime) - parseInt(agetime) <0 ){
			//if( parseInt(nowtime) - parseInt(agetime) <0 ){
				alert("出生日期输入错误！");
				return false;
			}
			else{
				//alert(document.getElementById("s1").value+document.getElementById("s2").value+document.getElementById("s3").value+document.getElementById("s4").value);
				alert("成功添加信息！");
				return true;
			}
			
		}

		function getResult() {
			if (xmlHttpReq.readyState == 4) {
				var res = eval('(' + xmlHttpReq.responseText + ')');
				var msg = res.MSG;
				var checkusernameinfo = document.getElementById("checkusernameinfo");
				if (msg) {
					checkusernameinfo.innerText = msg;
					document.getElementById("submit").disabled = true;
				} else {
					checkusernameinfo.innerText = msg;
					document.getElementById("submit").disabled = false;
				}
			}
		}
	</script>
<script type="text/javascript">
//学校改变时调用此函数
function changeSchool()
{
	document.getElementById('school').value=document.getElementById('schoolselection').options[document.getElementById('schoolselection').selectedIndex].value;
}
//手动录入时调用此函数（省市县不变）
function changeText()
{
	var s4 = document.getElementById('s4').value;
	var s5 = document.getElementById('s5').value;
	var address = document.getElementById('address').value;
 	var strs = new Array(); //定义一数组 
	strs = address.split(",");
    var address = document.getElementById('address');
    //var s1 = document.getElementById('s1');
    //var s2 = document.getElementById('s2');
    //var s3 = document.getElementById('s3');
    var s4 = document.getElementById('s4');
    var s5 = document.getElementById('s5');
    address.value = strs[0] +"," + strs[1] +","+ strs[2] +","+ s4.value +","+ s5.value;
}

</script>
</body>

</html>