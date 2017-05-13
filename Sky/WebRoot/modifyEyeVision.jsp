<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	<div class="content sky-content" id="page-container">
		<div class="frame-records">
			<div class="records-new part4">
				<form class="form-horizontal" action="updatedetailVisionInfo.action" method="post">
					<fieldset>
						<div class="title">修改视觉档案信息</div>
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
											<table>

												<tbody>
													<tr>
														<td><label class="col-sm-4 control-label">档案号</label>
															<div class="col-sm-8">
																<input type="text" class="form-control" name="tableId"
																	value='${vc.tableId}' readonly="readonly" />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">ID</label>
															<div class="col-sm-8">
																<input type="text" class="form-control" name="username"
																	value='${vc.username}' readonly="readonly" />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">双倍关怀计划</label>
															<div class="col-sm-8">
																<label class="radio-inline"> 
																	<input type="radio" name="doublecare" value="是" 
																		<c:if test="${vc.doublecare=='是' }">checked="checked"</c:if>> 是
																	</label>
																<label class="radio-inline"> 
																	<input type="radio" name="doublecare" value="否" 
																		<c:if test="${vc.doublecare=='否' }">checked="checked"</c:if>> 否
																	</label>
															</div></td>
																
														<td><label class="col-sm-4 control-label">屈光矫正方法</label>
															<div class="col-sm-8">
																<!-- 
																<input type="text" class="form-control"
																	name="refractiveCorrectionMethod" value='${vc.refractiveCorrectionMethod}' />
																-->
																<select type="select" class="form-control" name="refractiveCorrectionMethod" value='${vc.refractiveCorrectionMethod}'>
																	<option value='${vc.refractiveCorrectionMethod}'>${vc.refractiveCorrectionMethod}</option>
																	<option value="框架眼镜">框架眼镜</option>
																	<option value="隐形眼镜">隐形眼镜</option>
																	<option value="OK镜">OK镜</option>
																	<option value="角膜手术或植入物">角膜手术或植入物</option>
																	<option value="其他">其他</option>
																</select>
															</div></td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">年检眼次数</label>
															<div class="col-sm-8">
																<!-- 
																<input type="text" class="form-control"
																	name="theNumberOfAnnualEyeCheck" value='${vc.theNumberOfAnnualEyeCheck}' />
																-->
																<select type="select" class="form-control" name="theNumberOfAnnualEyeCheck" value='${vc.theNumberOfAnnualEyeCheck}'>
																	<option value='${vc.theNumberOfAnnualEyeCheck}'>${vc.theNumberOfAnnualEyeCheck}</option>
																	<option value="1次">1次</option>
																	<option value="2次以上">2次以上</option>
																	<option value="无">无</option>
																</select>
															</div></td>
														<td><label class="col-sm-4 control-label">出生时情况</label>
															<div class="col-sm-8">
																<!-- 
																<input type="text" class="form-control"
																	name="birthSituation" value='${vc.birthSituation}' />
																 -->
																 <select type="select" class="form-control" name="birthSituation" value='${vc.birthSituation}'>
																	<option value='${vc.birthSituation}'>${vc.birthSituation}</option>
																	<option value="孕不足37周">孕不足37周</option>
																	<option value="体重低于2.5KG">体重低于2.5KG</option>
																	<option value="缺氧史">缺氧史</option>
																	<option value="其他">其他</option>
																</select>
															</div></td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">六百度以上近视亲戚</label>
															<div class="col-sm-8">
																<!-- 
																<select type="select" class="form-control" name="moreThan600degreesOfMyopiaRelatives" value='${vc.moreThan600degreesOfMyopiaRelatives}'>
																	<option value='${vc.moreThan600degreesOfMyopiaRelatives}'>${vc.moreThan600degreesOfMyopiaRelatives}</option>
																	<option value="母亲">母亲</option>
																	<option value="父亲">父亲</option>
																	<option value="近亲">近亲</option>
																	<option value="无">无</option>
																</select>
																 -->
																<label class="radio-inline"> 
																<input type="checkbox" name="moreThan600degreesOfMyopiaRelatives" value="母亲" 
																		<c:if test="${vc.moreThan600degreesOfMyopiaRelatives.contains('母亲') }">checked="checked"</c:if>> 母亲
																</label> 
																<label class="radio-inline"> 
																	<input type="checkbox" name="moreThan600degreesOfMyopiaRelatives" value="父亲"
																		<c:if test="${vc.moreThan600degreesOfMyopiaRelatives.contains('父亲') }">checked="checked"</c:if>> 父亲
																</label> 
																<label class="radio-inline">
																	<input type="checkbox" name="moreThan600degreesOfMyopiaRelatives" value="近亲"
																		<c:if test="${vc.moreThan600degreesOfMyopiaRelatives.contains('近亲') }">checked="checked"</c:if>> 近亲
																</label>
																<label class="radio-inline"> 
																	<input type="checkbox" name="moreThan600degreesOfMyopiaRelatives" value="无"
																		<c:if test="${vc.moreThan600degreesOfMyopiaRelatives.contains('无') }">checked="checked"</c:if>> 无
																</label> 
															</div></td>
														<td><label class="col-sm-4 control-label">药物过敏情况</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="drugAllergies" value='${vc.drugAllergies}' />
															</div></td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">既往病史</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="medicalHistory" value='${vc.medicalHistory}' />
															</div></td>
														<td><label class="col-sm-4 control-label">每天电子产品使用时间</label>
															<div class="col-sm-8">
																<!-- 
																<input type="text" class="form-control"
																	name="everyTimeTheElectronicProducts" value='${vc.everyTimeTheElectronicProducts}' />
																 -->
																 <select type="select" class="form-control" name="everyTimeTheElectronicProducts" value='${vc.everyTimeTheElectronicProducts}'>
																	<option value='${vc.everyTimeTheElectronicProducts}'>${vc.everyTimeTheElectronicProducts}</option>
																	<option value="不用">不用</option>
																	<option value="半小时">半小时</option>
																	<option value="1-2小时">1-2小时</option>
																	<option value="3小时">3小时</option>
																	<option value="3小时以上">3小时以上</option>
																	<option value="其他">其他</option>
																</select>
															</div></td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">连续视近休息时间</label>
															<div class="col-sm-8">
																<!-- 
																<input type="text" class="form-control"
																	name="continuousAsTheRecentBreak" value='${vc.continuousAsTheRecentBreak}' />
															 	-->
															 	<select type="select" class="form-control" name="continuousAsTheRecentBreak" value='${vc.continuousAsTheRecentBreak}'>
																	<option value='${vc.continuousAsTheRecentBreak}'>${vc.continuousAsTheRecentBreak}</option>
																	<option value="每小时休10分钟">每小时休10分钟</option>
																	<option value="1-2小时休10分钟">1-2小时休10分钟</option>
																	<option value="可以长时间不休息">可以长时间不休息</option>
																</select>
															</div></td>
														<td><label class="col-sm-4 control-label">饮食习惯</label>
															<div class="col-sm-8">
																<!-- 
																<input type="text" class="form-control" name="diet"
																	value='${vc.diet}' />
																 -->
																 <!-- 
																 <select type="select" class="form-control" name="diet"	value='${vc.diet}'>
																	<option value='${vc.diet}'>${vc.diet}</option>
																	<option value="咸 ">咸 </option>
																	<option value="甜">甜</option>
																	<option value="辣">辣</option>
																	<option value="油腻">油腻</option>
																	<option value="清淡">清淡</option>
																	<option value="其他">其他</option>
																</select>
																 -->
																<label class="radio-inline"> 
																	<input type="checkbox" name="diet" value="咸" 
																		<c:if test="${vc.diet.contains('咸') }">checked="checked"</c:if>> 咸
																</label> 
																<label class="radio-inline"> 
																	<input type="checkbox" name="diet" value="甜"
																		<c:if test="${vc.diet.contains('甜') }">checked="checked"</c:if>> 甜
																</label> 
																<label class="radio-inline">
																	<input type="checkbox" name="diet" value="辣"
																		<c:if test="${vc.diet.contains('辣') }">checked="checked"</c:if>> 辣
																</label>
																<label class="radio-inline"> 
																	<input type="checkbox" name="diet" value="油腻"
																		<c:if test="${vc.diet.contains('油腻') }">checked="checked"</c:if>> 油腻
																</label> 
																<label class="radio-inline"> 
																	<input type="checkbox" name="diet" value="清淡"
																		<c:if test="${vc.diet.contains('清淡') }">checked="checked"</c:if>> 清淡
																</label> 
																<label class="radio-inline">
																	<input type="checkbox" name="diet" value="其他"
																		<c:if test="${vc.diet.contains('其他') }">checked="checked"</c:if>> 其他
																</label>
															</div></td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">每天喝酒情况</label>
															<div class="col-sm-8">
																<!-- 
																<input type="text" class="form-control"
																	name="theDailyDrinking" value='${vc.theDailyDrinking}' />
																 -->
																 <select type="select" class="form-control" name="theDailyDrinking" value='${vc.theDailyDrinking}'>
																	<option value='${vc.theDailyDrinking}'>${vc.theDailyDrinking}</option>
																	<option value="三餐">三餐 </option>
																	<option value="一到两餐">一到两餐</option>
																	<option value="不定时大量">不定时大量</option>
																	<option value="偶尔小量">偶尔小量</option>
																	<option value="无">无</option>
																	<option value="其他">其他</option>
																</select>
															</div></td>
														<td><label class="col-sm-4 control-label">每天户外活动时间</label>
															<div class="col-sm-8">
																<!-- 
																<input type="text" class="form-control"
																	name="everyTimeOutdoors" value='${vc.everyTimeOutdoors}' />
																 -->
																 <select type="select" class="form-control" name="everyTimeOutdoors" value='${vc.everyTimeOutdoors}'>
																	<option value='${vc.everyTimeOutdoors}'>${vc.everyTimeOutdoors}</option>
																	<option value="半小时">半小时 </option>
																	<option value="1小时">1小时</option>
																	<option value="2小时">2小时</option>
																	<option value="2小时以上 ">2小时以上 </option>
																	<option value="无">无</option>
																</select>
															</div></td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">检查序列</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="checkSequence" value='${vc.checkSequence}' />
															</div></td>
														<td><label class="col-sm-4 control-label">检查时间</label>
															<div class="col-sm-8">
																<input type="text" class="form-control" name="checkTime"
																	value='${vc.checkTime}' readonly="readonly"/>
															</div></td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">监护人</label>
															<div class="col-sm-8">
																<input type="text" class="form-control" name="companion"
																	value='${vc.companion}' />
															</div></td>
														<td><label class="col-sm-4 control-label">检查数据检查者</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="checkTheDataExaminer" value='${vc.checkTheDataExaminer}'/>
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
																	name="visualIinspectionInspectionEquipment" value='${vc.visualIinspectionInspectionEquipment}' />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">视力检查序列号</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="visualInspectionSerialNumber" value='${vc.visualInspectionSerialNumber}' />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">视力检查检测时间</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="visualInspectionDetectionTime" value='${vc.visualInspectionDetectionTime}' />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">视力检查检查者</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="visualInspectionExaminer" value='${vc.visualInspectionExaminer}' />
															</div></td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">右眼检测环境</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeDetectionEnvironment" value='${vc.rightEyeDetectionEnvironment}' />
															</div></td>
														<td><label class="col-sm-4 control-label">左眼检测环境</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeDetectionEnvironment" value='${vc.leftEyeDetectionEnvironment}' />
															</div></td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">右眼小数值</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeLittleValue" value='${vc.rightEyeLittleValue}' />
															</div></td>
														<td><label class="col-sm-4 control-label">左眼小数值</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeLittleValue" value='${vc.leftEyeLittleValue}' />
															</div></td>
														
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">右眼视功能</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeVisualFunction" value='${vc.rightEyeVisualFunction}' />
															</div></td>
														<td><label class="col-sm-4 control-label">左眼视功能</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeVisualFunction" value='${vc.leftEyeVisualFunction}' />
															</div></td>
														
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">右眼速度</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeSpeed" value='${vc.rightEyeSpeed}' />
															</div></td>
														<td><label class="col-sm-4 control-label">左眼速度</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeSpeed" value='${vc.leftEyeSpeed}'/>
															</div></td>
														
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">右眼检测环境</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeDetectionEnvironmentSecond" value='${vc.rightEyeDetectionEnvironmentSecond}' />
															</div></td>
														<td><label class="col-sm-4 control-label">左眼检测环境</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeDetectionEnvironmentSecond" value='${vc.leftEyeDetectionEnvironmentSecond}' />
															</div></td>
														
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">右眼小数值</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeLittleValueSecond" value='${vc.rightEyeLittleValueSecond}' />
															</div></td>
														<td><label class="col-sm-4 control-label">左眼小数值</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeLittleValueSecond" value='${vc.leftEyeLittleValueSecond}' />
															</div></td>
														
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">右眼视功能</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeVisualFunctionSecond" value='${vc.rightEyeVisualFunctionSecond}' />
															</div></td>
														<td><label class="col-sm-4 control-label">左眼视功能</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeVisualFunctionSecond" value='${vc.leftEyeVisualFunctionSecond}'  />
															</div></td>
														
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">右眼速度</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeSpeedSecond" value='${vc.rightEyeSpeedSecond}' />
															</div></td>
														<td><label class="col-sm-4 control-label">左眼速度</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeSpeedSecond" value='${vc.leftEyeSpeedSecond}' />
															</div></td>
														
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
				<!-- ***************************************************************************************************************************** -->				
								<div class="tab-pane" role="tabpanel" id="quguang">
									<div class="context">
										<div class="table-responsive">
											<table>
												<tbody>
													<tr>
														<td><label class="col-sm-4 control-label">屈光检查检查设备</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="refractionInspectionEquipment" value='${vc.refractionInspectionEquipment}'/>
															</div></td>
														<td><label class="col-sm-4 control-label">屈光检查序列号</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="refractiveCheckTheSerialNumber" value='${vc.refractiveCheckTheSerialNumber}' />
															</div></td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">屈光检查检测时间</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="refractionDetectionTime" value='${vc.refractionDetectionTime}' />
															</div></td>
														<td><label class="col-sm-4 control-label">屈光检查VD</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="refractionDetectionVd" value='${vc.refractionDetectionVd}' />
															</div></td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">屈光检查CYL</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="refractionDetectionCyl" value='${vc.refractionDetectionCyl}' />
															</div></td>
														<td><label class="col-sm-4 control-label">屈光检查检查者</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="refractionDetectionExaminer" value='${vc.refractionDetectionExaminer}' />
															</div></td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">屈光检查瞳距</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="refractionDetectionIpd" value='${vc.refractionDetectionIpd}' />
															</div>
														</td>
														<td></td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼球镜S/DS1</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeSphericalLens" value='${vc.leftEyeSphericalLens}' />
															</div></td>
														<td><label class="col-sm-4 control-label">右眼球镜S/DS1</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeSphericalLens" value='${vc.rightEyeSphericalLens}' />
															</div></td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼柱镜C/DC1</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftCylinder" value='${vc.leftCylinder}' />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼柱镜C/DC1</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightCylinder" value='${vc.rightCylinder}' />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼柱镜轴位A1</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftCylinderAxial" value='${vc.leftCylinderAxial}' />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼柱镜轴位A1</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightCylinderAxial" value='${vc.rightCylinderAxial}' />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼球镜S/DS2</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeSphericalLensSecond" value='${vc.leftEyeSphericalLensSecond}' />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼球镜S/DS2</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeSphericalLensSecond" value='${vc.rightEyeSphericalLensSecond}' />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼柱镜C/DC2</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftCylinderSecond" value='${vc.leftCylinderSecond}' />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼柱镜C/DC2</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightCylinderSecond" value='${vc.rightCylinderSecond}' />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼柱镜轴位A2</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftCylinderAxialSecond" value='${vc.leftCylinderAxialSecond}' />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼柱镜轴位A2</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightCylinderAxialSecond" value='${vc.rightCylinderAxialSecond}' />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼球镜S/DS3</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeSphericalLensThird" value='${vc.leftEyeSphericalLensThird}' />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼球镜S/DS3</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeSphericalLensThird" value='${vc.rightEyeSphericalLensThird}' />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼柱镜C/DC3</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftCylinderThird" value='${vc.leftCylinderThird}' />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼柱镜C/DC3</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightCylinderThird" value='${vc.rightCylinderThird}' />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼柱镜轴位A3</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftCylinderAxialThird" value='${vc.leftCylinderAxialThird}' />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼柱镜轴位A3</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightCylinderAxialThird" value='${vc.rightCylinderAxialThird}' />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼屈光平均值</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="refractionLeftEyeAverages" value='${vc.refractionLeftEyeAverages}' />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼屈光平均值</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="refractionRightEyeAverages" value='${vc.refractionRightEyeAverages}' />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼检影验光</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeRetinoscopy" value='${vc.leftEyeRetinoscopy}' />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼检影验光</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeRetinoscopy" value='${vc.rightEyeRetinoscopy}' />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼近视力</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeNearVision" value='${vc.leftEyeNearVision}' />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼近视力</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeNearVision" value='${vc.rightEyeNearVision}' />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼戴镜度数</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeSpectaclesDegrees" value='${vc.leftEyeSpectaclesDegrees}' />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼戴镜度数</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeSpectaclesDegrees" value='${vc.rightEyeSpectaclesDegrees}' />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼矫正视力</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeVisionCorrection" value='${vc.leftEyeVisionCorrection}' />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼矫正视力</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeVisionCorrection" value='${vc.rightEyeVisionCorrection}' />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼眼轴前房长度</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftAnteriorAxialLength" value='${vc.leftAnteriorAxialLength}' />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼眼轴前房长度</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightAnteriorAxialLength" value='${vc.rightAnteriorAxialLength}' />
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
																	name="ocularInspectionEquipment" value='${vc.ocularInspectionEquipment}' />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">眼压检查序列号</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="iopcheckTheSerialNumber" value='${vc.iopcheckTheSerialNumber}' />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">眼压检查检测时间</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="ocularInspectionDetectionTime" value='${vc.ocularInspectionDetectionTime}' />
															</div>
														</td>
														<td></td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼眼压1</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeFirstIop" value='${vc.leftEyeFirstIop}' />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼眼压1</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeFirstIop" value='${vc.rightEyeFirstIop}' />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼眼压2</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeSecondIop" value='${vc.leftEyeSecondIop}' />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼眼压2</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeSecondIop" value='${vc.rightEyeSecondIop}' />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼眼压3</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeThirdIop" value='${vc.leftEyeThirdIop}' />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼眼压3</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeThirdIop" value='${vc.rightEyeThirdIop}' />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼眼压4</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeFourthIop" value='${vc.leftEyeFourthIop}' />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼眼压4</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeFourthIop" value='${vc.rightEyeFourthIop}' />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼眼压平均值</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeTheMeanIop" value='${vc.leftEyeTheMeanIop}' />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼眼压平均值</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeTheMeanIop" value='${vc.rightEyeTheMeanIop}' />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">双眼视觉功能</label>

															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="binocularVision" value='${vc.binocularVision}' />
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
																	name="leftEyePosition" value='${vc.leftEyePosition}' />
															</div>
														</td>


														<td><label class="col-sm-4 control-label">右眼眼位</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyePosition" value='${vc.rightEyePosition}' />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼眼肌</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeMuscle" value='${vc.leftEyeMuscle}' />
															</div>
														</td>

														<td><label class="col-sm-4 control-label">右眼眼肌</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeMuscle" value='${vc.rightEyeMuscle}' />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼眼睑</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyelid" value='${vc.leftEyelid}' />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼眼睑</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyelid" value='${vc.rightEyelid}' />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼泪器</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeLacrimalApparatus" value='${vc.leftEyeLacrimalApparatus}' />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼泪器</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeLacrimalApparatus" value='${vc.rightEyeLacrimalApparatus}' />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼结膜</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeConjunctiva" value='${vc.leftEyeConjunctiva}' />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼结膜</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeConjunctiva" value='${vc.rightEyeConjunctiva}' />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼巩膜</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeSclera" value='${vc.leftEyeSclera}' />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼巩膜</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeSclera" value='${vc.rightEyeSclera}' />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼瞳孔</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyePupil" value='${vc.leftEyePupil}' />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼瞳孔</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyePupil" value='${vc.rightEyePupil}' />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼角膜</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeCornea" value='${vc.leftEyeCornea}' />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼角膜</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeCornea" value='${vc.rightEyeCornea}' />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼前房</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeAnteriorChamber" value='${vc.leftEyeAnteriorChamber}' />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼前房</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeAnteriorChamber" value='${vc.rightEyeAnteriorChamber}' />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼晶体</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeCrystal" value='${vc.leftEyeCrystal}' />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼晶体</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeCrystal" value='${vc.rightEyeCrystal}' />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼眼底</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeFundus" value='${vc.leftEyeFundus}' />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼眼底</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeFundus" value='${vc.rightEyeFundus}' />
															</div>
														</td>
													</tr>
													<tr>
														<td><label class="col-sm-4 control-label">左眼其他</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="leftEyeOther" value='${vc.leftEyeOther}' />
															</div>
														</td>
														<td><label class="col-sm-4 control-label">右眼其他</label>
															<div class="col-sm-8">
																<input type="text" class="form-control"
																	name="rightEyeOther" value='${vc.rightEyeOther}' />
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

						<button type="submit" class="btn btn-primary" id="submit">修改</button>
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
	</script>
</body>
</html>