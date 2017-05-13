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
				<div class="title">视觉健康档案最新信息</div>

				<div class="context">
					<div class="table-responsive">
						<table class="table table-hover table-bordered big-data table-striped">
								<tr style="text-align: center;">
									<td colspan="2" style="background-color: #CCC0DA;">
										<label>基本情况</label>
									</td>
									<td colspan="3" style="background-color: #8DB4E3;">
										<label>屈光检查</label>
									</td>
									<td colspan="3" style="background-color: #C5D9F1;">
										<label>视力检查</label>
									</td>
									<td colspan="3" style="background-color: #8DB4E3;">
										<label>其他检查</label>
									</td>
								</tr>
								<tr>
									<td>
										<label>出生时情况</label>
									</td>
									<td>${visioncheck.birthSituation}</td>
									<td>
										<label>检测时间</label>
									</td>
									<td colspan="2" style="background-color: #D9D9D9;">
										${visioncheck.refractionDetectionTime}
									</td>
									<td>
										<label>检测设备</label>
									</td>
									<td>
										<label>检测序列</label>
									</td>
									<td>
										<label>检测者</label>
									</td>
									<td>
										<label>检测时间</label>
									</td>
									<td colspan="2" style="background-color: #D9D9D9;">
										/
									</td>
								</tr>
								<tr>
									<td>
										<label>600度以上近视亲戚</label>
									</td>
									<td>${visioncheck.moreThan600degreesOfMyopiaRelatives}</td>
									<td>
										<label>检测设备</label>
									</td>
									<td>
										<label>检测序列</label>
									</td>
									<td>
										<label>检测者</label>
									</td>
									<td>${visioncheck.visualIinspectionInspectionEquipment}</td>
									<td>${visioncheck.visualInspectionSerialNumber}</td>
									<td>${visioncheck.visualInspectionExaminer}</td>
									<td>
										<label>检测设备</label>
									</td>
									<td>
										<label>检测序列</label>
									</td>
									<td>
										<label>检测者</label>
									</td>
								</tr>
								<tr>
									<td>
										<label>录入时间</label>
									</td>
									<td>${visioncheck.recordTime}</td>
									<td>${visioncheck.refractionInspectionEquipment}</td>
									<td>${visioncheck.refractiveCheckTheSerialNumber}</td>
									<td>${visioncheck.refractionDetectionExaminer}</td>
									<td>
										<label>检测时间</label>
									</td>
									<td colspan="2" style="background-color: #D9D9D9;">
										${visioncheck.visualInspectionDetectionTime}
									</td>
									<td>/</td>
									<td>/</td>
									<td>/</td>
								</tr>
								<tr>
									<td>
										<label>录入序列</label>
									</td>
									<td>${visioncheck.checkSequence}</td>
									<td>
										<label>参考VD</label>
									</td>
									<td>
										<label>参考CYL</label>
									</td>
									<td>
										<label>瞳距PD</label>
									</td>
									<td></td>
									<td><label>左眼</label></td>
									<td><label>右眼</label></td>
									<td></td>
									<td><label>左眼</label></td>
									<td><label>右眼</label></td>
								</tr>
								<tr>
									<td>
										<label>录入者</label>
									</td>
									<td>${visioncheck.recorder}</td>
									<td style="text-align: center;">${visioncheck.refractionDetectionVd}</td>
									<td style="text-align: center;">${visioncheck.refractionDetectionCyl}</td>
									<td style="text-align: center;">${visioncheck.refractionDetectionIpd}</td>
									<td><label>环境</label></td>
									<td>${visioncheck.leftEyeDetectionEnvironment}</td>
									<td>${visioncheck.rightEyeDetectionEnvironment}</td>
									<td><label>眼位</label></td>
									<td>${visioncheck.leftEyePosition}</td>
									<td>${visioncheck.rightEyePosition}</td>
								</tr>
								<tr>
									<td>
										<label>屈光矫正方法</label>
									</td>
									<td>${visioncheck.refractiveCorrectionMethod}</td>
									<td></td>
									<td><label>左眼</label></td>
									<td><label>右眼</label></td>
									<td><label>小数值</label></td>
									<td>${visioncheck.leftEyeLittleValue}</td>
									<td>${visioncheck.rightEyeLittleValue}</td>
									<td><label>眼肌</label></td>
									<td>${visioncheck.leftEyeMuscle}</td>
									<td>${visioncheck.rightEyeMuscle}</td>
								</tr>
								<tr>
									<td>
										<label>年检验次数</label>
									</td>
									<td>${visioncheck.theNumberOfAnnualEyeCheck}</td>
									<td><label>球镜S/DS1</label></td>
									<td>${visioncheck.leftEyeSphericalLens}</td>
									<td>${visioncheck.rightEyeSphericalLens}</td>
									<td><label>视功能</label></td>
									<td>${visioncheck.leftEyeVisualFunction}</td>
									<td>${visioncheck.rightEyeVisualFunction}</td>
									<td><label>眼睑</label></td>
									<td>${visioncheck.leftEyelid}</td>
									<td>${visioncheck.rightEyelid}</td>
								</tr>
								<tr>
									<td>
										<label>每天电子产品使用时间</label>
									</td>
									<td>${visioncheck.everyTimeTheElectronicProducts}</td>
									<td><label>柱镜C/DC1</label></td>
									<td>${visioncheck.leftCylinder}</td>
									<td>${visioncheck.rightCylinder}</td>
									<td><label>速度</label></td>
									<td>${visioncheck.leftEyeSpeed}</td>
									<td>${visioncheck.rightEyeSpeed}</td>
									<td><label>泪器</label></td>
									<td>${visioncheck.leftEyeLacrimalApparatus}</td>
									<td>${visioncheck.rightEyeLacrimalApparatus}</td>
								</tr>
								<tr>
									<td>
										<label>连续视近休息时间</label>
									</td>
									<td>${visioncheck.continuousAsTheRecentBreak}</td>
									<td><label>柱镜轴位A1</label></td>
									<td>${visioncheck.leftCylinderAxial}</td>
									<td>${visioncheck.rightCylinderAxial}</td>
									<td><label>环境</label></td>
									<td>${visioncheck.leftEyeDetectionEnvironmentSecond}</td>
									<td>${visioncheck.rightEyeDetectionEnvironmentSecond}</td>
									<td><label>结膜</label></td>
									<td>${visioncheck.leftEyeConjunctiva}</td>
									<td>${visioncheck.rightEyeConjunctiva}</td>
								</tr>
								<tr>
									<td>
										<label>每天户外活动时间</label>
									</td>
									<td>${visioncheck.everyTimeOutdoors}</td>
									<td><label>球镜S/DS2</label></td>
									<td>${visioncheck.leftEyeSphericalLensSecond}</td>
									<td>${visioncheck.rightEyeSphericalLensSecond}</td>
									<td><label>小数值</label></td>
									<td>${visioncheck.leftEyeLittleValueSecond}</td>
									<td>${visioncheck.rightEyeLittleValueSecond}</td>
									<td><label>巩膜</label></td>
									<td>${visioncheck.leftEyeSclera}</td>
									<td>${visioncheck.rightEyeSclera}</td>
								</tr>
								<tr>
									<td>
										<label>饮食习惯</label>
									</td>
									<td>${visioncheck.diet}</td>
									<td><label>柱镜C/DC2</label></td>
									<td>${visioncheck.leftCylinderSecond}</td>
									<td>${visioncheck.rightCylinderSecond}</td>
									<td><label>视功能</label></td>
									<td>${visioncheck.leftEyeVisualFunctionSecond}</td>
									<td>${visioncheck.rightEyeVisualFunctionSecond}</td>
									<td><label>瞳孔</label></td>
									<td>${visioncheck.leftEyePupil}</td>
									<td>${visioncheck.rightEyePupil}</td>
								</tr>
								<tr>
									<td>
										<label>每天喝酒情况</label>
									</td>
									<td>${visioncheck.theDailyDrinking}</td>
									<td><label>柱镜轴位A2</label></td>
									<td>${visioncheck.leftCylinderAxialSecond}</td>
									<td>${visioncheck.rightCylinderAxialSecond}</td>
									<td><label>速度</label></td>
									<td>${visioncheck.leftEyeSpeedSecond}</td>
									<td>${visioncheck.rightEyeSpeedSecond}</td>
									<td><label>角膜</label></td>
									<td>${visioncheck.leftEyeCornea}</td>
									<td>${visioncheck.rightEyeCornea}</td>
								</tr>
								<tr>
									<td>
										<label>药物过敏情况</label>
									</td>
									<td>${visioncheck.drugAllergies}</td>
									<td><label>球镜S/DS3</label></td>
									<td>${visioncheck.leftEyeSphericalLensThird}</td>
									<td>${visioncheck.rightEyeSphericalLensThird}</td>
									<td colspan="3" style="text-align:center;background-color: #8DB4E3;">
										<label>眼压检查</label>
									</td>
									<td><label>前房</label></td>
									<td>${visioncheck.leftEyeAnteriorChamber}</td>
									<td>${visioncheck.rightEyeAnteriorChamber}</td>
								</tr>
								<tr>
									<td>既往病史</label>
									</td>
									<td>${visioncheck.medicalHistory}</td>
									<td><label>柱镜C/DC3</label></td>
									<td>${visioncheck.leftCylinderThird}</td>
									<td>${visioncheck.rightCylinderThird}</td>
									<td>
										<label>检测时间</label>
									</td>
									<td colspan="2" style="background-color: #D9D9D9;">
										${visioncheck.ocularInspectionDetectionTime}
									</td>
									<td><label>晶体</label></td>
									<td>${visioncheck.leftEyeCrystal}</td>
									<td>${visioncheck.rightEyeCrystal}</td>
								</tr>
								<tr>
									<td colspan="2" style="text-align:center;background-color: #8DB4E3;">
										<label>双眼视觉（技巧）功能</label>
									</td>
									<td><label>柱镜轴位A3</label></td>
									<td>${visioncheck.leftCylinderAxialThird}</td>
									<td>${visioncheck.rightCylinderAxialThird}</td>
									<td>
										<label>检测设备</label>
									</td>
									<td>
										<label>检测序列</label>
									</td>
									<td>
										<label>检测者</label>
									</td>
									<td><label>眼底</label></td>
									<td>${visioncheck.leftEyeFundus}</td>
									<td>${visioncheck.rightEyeFundus}</td>
								</tr>
								<tr>
									<td>
										<label>检测时间</label>
									</td>
									<td style="background-color: #D9D9D9;">
										/
									</td>
									<td><label>平均值</label></td>
									<td>${visioncheck.refractionLeftEyeAverages}</td>
									<td>${visioncheck.refractionRightEyeAverages}</td>
									<td>${visioncheck.ocularInspectionEquipment}</td>
									<td>${visioncheck.iopcheckTheSerialNumber}</td>
									<td>/</td>
									<td><label>其他</label></td>
									<td>${visioncheck.leftEyeOther}</td>
									<td>${visioncheck.rightEyeOther}</td>
								</tr>
								<tr>
									<td>
										<label>跟随</label>
									</td>
									<td>/</td>
									<td><label>检影验光</label></td>
									<td>${visioncheck.leftEyeRetinoscopy}</td>
									<td>${visioncheck.rightEyeRetinoscopy}</td>
									<td></td>
									<td><label>左眼</label></td>
									<td><label>右眼</label></td>
									<td colspan="3" style="text-align:center; background-color: #CCC0DA;">
										<label>诊断报告</label>
									</td>
								</tr>
								<tr>
									<td>
										<label>扫视</label>
									</td>
									<td>/</td>
									<td><label>近视力</label></td>
									<td>${visioncheck.leftEyeRetinoscopy}</td>
									<td>${visioncheck.rightEyeRetinoscopy}</td>
									<td><label>第一次</label></td>
									<td>${visioncheck.leftEyeFirstIop}</td>
									<td>${visioncheck.rightEyeFirstIop}</td>
									<td><label>诊断时间</label></td>
									<td colspan="2" style="background-color: #D9D9D9;"></td>
								</tr>
								<tr>
									<td>
										<label>记忆</label>
									</td>
									<td>/</td>
									<td><label>戴镜度数</label></td>
									<td>${visioncheck.leftEyeSpectaclesDegrees}</td>
									<td>${visioncheck.rightEyeSpectaclesDegrees}</td>
									<td><label>第二次</label></td>
									<td>${visioncheck.leftEyeSecondIop}</td>
									<td>${visioncheck.rightEyeSecondIop}</td>
									<td colspan="3" rowspan="3"></td>
								</tr>
								<tr>
									<td colspan="2" rowspan="3"></td>
									<td><label>矫正视力</label></td>
									<td>${visioncheck.leftEyeVisionCorrection}</td>
									<td>${visioncheck.rightEyeVisionCorrection}</td>
									<td><label>第三次</label></td>
									<td>${visioncheck.leftEyeThirdIop}</td>
									<td>${visioncheck.rightEyeThirdIop}</td>
								</tr>
								<tr>
									<td><label>眼轴前房长度</label></td>
									<td>${visioncheck.leftAnteriorAxialLength}</td>
									<td>${visioncheck.rightAnteriorAxialLength}</td>
									<td><label>第四次</label></td>
									<td>${visioncheck.leftEyeFourthIop}</td>
									<td>${visioncheck.rightEyeFourthIop}</td>
								</tr>
								<tr>
									<td colspan="3"></td>
									<td><label>平均值</label></td>
									<td>${visioncheck.leftEyeTheMeanIop}</td>
									<td>${visioncheck.rightEyeTheMeanIop}</td>
									<td><label>医生签名</label></td>
									<td colspan="2"></td>
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
</body>
</html>