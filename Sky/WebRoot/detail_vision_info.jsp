<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
<script src="js/tab.js"></script>

</head>

<body>
	<div class="content sky-content" id="page-container">
		<div class="frame-records">
			<div class="records-new part4">
				<div class="title">
					档案详情
					<button type="button" class="btn btn-info btn-sm"
						style="position:absolute;right:10px;top:2px;background-color: #3CBE86;color: #fff;"
						onClick="history.back(-1)">返回</button>
				</div>
				<div class="tabbable" id="tabs-534095">
				<ul class="nav nav-tabs" role="tablist" id="docs-tab">
					<li role="presentation" class="active">
						<a href="#detail" role="tab" data-toggle="tab">基本信息</a>
					</li>
					<li role="presentation">
						<a href="#shili"role="tab" data-toggle="tab">视力检查</a>
					</li>
					<li role="presentation">
						<a href="#quguang" role="tab" data-toggle="tab">屈光检查</a>
					</li>
					<li role="presentation">
						<a href="#yanya" role="tab" data-toggle="tab">眼压检查</a>
					</li>
					<li role="presentation">
						<a href="#other" role="tab" data-toggle="tab">其他检查</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" role="tabpanel" id="detail">
						<div class="context">
							<div class="table-responsive">
						<table class="table table-hover table-bordered big-data table-striped">
							<colgroup>
								<col style="width:200px;">
								<col style="">
								<col style="width:200px;">
								<col style="">
							</colgroup>
							<tbody>
								<tr>
									<td>档案编号：</td>
									<td>${visioncheck.tableId}</td>
									<td>ID：</td>
									<td>${visioncheck.username}</td>
								</tr>
								<tr>
									<td>姓名：</td>
									<td>${tUserinfo.realname}</td>
									<td>年龄：</td>
									<td>${tUserinfo.age}</td>
								</tr>
								<tr>
									<td>录入人：</td>
									<!-- <td>${visioncheck.recorder}</td> -->
									<td>${rUserinfo.realname}</td>
									<td>录入时间：</td>
									<td>${visioncheck.recordTime}</td>
								</tr>
								<tr>
									<td>出生时情况：</td>
									<td>${visioncheck.birthSituation}</td>
									<td>600度以上近视亲戚：</td>
									<td>${visioncheck.moreThan600degreesOfMyopiaRelatives}</td>
								</tr>
								<tr>
									<td>屈光矫正方法：</td>
									<td>${visioncheck.refractiveCorrectionMethod}</td>
									<td>年检眼次数：</td>
									<td>${visioncheck.theNumberOfAnnualEyeCheck}</td>
								</tr>
								<tr>
									<td>每天电子产品使用时间：</td>
									<td>${visioncheck.everyTimeTheElectronicProducts}</td>
									<td>连续视近休息时间：</td>
									<td>${visioncheck.continuousAsTheRecentBreak}</td>
								</tr>
								<tr>
									<td>每天户外活动时间：</td>
									<td>${visioncheck.everyTimeOutdoors}</td>
									<td>每天喝酒情况：</td>
									<td>${visioncheck.theDailyDrinking}</td>
								</tr>
								<tr>
									<td>饮食习惯：</td>
									<td>${visioncheck.diet}</td>
									<td>双倍关怀计划：</td>
									<td>${visioncheck.doublecare}</td>
								</tr>
								<tr>	
									<td>药物过敏情况：</td>
									<td>${visioncheck.drugAllergies}</td>
									<td>视觉等级：</td>
									<td>${visioncheck.visionlevel}</td>
								</tr>
								<tr>
									<td>既往病史：</td>
									<td colspan="3">${visioncheck.medicalHistory}</td>
								</tr>
								<tr>
									<td>检查序列：</td>
									<td>${visioncheck.checkSequence}</td>
									<td>检查时间：</td>
									<td>${visioncheck.checkTime}</td>
								</tr>
								<tr>
									<td>检查数据检查者：</td>
									<td>${visioncheck.checkTheDataExaminer}</td>
									<td>监护人：</td>
									<td>${visioncheck.companion}</td>
								</tr>
							</tbody>
						</table>
							</div>
						</div>
					</div>
					<div class="tab-pane" role="tabpanel" id="shili">
						<div class="context">
							<div class="table-responsive">
							<table class="table table-hover table-bordered big-data table-striped">
							<colgroup>
								<col style="width:200px;">
								<col style="">
								<col style="width:200px;">
								<col style="">
							</colgroup>
							<tbody>
								<tr>
									<td>检测设备</td>
									<td>${visioncheck.visualIinspectionInspectionEquipment}</td>
									<td>检测序列号</td>
									<td>${visioncheck.visualInspectionSerialNumber}</td>
								</tr>
								<tr>
									<td>检测时间</td>
									<td>${visioncheck.visualInspectionDetectionTime}</td>
									<td>检测者</td>
									<td>${visioncheck.visualInspectionExaminer}</td>
								</tr>
								</tbody>
							</table>
							<table class="table table-hover table-bordered big-data table-striped">
							<colgroup>
								<col style="width:200px;">
								<col style="">
								<col style="">
							</colgroup>
							<tbody>
								<tr>
									<td></td>
									<td><b>左眼</b>
									</td>
									<td><b>右眼</b>
									</td>
								</tr>
								<tr>
									<td>环境</td>
									<td>${visioncheck.leftEyeDetectionEnvironment}</td>
									<td>${visioncheck.rightEyeDetectionEnvironment}</td>
								</tr>
								<tr>
									<td>小数值</td>
									<td>${visioncheck.leftEyeLittleValue}</td>
									<td>${visioncheck.rightEyeLittleValue}</td>
								</tr>
								<tr>
									<td>视功能</td>
									<td>${visioncheck.leftEyeVisualFunction}</td>
									<td>${visioncheck.rightEyeVisualFunction}</td>
								</tr>
								<tr>
									<td>速度</td>
									<td>${visioncheck.leftEyeSpeed}</td>
									<td>${visioncheck.rightEyeSpeed}</td>
								</tr>
								<tr>
									<td>环境</td>
									<td>${visioncheck.leftEyeDetectionEnvironmentSecond}</td>
									<td>${visioncheck.rightEyeDetectionEnvironmentSecond}</td>
								</tr>
								<tr>
									<td>小数值</td>
									<td>${visioncheck.leftEyeLittleValueSecond}</td>
									<td>${visioncheck.rightEyeLittleValueSecond}</td>
								</tr>
								<tr>
									<td>视功能</td>
									<td>${visioncheck.leftEyeVisualFunctionSecond}</td>
									<td>${visioncheck.rightEyeVisualFunctionSecond}</td>
								</tr>
								<tr>
									<td>速度</td>
									<td>${visioncheck.leftEyeSpeedSecond}</td>
									<td>${visioncheck.rightEyeSpeedSecond}</td>
								</tr>

							</tbody>
							</table>
							</div>
						</div>
					</div>
					<div class="tab-pane" role="tabpanel" id="quguang">
						<div class="context">
							<div class="table-responsive">
						<table class="table table-hover table-bordered big-data table-striped">
							<colgroup>
								<col style="width:200px;">
								<col style="">
								<col style="width:200px;">
								<col style="">
							</colgroup>
							<tbody>
								<tr>
									<td>检测设备</td>
									<td>${visioncheck.refractionInspectionEquipment}</td>
									<td>检测序列号</td>
									<td>${visioncheck.refractiveCheckTheSerialNumber}</td>
								</tr>
								<tr>
									<td>检测时间</td>
									<td>${visioncheck.refractionDetectionTime}</td>
									<td>参考VD</td>
									<td>${visioncheck.refractionDetectionVd}</td>
								</tr>
								<tr>
									<td>参考CYL</td>
									<td>${visioncheck.refractionDetectionCyl}</td>
									<td>检查者</td>
									<td>${visioncheck.refractionDetectionExaminer}</td>
								</tr>
								<tr>
									<td>瞳距PD</td>
									<td colspan="3">${visioncheck.refractionDetectionIpd}</td>
								</tr>
								</tbody>
							</table>
							<table class="table table-hover table-bordered big-data table-striped">
							<colgroup>
								<col style="width:200px;">
								<col style="">
								<col style="">
							</colgroup>
							<tbody>
								<tr>
									<td></td>
									<td><b>左眼</b>
									</td>
									<td><b>右眼</b>
									</td>
								</tr>
								<tr>
									<td>球镜S/DS1</td>
									<td>${visioncheck.leftEyeSphericalLens}</td>
									<td>${visioncheck.rightEyeSphericalLens}</td>
								</tr>
								<tr>
									<td>柱镜C/DC1</td>
									<td>${visioncheck.leftCylinder}</td>
									<td>${visioncheck.rightCylinder}</td>
								</tr>
								<tr>
									<td>柱镜轴位A1</td>
									<td>${visioncheck.leftCylinderAxial}</td>
									<td>${visioncheck.rightCylinderAxial}</td>
								</tr>
								<tr>
									<td>球镜S/DS2</td>
									<td>${visioncheck.leftEyeSphericalLensSecond}</td>
									<td>${visioncheck.rightEyeSphericalLensSecond}</td>
								</tr>
								<tr>
									<td>柱镜C/DC2</td>
									<td>${visioncheck.leftCylinderSecond}</td>
									<td>${visioncheck.rightCylinderSecond}</td>
								</tr>
								<tr>
									<td>柱镜轴位A2</td>
									<td>${visioncheck.leftCylinderAxialSecond}</td>
									<td>${visioncheck.rightCylinderAxialSecond}</td>
								</tr>
								<tr>
									<td>球镜S/DS3</td>
									<td>${visioncheck.leftEyeSphericalLensThird}</td>
									<td>${visioncheck.rightEyeSphericalLensThird}</td>
								</tr>
								<tr>
									<td>柱镜C/DC3</td>
									<td>${visioncheck.leftCylinderThird}</td>
									<td>${visioncheck.rightCylinderThird}</td>
								</tr>
								<tr>
									<td>柱镜轴位A3</td>
									<td>${visioncheck.leftCylinderAxialThird}</td>
									<td>${visioncheck.rightCylinderAxialThird}</td>
								</tr>
								<tr>
									<td>平均值</td>
									<td>${visioncheck.refractionLeftEyeAverages}</td>
									<td>${visioncheck.refractionRightEyeAverages}</td>
								</tr>
								<tr>
									<td>检影验光</td>
									<td>${visioncheck.leftEyeRetinoscopy}</td>
									<td>${visioncheck.rightEyeRetinoscopy}</td>
								</tr>
								<tr>
									<td>近视力</td>
									<td>${visioncheck.leftEyeNearVision}</td>
									<td>${visioncheck.rightEyeNearVision}</td>
								</tr>
								<tr>
									<td>戴镜度数</td>
									<td>${visioncheck.leftEyeSpectaclesDegrees}</td>
									<td>${visioncheck.rightEyeSpectaclesDegrees}</td>
								</tr>
								<tr>
									<td>矫正视力</td>
									<td>${visioncheck.leftEyeVisionCorrection}</td>
									<td>${visioncheck.rightEyeVisionCorrection}</td>
								</tr>
								<tr>
									<td>眼轴前房长度</td>
									<td>${visioncheck.leftAnteriorAxialLength}</td>
									<td>${visioncheck.rightAnteriorAxialLength}</td>
								</tr>
							</tbody>
						</table>
							</div>
						</div>
					</div>
					<div class="tab-pane" role="tabpanel" id="yanya">
						<div class="context">
							<div class="table-responsive">
						<table class="table table-hover table-bordered big-data table-striped">
							<colgroup>
								<col style="width:200px;">
								<col style="">
								<col style="">
							</colgroup>
							<tbody>
								<tr>
									<td>检测设备</td>
									<td colspan="2">${visioncheck.ocularInspectionEquipment}</td>
								</tr>
								<tr>
									<td>检测序列号</td>
									<td colspan="2">${visioncheck.iopcheckTheSerialNumber}</td>
								</tr>
								<tr>
									<td>检测时间</td>
									<td colspan="2">${visioncheck.ocularInspectionDetectionTime}</td>
								</tr>
								<tr>
									<td></td>
									<td><b>左眼</b>
									</td>
									<td><b>右眼</b>
									</td>
								</tr>

								<tr>
									<td>第一次</td>
									<td>${visioncheck.leftEyeFirstIop}</td>
									<td>${visioncheck.rightEyeFirstIop}</td>
								</tr>
								<tr>
									<td>第二次</td>
									<td>${visioncheck.leftEyeSecondIop}</td>
									<td>${visioncheck.rightEyeSecondIop}</td>
								</tr>
								<tr>
									<td>第三次</td>
									<td>${visioncheck.leftEyeThirdIop}</td>
									<td>${visioncheck.rightEyeThirdIop}</td>
								</tr>
								<tr>
									<td>第四次</td>
									<td>${visioncheck.leftEyeFourthIop}</td>
									<td>${visioncheck.rightEyeFourthIop}</td>
								</tr>
								<tr>
									<td>平均值</td>
									<td>${visioncheck.leftEyeTheMeanIop}</td>
									<td>${visioncheck.rightEyeTheMeanIop}</td>
								</tr>
								<tr>
									<td>双眼视觉功能</td>
									<td colspan="2">${visioncheck.binocularVision}</td>
								</tr>

							</tbody>
						</table>
							</div>
						</div>
					</div>
					<div class="tab-pane" role="tabpanel" id="other">
						<div class="context">
							<div class="table-responsive">
						<table class="table table-hover table-bordered big-data table-striped">
							<colgroup>
								<col style="width:200px;">
								<col style="">
								<col style="">
							</colgroup>
							<thead>
								<tr>
									<th></th>
									<th>左眼</th>
									<th>右眼</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>眼位</td>
									<td>${visioncheck.leftEyePosition}</td>
									<td>${visioncheck.rightEyePosition}</td>
								</tr>
								<tr>
									<td>眼肌</td>
									<td>${visioncheck.leftEyeMuscle}</td>
									<td>${visioncheck.rightEyeMuscle}</td>
								</tr>
								<tr>
									<td>眼睑</td>
									<td>${visioncheck.leftEyelid}</td>
									<td>${visioncheck.rightEyelid}</td>
								</tr>
								<tr>
									<td>泪器</td>
									<td>${visioncheck.leftEyeLacrimalApparatus}</td>
									<td>${visioncheck.rightEyeLacrimalApparatus}</td>
								</tr>
								<tr>
									<td>结膜</td>
									<td>${visioncheck.leftEyeConjunctiva}</td>
									<td>${visioncheck.rightEyeConjunctiva}</td>
								</tr>
								<tr>
									<td>巩膜</td>
									<td>${visioncheck.leftEyeSclera}</td>
									<td>${visioncheck.rightEyeSclera}</td>
								</tr>
								<tr>
									<td>瞳孔</td>
									<td>${visioncheck.leftEyePupil}</td>
									<td>${visioncheck.rightEyePupil}</td>
								</tr>
								<tr>
									<td>角膜</td>
									<td>${visioncheck.leftEyeCornea}</td>
									<td>${visioncheck.rightEyeCornea}</td>
								</tr>
								<tr>
									<td>前房</td>
									<td>${visioncheck.leftEyeAnteriorChamber}</td>
									<td>${visioncheck.rightEyeAnteriorChamber}</td>
								</tr>
								<tr>
									<td>晶体</td>
									<td>${visioncheck.leftEyeCrystal}</td>
									<td>${visioncheck.rightEyeCrystal}</td>
								</tr>
								<tr>
									<td>眼底</td>
									<td>${visioncheck.leftEyeFundus}</td>
									<td>${visioncheck.rightEyeFundus}</td>
								</tr>
								<tr>
									<td>其他</td>
									<td>${visioncheck.leftEyeOther}</td>
									<td>${visioncheck.rightEyeOther}</td>
								</tr>

							</tbody>
						</table>
							</div>
						</div>
					</div>
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
		$(function() {
			$("#docs-tab a").click(function(e) {
				$(this).tab('show');
				var height = document.getElementById("page-container").scrollHeight;
				parent.AdjustIframeHeight(height);
			});
		});
	</script>
</body>
</html>