<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
<style type="text/css">
label {
	font-weight: normal;
}

table {
	width: 100%;
}

table td {
	padding: 5px;
}
</style>
</head>
<body>
	<%
		Calendar cal=Calendar.getInstance();
		int year=cal.get(Calendar.YEAR);
		int mon=cal.get(Calendar.MONTH)+1;
		int day=cal.get(Calendar.DAY_OF_MONTH);
		String time=year+"-"+mon+"-"+day;
		//getElementById(a).value=s;
		//System.out.println("当前时间为："+s);	
 	%>
	<div class="content sky-content" id="page-container">
		<div class="frame-records">
			<div class="records-new part4">
				<form class="form-horizontal" action="addVisionInfo" method="post" 
				 	onsubmit="return checkform()">	<!-- onsubmit="return check()" -->
					<fieldset>
						<div class="title">录入视觉档案信息</div>
						<div class="tabbable" id="tabs-534095">
							<ul class="nav nav-tabs" role="tablist" id="docs-tab">
								<li role="presentation" class="active"><a href="#detail"
									role="tab" data-toggle="tab">基本信息</a>
								</li>
								<li role="presentation"><a href="#shili" role="tab"
									data-toggle="tab">视力检查</a>
								</li>
								<li role="presentation"><a href="#quguang" role="tab"
									data-toggle="tab">屈光检查</a>
								</li>
								<li role="presentation"><a href="#yanya" role="tab"
									data-toggle="tab">眼压检查</a>
								</li>
								<li role="presentation"><a href="#other" role="tab"
									data-toggle="tab">其他检查</a>
								</li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" role="tabpanel" id="detail">
									<div class="context">
										<div class="table-responsive">
											<table width="935" height="625">

												<tbody>
													<tr>
														<td>
															<label class="col-sm-4 control-label">ID</label>
															<div class="col-sm-8">
																<label class="radio-inline">${username}</label>
															</div>
														</td>
														<td>
															<label class="col-sm-4 control-label">屈光矫正方法</label>
															<div class="col-sm-8">
																<label class="radio-inline"> 
																	<input type="radio" name="refractiveCorrectionMethod" value="框架眼镜"> 框架眼镜
																</label> 
																<label class="radio-inline"> 
																	<input type="radio" name="refractiveCorrectionMethod" value="隐形眼镜 "> 隐形眼镜 
																</label> 
																<label class="radio-inline">
																	<input type="radio" name="refractiveCorrectionMethod" value="OK镜"> OK镜
																</label>
																<label class="radio-inline">
																	<input type="radio" name="refractiveCorrectionMethod" value="角膜手术或植入物"> 角膜手术或植入物
																</label>
																<label class="radio-inline">
																	<input type="radio" name="refractiveCorrectionMethod" value="其他"> 其他
																</label>
															</div>
														</td>
													</tr>
													<tr>
														<td>
															<label class="col-sm-4 control-label">年检眼次数</label>
															<div class="col-sm-8">
																<label class="radio-inline"> 
																	<input type="radio" name="theNumberOfAnnualEyeCheck" value="1次"> 1次
																</label> 
																<label class="radio-inline"> 
																	<input type="radio" name="theNumberOfAnnualEyeCheck" value="2次以上 "> 2次以上 
																</label> 
																<label class="radio-inline">
																	<input type="radio" name="theNumberOfAnnualEyeCheck" value="无"> 无
																</label>
															</div>
														</td>
														<td>
															<label class="col-sm-4 control-label">出生时情况</label>
															<div class="col-sm-8">
																<label class="radio-inline"> 
																	<input type="radio" name="birthSituation" value="孕不足37周"> 孕不足37周
																</label> 
																<label class="radio-inline"> 
																	<input type="radio" name="birthSituation" value="体重低于2.5KG "> 体重低于2.5KG 
																</label> 
																<label class="radio-inline">
																	<input type="radio" name="birthSituation" value="缺氧史"> 缺氧史
																</label>
																<label class="radio-inline">
																	<input type="radio" name="birthSituation" value="其他"> 其他
																</label>
															</div>
														</td>
													</tr>
													<tr>
														<td>
														
															<label class="col-sm-4 control-label">六百度以上近视亲戚</label>
														<!-- 
															<div class="col-sm-8">
																<label class="radio-inline"> 
																	<input type="radio" name="moreThan600degreesOfMyopiaRelatives" value="母亲"> 母亲 
																</label> 
																<label class="radio-inline"> 
																	<input type="radio" name="moreThan600degreesOfMyopiaRelatives" value="父亲 "> 父亲 
																</label> 
																<label class="radio-inline"> 
																	<input type="radio" name="moreThan600degreesOfMyopiaRelatives" value="近亲 "> 近亲 
																</label> 
																<label class="radio-inline">
																	<input type="radio" name="moreThan600degreesOfMyopiaRelatives" value="无" > 无 
																</label>
															</div>
														 -->
														 <div class="col-sm-8">
																<label class="radio-inline"> 
																	<!-- <input type="radio" name="diet" value="咸"> 咸  -->
																	<input type="checkbox" name="moreThan600degreesOfMyopiaRelatives" value="母亲"> 母亲
																</label> 
																<label class="radio-inline"> 
																	<!-- <input type="radio" name="diet" value="甜"> 甜   -->
																	<input type="checkbox" name="moreThan600degreesOfMyopiaRelatives" value="父亲"> 父亲
																</label> 
																<label class="radio-inline">
																	<!-- <input type="radio" name="diet" value="辣"> 辣 -->
																	<input type="checkbox" name="moreThan600degreesOfMyopiaRelatives" value="近亲"> 近亲
																</label>
																<label class="radio-inline"> 
																	<!-- <input type="radio" name="diet" value="油腻"> 油腻  -->
																	<input type="checkbox" name="moreThan600degreesOfMyopiaRelatives" value="无"> 无
																</label> 
															</div>
														</td>
														<td>
															<label class="col-sm-4 control-label">每天户外活动时间</label>
															<div class="col-sm-8">
																<label class="radio-inline"> 
																	<input type="radio" name="everyTimeOutdoors" value="半小时"> 半小时 
																</label> 
																<label class="radio-inline"> 
																	<input type="radio" name="everyTimeOutdoors" value="1小时 "> 1小时  
																</label> 
																<label class="radio-inline">
																	<input type="radio" name="everyTimeOutdoors" value="2小时" > 2小时
																</label>
																<label class="radio-inline"> 
																	<input type="radio" name="everyTimeOutdoors" value="2小时以上"> 2小时以上 
																</label> 
																<label class="radio-inline"> 
																	<input type="radio" name="everyTimeOutdoors" value="无 "> 无  
																</label> 
															</div>
														</td>
													</tr>
													<tr>
														<td>
															<label class="col-sm-4 control-label">每天喝酒情况</label>
															<div class="col-sm-8">
																<label class="radio-inline"> 
																	<input type="radio" name="theDailyDrinking" value="三餐"> 三餐 
																</label> 
																<label class="radio-inline"> 
																	<input type="radio" name="theDailyDrinking" value="一到两餐 "> 一到两餐
																</label> 
																<label class="radio-inline"> 
																	<input type="radio" name="theDailyDrinking" value="不定时大量"> 不定时大量 
																</label> 
																<label class="radio-inline"> 
																	<input type="radio" name="theDailyDrinking" value="偶尔小量 "> 偶尔小量
																</label> 
																<label class="radio-inline"> 
																	<input type="radio" name="theDailyDrinking" value="无"> 无 
																</label> 
																<label class="radio-inline"> 
																	<input type="radio" name="theDailyDrinking" value="其他 "> 其他
																</label> 
															</div>
														</td>
														<td>
															<label class="col-sm-4 control-label">每天电子产品使用时间</label>
															<div class="col-sm-8">
																<label class="radio-inline">
																	<input type="radio" name="everyTimeTheElectronicProducts" value="不用"> 不用 
																</label>
																<label class="radio-inline"> 
																	<input type="radio" name="everyTimeTheElectronicProducts" value="半小时"> 半小时 
																</label> 
																<label class="radio-inline"> 
																	<input type="radio" name="everyTimeTheElectronicProducts" value="1-2小时"> 1-2小时  
																</label> 
																<label class="radio-inline">
																	<input type="radio" name="everyTimeTheElectronicProducts" value="3小时"> 3小时 
																</label>
																<label class="radio-inline"> 
																	<input type="radio" name="everyTimeTheElectronicProducts" value="3小时以上"> 3小时以上  
																</label> 
																<label class="radio-inline"> 
																	<input type="radio" name="everyTimeTheElectronicProducts" value="其他"> 其他  
																</label> 																
															</div>
														</td>
													</tr>
													<tr>
														<td>
															<label class="col-sm-4 control-label">连续视近休息时间</label>
															<div class="col-sm-8">
																<label class="radio-inline">
																	<input type="radio" name="continuousAsTheRecentBreak" value="每小时休10分钟"> 每小时休10分钟 
																</label>
																<label class="radio-inline"> 
																	<input type="radio" name="continuousAsTheRecentBreak" value="1-2小时休10分钟"> 1-2小时休10分钟 
																</label> 
																<label class="radio-inline"> 
																	<input type="radio" name="continuousAsTheRecentBreak" value="可以长时间不休息"> 可以长时间不休息  
																</label> 
															</div>
														</td>
														<td><label class="col-sm-4 control-label">饮食习惯</label>
															<div class="col-sm-8">
																<label class="radio-inline"> 
																	<!-- <input type="radio" name="diet" value="咸"> 咸  -->
																	<input type="checkbox" name="diet" value="咸"> 咸
																</label> 
																<label class="radio-inline"> 
																	<!-- <input type="radio" name="diet" value="甜"> 甜   -->
																	<input type="checkbox" name="diet" value="甜"> 甜
																</label> 
																<label class="radio-inline">
																	<!-- <input type="radio" name="diet" value="辣"> 辣 -->
																	<input type="checkbox" name="diet" value="辣"> 辣
																</label>
																<label class="radio-inline"> 
																	<!-- <input type="radio" name="diet" value="油腻"> 油腻  -->
																	<input type="checkbox" name="diet" value="油腻"> 油腻
																</label> 
																<label class="radio-inline"> 
																	<!-- <input type="radio" name="diet" value="清淡"> 清淡   -->
																	<input type="checkbox" name="diet" value="清淡"> 清淡
																</label> 
																<label class="radio-inline">
																	<!-- <input type="radio" name="diet" value="其他"> 其他 -->
																	<input type="checkbox" name="diet" value="其他"> 其他
																</label>
															</div>
														</td>
													</tr>
													<!-- 新增双倍关怀计划 2016-1-5 -->
													<tr>
														<td>
															<label class="col-sm-4 control-label">是否双倍关怀计划</label>
															<div class="col-sm-8">
																<label class="radio-inline">
																	<input type="radio" name="doublecare" value="是"> 是 
																</label>
																<label class="radio-inline"> 
																	<input type="radio" name="doublecare" value="否"> 否
																</label> 
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">既往病史</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="medicalHistory" value="" />
															</div></td>
															<td><label class="col-sm-4 control-label">药物过敏情况</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="drugAllergies" value="" />
															</div></td>
													</tr>
													<tr>
														<td>
															<label class="col-sm-4 control-label">
																<span style="color: red;padding-right: 5px;vertical-align: middle;">*</span>检查序列
															</label>
															<div class="col-sm-8">
																<input type="text" class="form-control" name="checkSequence" value="" required="required"/>
															</div>
														</td>
														
														<td><label class="col-sm-4 control-label">
															<span style="color: red;padding-right: 5px;vertical-align: middle;">*</span>检查时间
															</label>
															<div class="col-sm-8">
																<input type="text" class="form-control" id="checkTime" name="checkTime" 
																	placeholder="请选择检查日期" onClick="WdatePicker()" required>
																	
															</div></td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">监护人</label>
															<div class="col-sm-8">
																<input type="text" class="form-control" name="companion"
																	value="" />
															</div></td>
														<td><label class="col-sm-4 control-label">检查数据检查者</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="checkTheDataExaminer" value="" />
															</div></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div class="tab-pane" role="tabpanel" id="shili">
									<div class="context">
										<div class="table-responsive">
											<table>

												<tbody>
													<tr>
														<td><label class="col-sm-4 control-label">视力检查检查设备</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="visualIinspectionInspectionEquipment" value="" />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">视力检查序列号</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="visualInspectionSerialNumber" value="" />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">视力检查检测时间</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="visualInspectionDetectionTime" value="" />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">视力检查检查者</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="visualInspectionExaminer" value="" />
															</div></td>
													</tr>
													<tr>
														
														<td><label class="col-sm-4 control-label">右眼检测环境1</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeDetectionEnvironment" value="" />
															</div></td>
														<td><label class="col-sm-4 control-label">左眼检测环境1</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeDetectionEnvironment" value="" />
															</div></td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label"><span style="color: red;padding-right: 5px;vertical-align: middle;">*</span>右眼小数值1</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeLittleValue" value="" required="required"/>
															</div></td>
														<td><label class="col-sm-4 control-label">
														<span style="color: red;padding-right: 5px;vertical-align: middle;">*</span>左眼小数值1</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeLittleValue" value="" required="required"/>
															</div></td>
														
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">
														<span style="color: red;padding-right: 5px;vertical-align: middle;">*</span>右眼视功能1</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeVisualFunction" value="" required="required"/>
															</div></td>
														<td><label class="col-sm-4 control-label">
														<span style="color: red;padding-right: 5px;vertical-align: middle;">*</span>左眼视功能1</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeVisualFunction" value="" required="required"/>
															</div></td>
														
													</tr>
													<tr>
														
														<td><label class="col-sm-4 control-label">
														<span style="color: red;padding-right: 5px;vertical-align: middle;">*</span>右眼速度1</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeSpeed" value="" required="required"/>
															</div></td>
														<td><label class="col-sm-4 control-label">
														<span style="color: red;padding-right: 5px;vertical-align: middle;">*</span>左眼速度1</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeSpeed" value="" required="required"/>
															</div></td>
													</tr>
													<tr>
														
														<td><label class="col-sm-4 control-label">右眼检测环境2</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeDetectionEnvironmentSecond" value="" />
															</div></td>
														<td><label class="col-sm-4 control-label">左眼检测环境2</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeDetectionEnvironmentSecond" value="" />
															</div></td>
													</tr>
													<tr>
														<!-- <td><label class="col-sm-4 control-label"><span style="color: red;padding-right: 5px;vertical-align: middle;">*</span>右眼小数值2</label> -->
														<td><label class="col-sm-4 control-label">右眼小数值2</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeLittleValueSecond" value=""/>
															</div></td>
														<td><label class="col-sm-4 control-label">左眼小数值2</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeLittleValueSecond" value=""/>
															</div></td>
														
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">右眼视功能2</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeVisualFunctionSecond" value="" />
															</div></td>
														<td><label class="col-sm-4 control-label">左眼视功能2</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeVisualFunctionSecond" value="" />
															</div></td>
														
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">右眼速度2</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeSpeedSecond" value="" />
															</div></td>
														<td><label class="col-sm-4 control-label">左眼速度2</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeSpeedSecond" value="" />
															</div></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div class="tab-pane" role="tabpanel" id="quguang">
									<div class="context">
										<div class="table-responsive">
											<table>
												<tbody>
													<tr>
														<td><label class="col-sm-4 control-label">屈光检查检查设备</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="refractionInspectionEquipment" value="" />
															</div></td>
														<td><label class="col-sm-4 control-label">屈光检查序列号</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="refractiveCheckTheSerialNumber" value="" />
															</div></td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">屈光检查检测时间</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="refractionDetectionTime" value="" />
															</div></td>
														<td><label class="col-sm-4 control-label">屈光检查VD</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="refractionDetectionVd" value="" />
															</div></td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">屈光检查CYL</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="refractionDetectionCyl" value="" />
															</div></td>
														<td><label class="col-sm-4 control-label">屈光检查检查者</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="refractionDetectionExaminer" value="" />
															</div></td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">屈光检查瞳距</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="refractionDetectionIpd" value="" />
															</div>
														</td>
														<td></td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼球镜S/DS1</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeSphericalLens" value="" />
															</div></td>
														<td><label class="col-sm-4 control-label">右眼球镜S/DS1</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeSphericalLens" value="" />
															</div></td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼柱镜C/DC1</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftCylinder" value="" />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼柱镜C/DC1</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightCylinder" value="" />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼柱镜轴位A1</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftCylinderAxial" value="" />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼柱镜轴位A1</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightCylinderAxial" value="" />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼球镜S/DS2</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeSphericalLensSecond" value="" />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼球镜S/DS2</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeSphericalLensSecond" value="" />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼柱镜C/DC2</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftCylinderSecond" value="" />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼柱镜C/DC2</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightCylinderSecond" value="" />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼柱镜轴位A2</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftCylinderAxialSecond" value="" />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼柱镜轴位A2</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightCylinderAxialSecond" value="" />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼球镜S/DS3</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeSphericalLensThird" value="" />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼球镜S/DS3</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeSphericalLensThird" value="" />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼柱镜C/DC3</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftCylinderThird" value="" />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼柱镜C/DC3</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightCylinderThird" value="" />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼柱镜轴位A3</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftCylinderAxialThird" value="" />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼柱镜轴位A3</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightCylinderAxialThird" value="" />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼屈光平均值</label>	<!-- <span style="color: red;padding-right: 5px;vertical-align: middle;">*</span> -->
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="refractionLeftEyeAverages" value=""/>	<!--  required="required" -->
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼屈光平均值</label>	<!-- <span style="color: red;padding-right: 5px;vertical-align: middle;">*</span> -->
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="refractionRightEyeAverages" value="" />	<!-- required="required" -->
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼检影验光</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeRetinoscopy" value="" />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼检影验光</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeRetinoscopy" value="" />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼近视力</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeNearVision" value="" />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼近视力</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeNearVision" value="" />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼戴镜度数</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeSpectaclesDegrees" value="" />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼戴镜度数</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeSpectaclesDegrees" value="" />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼矫正视力</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeVisionCorrection" value="" />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼矫正视力</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeVisionCorrection" value="" />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼眼轴前房长度</label>	<!-- <span style="color: red;padding-right: 5px;vertical-align: middle;">*</span> -->
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftAnteriorAxialLength" value="" />	<!-- required="required" -->
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼眼轴前房长度</label>	<!-- <span style="color: red;padding-right: 5px;vertical-align: middle;">*</span> -->
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightAnteriorAxialLength" value="" />	<!-- required="required" -->
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div class="tab-pane" role="tabpanel" id="yanya">
									<div class="context">
										<div class="table-responsive">
											<table>
												<tbody>
													<tr>
														<td><label class="col-sm-4 control-label">眼压检查检查设备</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="ocularInspectionEquipment" value="" />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">眼压检查序列号</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="iopcheckTheSerialNumber" value="" />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">眼压检查检测时间</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="ocularInspectionDetectionTime" value="" />
															</div>
														</td>
														<td></td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼眼压1</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeFirstIop" value="" />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼眼压1</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeFirstIop" value="" />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼眼压2</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeSecondIop" value="" />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼眼压2</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeSecondIop" value="" />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼眼压3</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeThirdIop" value="" />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼眼压3</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeThirdIop" value="" />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼眼压4</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeFourthIop" value="" />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼眼压4</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeFourthIop" value="" />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼眼压平均值</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeTheMeanIop" value="" />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼眼压平均值</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeTheMeanIop" value="" />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">双眼视觉功能</label>

															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="binocularVision" value="" />
															</div></td>
														<td></td>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div class="tab-pane" role="tabpanel" id="other">
									<div class="context">
										<div class="table-responsive">
											<table>
												<tbody>
													<tr>
														<td><label class="col-sm-4 control-label">左眼眼位</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyePosition" value="" />
															</div>
														</td>


														<td><label class="col-sm-4 control-label">右眼眼位</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyePosition" value="" />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼眼肌</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeMuscle" value="" />
															</div>
														</td>

														<td><label class="col-sm-4 control-label">右眼眼肌</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeMuscle" value="" />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼眼睑</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyelid" value="" />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼眼睑</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyelid" value="" />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼泪器</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeLacrimalApparatus" value="" />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼泪器</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeLacrimalApparatus" value="" />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼结膜</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeConjunctiva" value="" />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼结膜</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeConjunctiva" value="" />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼巩膜</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeSclera" value="" />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼巩膜</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeSclera" value="" />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼瞳孔</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyePupil" value="" />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼瞳孔</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyePupil" value="" />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼角膜</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeCornea" value="" />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼角膜</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeCornea" value="" />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼前房</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeAnteriorChamber" value="" />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼前房</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeAnteriorChamber" value="" />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼晶体</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeCrystal" value="" />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼晶体</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeCrystal" value="" />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼眼底</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeFundus" value="" />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼眼底</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeFundus" value="" />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼其他</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeOther" value="" />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼其他</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeOther" value="" />
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>

					</fieldset>
					<div class="modal-footer">
						<button type="button" class="btn btn-info"
							onClick="history.back(-1)">返回</button>

						<button type="submit" class="btn btn-primary" id="submit">增加</button>
					</div>
				</form>
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
		$(function() {
			$("#docs-tab a")
					.click(
							function(e) {
								$(this).tab('show');
								var height = document
										.getElementById("page-container").scrollHeight;
								parent.AdjustIframeHeight(height);
							});
		});
		
function checkform()
		{
			var date = new Date();
			//alert(date);
			var nowyear = date.getFullYear();		//获取完整的年份(4位,1970-????)
			var nowmonth = date.getMonth()+1; 		//获取当前月份(0-11,0代表1月)
			var nowday = date.getDate();			//获取当前日(1-31)
			var nowtime = nowyear*10000 + nowmonth*100 + nowday;	//转换为20160104格式

			var checkTime = document.getElementById("checkTime").value;
			var time = checkTime.replace('-','').replace('-','');
			//alert("time为："+parseInt(time)+"nowtime为："+nowtime);
			if( parseInt(nowtime) - parseInt(time) <0 ){
			//if( parseInt(nowtime) - parseInt(agetime) <0 ){
				alert("出生日期输入错误！");
				return false;
			}
			else{
				alert("成功添加信息！");
				return true;
			}
			
		}
	</script>
</body>
</html>