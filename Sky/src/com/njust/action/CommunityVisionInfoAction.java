package com.njust.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.njust.domain.Assessments;
import com.njust.domain.Authorizerelation;
import com.njust.domain.Schoolinfo;
import com.njust.domain.Userinfo;
import com.njust.domain.Userrole;
import com.njust.domain.Visioncheck;
import com.njust.service.AssessmentsService;
import com.njust.service.AuthorizerelationService;
import com.njust.service.SchoolinfoService;
import com.njust.service.UserinfoService;
import com.njust.service.UserroleService;
import com.njust.service.VisioncheckService;
import com.njust.servlet.getMD5;
import com.njust.servlet.getMD5_2;
import com.njust.servlet.getProperDate;
import com.njust.tag.JsonUtil;
import com.njust.tag.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("rawtypes")
public class CommunityVisionInfoAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private HttpServletRequest req;

	private Integer visionalert;
	
	private Integer tableId;
	private String username;
	private String recorder;
	private String recordTime;
	private String refractiveCorrectionMethod;
	private String theNumberOfAnnualEyeCheck;
	private String birthSituation;
	private String moreThan600degreesOfMyopiaRelatives;
	private String drugAllergies;
	private String medicalHistory;
	private String everyTimeTheElectronicProducts;
	private String continuousAsTheRecentBreak;
	private String diet;
	private String theDailyDrinking;
	private String everyTimeOutdoors;
	private String checkSequence;
	private String checkTime;
	private String doublecare;		//新增双倍关怀计划 2016-1-5
	private String visionlevel;		//新增视觉等级 2015-1-12
	private String companion;
	private String checkTheDataExaminer;
	private String visualIinspectionInspectionEquipment;
	private String visualInspectionSerialNumber;
	private String visualInspectionDetectionTime;
	private String leftEyeDetectionEnvironment;
	private String leftEyeLittleValue;
	private String leftEyeVisualFunction;
	private String leftEyeSpeed;
	private String leftEyeDetectionEnvironmentSecond;
	private String leftEyeLittleValueSecond;
	private String leftEyeVisualFunctionSecond;
	private String leftEyeSpeedSecond;
	private String rightEyeDetectionEnvironment;
	private String rightEyeLittleValue;
	private String rightEyeVisualFunction;
	private String rightEyeSpeed;
	private String rightEyeDetectionEnvironmentSecond;
	private String rightEyeLittleValueSecond;
	private String rightEyeVisualFunctionSecond;
	private String rightEyeSpeedSecond;
	private String visualInspectionExaminer;
	private String refractionInspectionEquipment;
	private String refractiveCheckTheSerialNumber;
	private String refractionDetectionTime;
	private String refractionDetectionVd;
	private String refractionDetectionCyl;
	private String refractionDetectionExaminer;
	private String refractionDetectionIpd;
	private String leftEyeSphericalLens;
	private String leftCylinder;
	private String leftCylinderAxial;
	private String leftEyeSphericalLensSecond;
	private String leftCylinderSecond;
	private String leftCylinderAxialSecond;
	private String leftEyeSphericalLensThird;
	private String leftCylinderThird;
	private String leftCylinderAxialThird;
	private String refractionLeftEyeAverages;
	private String leftEyeRetinoscopy;
	private String leftEyeNearVision;
	private String leftEyeSpectaclesDegrees;
	private String leftEyeVisionCorrection;
	private String leftAnteriorAxialLength;
	private String rightEyeSphericalLens;
	private String rightCylinder;
	private String rightCylinderAxial;
	private String rightEyeSphericalLensSecond;
	private String rightCylinderSecond;
	private String rightCylinderAxialSecond;
	private String rightEyeSphericalLensThird;
	private String rightCylinderThird;
	private String rightCylinderAxialThird;
	private String refractionRightEyeAverages;
	private String rightEyeRetinoscopy;
	private String rightEyeNearVision;
	private String rightEyeSpectaclesDegrees;
	private String rightEyeVisionCorrection;
	private String rightAnteriorAxialLength;
	private String ocularInspectionEquipment;
	private String iopcheckTheSerialNumber;
	private String ocularInspectionDetectionTime;
	private String leftEyeFirstIop;
	private String rightEyeFirstIop;
	private String leftEyeSecondIop;
	private String rightEyeSecondIop;
	private String leftEyeThirdIop;
	private String rightEyeThirdIop;
	private String leftEyeFourthIop;
	private String rightEyeFourthIop;
	private String leftEyeTheMeanIop;
	private String rightEyeTheMeanIop;
	private String binocularVision;
	private String leftEyePosition;
	private String rightEyePosition;
	private String leftEyeMuscle;
	private String rightEyeMuscle;
	private String leftEyelid;
	private String rightEyelid;
	private String leftEyeLacrimalApparatus;
	private String rightEyeLacrimalApparatus;
	private String leftEyeConjunctiva;
	private String rightEyeConjunctiva;
	private String leftEyeSclera;
	private String rightEyeSclera;
	private String leftEyePupil;
	private String rightEyePupil;
	private String leftEyeCornea;
	private String rightEyeCornea;
	private String leftEyeAnteriorChamber;
	private String rightEyeAnteriorChamber;
	private String leftEyeCrystal;
	private String rightEyeCrystal;
	private String leftEyeFundus;
	private String rightEyeFundus;
	private String leftEyeOther;
	private String rightEyeOther;

	private String stuResult; // 反馈给ajax的json对象---用于list
	private List list,errorList,errorReason,similarList,similarReason;	//错误列表，错误原因列表，相似列表，相似原因列表
	private PageBean pageBean;
	private VisioncheckService visioncheckService;
	private int page; // 第几页
	private String msg;
	private File uploadfile;// 上传的文件
	private int totalrows;	//用于查询当前上传进度
	private int currentrows=4;
	private int actualrows;

	// 导入文件新add
	private String password;
	private String level;
	private Boolean enabled;
	private Boolean accountNonExpired;
	private Boolean credentialsNonExpired;
	private Boolean accountNonLocked;
	private String realname;
	private String gender;
	private String age;
	private String address;
	private String phone;
	private String email;
	private String guardianName;
	private int school;
	private int manageCommunity;
	private String grade;
	private String stuClass;
	private String idNumber;
	private String nation;
	private String height;
	private String weight;

	private UserinfoService userinfoService;
	private AssessmentsService assessmentsService;
	private AuthorizerelationService authorizerelationService;
	private UserroleService userroleService;
	private SchoolinfoService schoolinfoService;

	public Integer getVisionalert() {
		return visionalert;
	}

	public void setVisionalert(Integer visionalert) {
		this.visionalert = visionalert;
	}

	public File getUploadfile() {
		return uploadfile;
	}

	public void setUploadfile(File uploadfile) {
		this.uploadfile = uploadfile;
	}

	//public AssessmentsService getAssessmentsService() {
	//	return assessmentsService;
	//}

	public void setAssessmentsService(AssessmentsService assessmentsService) {
		this.assessmentsService = assessmentsService;
	}

	//public AuthorizerelationService getAuthorizerelationService() {
	//	return authorizerelationService;
	//}

	public void setAuthorizerelationService(AuthorizerelationService authorizerelationService) {
		this.authorizerelationService = authorizerelationService;
	}

	public void setUserroleService(UserroleService userroleService) {
		this.userroleService = userroleService;
	}

	public void setSchoolinfoService(SchoolinfoService schoolinfoService) {
		this.schoolinfoService = schoolinfoService;
	}
	
	public Integer getTableId() {
		return tableId;
	}

	public void setTableId(Integer tableId) {
		this.tableId = tableId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getRecorder() {
		return recorder;
	}

	public void setRecorder(String recorder) {
		this.recorder = recorder;
	}

	public String getRecordTime() {
		return recordTime;
	}

	public void setRecordTime(String recordTime) {
		this.recordTime = recordTime;
	}

	public String getRefractiveCorrectionMethod() {
		return refractiveCorrectionMethod;
	}

	public void setRefractiveCorrectionMethod(String refractiveCorrectionMethod) {
		this.refractiveCorrectionMethod = refractiveCorrectionMethod;
	}

	public String getTheNumberOfAnnualEyeCheck() {
		return theNumberOfAnnualEyeCheck;
	}

	public void setTheNumberOfAnnualEyeCheck(String theNumberOfAnnualEyeCheck) {
		this.theNumberOfAnnualEyeCheck = theNumberOfAnnualEyeCheck;
	}

	public String getBirthSituation() {
		return birthSituation;
	}

	public void setBirthSituation(String birthSituation) {
		this.birthSituation = birthSituation;
	}

	public String getMoreThan600degreesOfMyopiaRelatives() {
		return moreThan600degreesOfMyopiaRelatives;
	}

	public void setMoreThan600degreesOfMyopiaRelatives(String moreThan600degreesOfMyopiaRelatives) {
		this.moreThan600degreesOfMyopiaRelatives = moreThan600degreesOfMyopiaRelatives;
	}

	public String getDrugAllergies() {
		return drugAllergies;
	}

	public void setDrugAllergies(String drugAllergies) {
		this.drugAllergies = drugAllergies;
	}

	public String getMedicalHistory() {
		return medicalHistory;
	}

	public void setMedicalHistory(String medicalHistory) {
		this.medicalHistory = medicalHistory;
	}

	public String getEveryTimeTheElectronicProducts() {
		return everyTimeTheElectronicProducts;
	}

	public void setEveryTimeTheElectronicProducts(String everyTimeTheElectronicProducts) {
		this.everyTimeTheElectronicProducts = everyTimeTheElectronicProducts;
	}

	public String getContinuousAsTheRecentBreak() {
		return continuousAsTheRecentBreak;
	}

	public void setContinuousAsTheRecentBreak(String continuousAsTheRecentBreak) {
		this.continuousAsTheRecentBreak = continuousAsTheRecentBreak;
	}

	public String getDiet() {
		return diet;
	}

	public void setDiet(String diet) {
		this.diet = diet;
	}

	public String getTheDailyDrinking() {
		return theDailyDrinking;
	}

	public void setTheDailyDrinking(String theDailyDrinking) {
		this.theDailyDrinking = theDailyDrinking;
	}

	public String getEveryTimeOutdoors() {
		return everyTimeOutdoors;
	}

	public void setEveryTimeOutdoors(String everyTimeOutdoors) {
		this.everyTimeOutdoors = everyTimeOutdoors;
	}

	public String getCheckSequence() {
		return checkSequence;
	}

	public void setCheckSequence(String checkSequence) {
		this.checkSequence = checkSequence;
	}

	public String getCheckTime() {
		return checkTime;
	}

	public void setCheckTime(String checkTime) {
		this.checkTime = checkTime;
	}
	
	public String getDoublecare() {
		return this.doublecare;
	}
	public void setDoublecare(String doublecare) {
		this.doublecare = doublecare;
	}

	public String getVisionlevel() {
		return this.visionlevel;
	}
	public void setVisionlevel(String visionlevel) {
		this.visionlevel = visionlevel;
	}
	
	public String getCompanion() {
		return companion;
	}

	public void setCompanion(String companion) {
		this.companion = companion;
	}

	public String getCheckTheDataExaminer() {
		return checkTheDataExaminer;
	}

	public void setCheckTheDataExaminer(String checkTheDataExaminer) {
		this.checkTheDataExaminer = checkTheDataExaminer;
	}

	public String getVisualIinspectionInspectionEquipment() {
		return visualIinspectionInspectionEquipment;
	}

	public void setVisualIinspectionInspectionEquipment(String visualIinspectionInspectionEquipment) {
		this.visualIinspectionInspectionEquipment = visualIinspectionInspectionEquipment;
	}

	public String getVisualInspectionSerialNumber() {
		return visualInspectionSerialNumber;
	}

	public void setVisualInspectionSerialNumber(String visualInspectionSerialNumber) {
		this.visualInspectionSerialNumber = visualInspectionSerialNumber;
	}

	public String getVisualInspectionDetectionTime() {
		return visualInspectionDetectionTime;
	}

	public void setVisualInspectionDetectionTime(String visualInspectionDetectionTime) {
		this.visualInspectionDetectionTime = visualInspectionDetectionTime;
	}

	public String getLeftEyeDetectionEnvironment() {
		return leftEyeDetectionEnvironment;
	}

	public void setLeftEyeDetectionEnvironment(String leftEyeDetectionEnvironment) {
		this.leftEyeDetectionEnvironment = leftEyeDetectionEnvironment;
	}

	public String getLeftEyeLittleValue() {
		return leftEyeLittleValue;
	}

	public void setLeftEyeLittleValue(String leftEyeLittleValue) {
		this.leftEyeLittleValue = leftEyeLittleValue;
	}

	public String getLeftEyeVisualFunction() {
		return leftEyeVisualFunction;
	}

	public void setLeftEyeVisualFunction(String leftEyeVisualFunction) {
		this.leftEyeVisualFunction = leftEyeVisualFunction;
	}

	public String getLeftEyeSpeed() {
		return leftEyeSpeed;
	}

	public void setLeftEyeSpeed(String leftEyeSpeed) {
		this.leftEyeSpeed = leftEyeSpeed;
	}

	public String getLeftEyeDetectionEnvironmentSecond() {
		return leftEyeDetectionEnvironmentSecond;
	}

	public void setLeftEyeDetectionEnvironmentSecond(String leftEyeDetectionEnvironmentSecond) {
		this.leftEyeDetectionEnvironmentSecond = leftEyeDetectionEnvironmentSecond;
	}

	public String getLeftEyeLittleValueSecond() {
		return leftEyeLittleValueSecond;
	}

	public void setLeftEyeLittleValueSecond(String leftEyeLittleValueSecond) {
		this.leftEyeLittleValueSecond = leftEyeLittleValueSecond;
	}

	public String getLeftEyeVisualFunctionSecond() {
		return leftEyeVisualFunctionSecond;
	}

	public void setLeftEyeVisualFunctionSecond(String leftEyeVisualFunctionSecond) {
		this.leftEyeVisualFunctionSecond = leftEyeVisualFunctionSecond;
	}

	public String getLeftEyeSpeedSecond() {
		return leftEyeSpeedSecond;
	}

	public void setLeftEyeSpeedSecond(String leftEyeSpeedSecond) {
		this.leftEyeSpeedSecond = leftEyeSpeedSecond;
	}

	public String getRightEyeDetectionEnvironment() {
		return rightEyeDetectionEnvironment;
	}

	public void setRightEyeDetectionEnvironment(String rightEyeDetectionEnvironment) {
		this.rightEyeDetectionEnvironment = rightEyeDetectionEnvironment;
	}

	public String getRightEyeLittleValue() {
		return rightEyeLittleValue;
	}

	public void setRightEyeLittleValue(String rightEyeLittleValue) {
		this.rightEyeLittleValue = rightEyeLittleValue;
	}

	public String getRightEyeVisualFunction() {
		return rightEyeVisualFunction;
	}

	public void setRightEyeVisualFunction(String rightEyeVisualFunction) {
		this.rightEyeVisualFunction = rightEyeVisualFunction;
	}

	public String getRightEyeSpeed() {
		return rightEyeSpeed;
	}

	public void setRightEyeSpeed(String rightEyeSpeed) {
		this.rightEyeSpeed = rightEyeSpeed;
	}

	public String getRightEyeDetectionEnvironmentSecond() {
		return rightEyeDetectionEnvironmentSecond;
	}

	public void setRightEyeDetectionEnvironmentSecond(String rightEyeDetectionEnvironmentSecond) {
		this.rightEyeDetectionEnvironmentSecond = rightEyeDetectionEnvironmentSecond;
	}

	public String getRightEyeLittleValueSecond() {
		return rightEyeLittleValueSecond;
	}

	public void setRightEyeLittleValueSecond(String rightEyeLittleValueSecond) {
		this.rightEyeLittleValueSecond = rightEyeLittleValueSecond;
	}

	public String getRightEyeVisualFunctionSecond() {
		return rightEyeVisualFunctionSecond;
	}

	public void setRightEyeVisualFunctionSecond(String rightEyeVisualFunctionSecond) {
		this.rightEyeVisualFunctionSecond = rightEyeVisualFunctionSecond;
	}

	public String getRightEyeSpeedSecond() {
		return rightEyeSpeedSecond;
	}

	public void setRightEyeSpeedSecond(String rightEyeSpeedSecond) {
		this.rightEyeSpeedSecond = rightEyeSpeedSecond;
	}

	public String getVisualInspectionExaminer() {
		return visualInspectionExaminer;
	}

	public void setVisualInspectionExaminer(String visualInspectionExaminer) {
		this.visualInspectionExaminer = visualInspectionExaminer;
	}

	public String getRefractionInspectionEquipment() {
		return refractionInspectionEquipment;
	}

	public void setRefractionInspectionEquipment(String refractionInspectionEquipment) {
		this.refractionInspectionEquipment = refractionInspectionEquipment;
	}

	public String getRefractiveCheckTheSerialNumber() {
		return refractiveCheckTheSerialNumber;
	}

	public void setRefractiveCheckTheSerialNumber(String refractiveCheckTheSerialNumber) {
		this.refractiveCheckTheSerialNumber = refractiveCheckTheSerialNumber;
	}

	public String getRefractionDetectionTime() {
		return refractionDetectionTime;
	}

	public void setRefractionDetectionTime(String refractionDetectionTime) {
		this.refractionDetectionTime = refractionDetectionTime;
	}

	public String getRefractionDetectionVd() {
		return refractionDetectionVd;
	}

	public void setRefractionDetectionVd(String refractionDetectionVd) {
		this.refractionDetectionVd = refractionDetectionVd;
	}

	public String getRefractionDetectionCyl() {
		return refractionDetectionCyl;
	}

	public void setRefractionDetectionCyl(String refractionDetectionCyl) {
		this.refractionDetectionCyl = refractionDetectionCyl;
	}

	public String getRefractionDetectionExaminer() {
		return refractionDetectionExaminer;
	}

	public void setRefractionDetectionExaminer(String refractionDetectionExaminer) {
		this.refractionDetectionExaminer = refractionDetectionExaminer;
	}

	public String getRefractionDetectionIpd() {
		return refractionDetectionIpd;
	}

	public void setRefractionDetectionIpd(String refractionDetectionIpd) {
		this.refractionDetectionIpd = refractionDetectionIpd;
	}

	public String getLeftEyeSphericalLens() {
		return leftEyeSphericalLens;
	}

	public void setLeftEyeSphericalLens(String leftEyeSphericalLens) {
		this.leftEyeSphericalLens = leftEyeSphericalLens;
	}

	public String getLeftCylinder() {
		return leftCylinder;
	}

	public void setLeftCylinder(String leftCylinder) {
		this.leftCylinder = leftCylinder;
	}

	public String getLeftCylinderAxial() {
		return leftCylinderAxial;
	}

	public void setLeftCylinderAxial(String leftCylinderAxial) {
		this.leftCylinderAxial = leftCylinderAxial;
	}

	public String getLeftEyeSphericalLensSecond() {
		return leftEyeSphericalLensSecond;
	}

	public void setLeftEyeSphericalLensSecond(String leftEyeSphericalLensSecond) {
		this.leftEyeSphericalLensSecond = leftEyeSphericalLensSecond;
	}

	public String getLeftCylinderSecond() {
		return leftCylinderSecond;
	}

	public void setLeftCylinderSecond(String leftCylinderSecond) {
		this.leftCylinderSecond = leftCylinderSecond;
	}

	public String getLeftCylinderAxialSecond() {
		return leftCylinderAxialSecond;
	}

	public void setLeftCylinderAxialSecond(String leftCylinderAxialSecond) {
		this.leftCylinderAxialSecond = leftCylinderAxialSecond;
	}

	public String getLeftEyeSphericalLensThird() {
		return leftEyeSphericalLensThird;
	}

	public void setLeftEyeSphericalLensThird(String leftEyeSphericalLensThird) {
		this.leftEyeSphericalLensThird = leftEyeSphericalLensThird;
	}

	public String getLeftCylinderThird() {
		return leftCylinderThird;
	}

	public void setLeftCylinderThird(String leftCylinderThird) {
		this.leftCylinderThird = leftCylinderThird;
	}

	public String getLeftCylinderAxialThird() {
		return leftCylinderAxialThird;
	}

	public void setLeftCylinderAxialThird(String leftCylinderAxialThird) {
		this.leftCylinderAxialThird = leftCylinderAxialThird;
	}

	public String getRefractionLeftEyeAverages() {
		return refractionLeftEyeAverages;
	}

	public void setRefractionLeftEyeAverages(String refractionLeftEyeAverages) {
		this.refractionLeftEyeAverages = refractionLeftEyeAverages;
	}

	public String getLeftEyeRetinoscopy() {
		return leftEyeRetinoscopy;
	}

	public void setLeftEyeRetinoscopy(String leftEyeRetinoscopy) {
		this.leftEyeRetinoscopy = leftEyeRetinoscopy;
	}

	public String getLeftEyeNearVision() {
		return leftEyeNearVision;
	}

	public void setLeftEyeNearVision(String leftEyeNearVision) {
		this.leftEyeNearVision = leftEyeNearVision;
	}

	public String getLeftEyeSpectaclesDegrees() {
		return leftEyeSpectaclesDegrees;
	}

	public void setLeftEyeSpectaclesDegrees(String leftEyeSpectaclesDegrees) {
		this.leftEyeSpectaclesDegrees = leftEyeSpectaclesDegrees;
	}

	public String getLeftEyeVisionCorrection() {
		return leftEyeVisionCorrection;
	}

	public void setLeftEyeVisionCorrection(String leftEyeVisionCorrection) {
		this.leftEyeVisionCorrection = leftEyeVisionCorrection;
	}

	public String getLeftAnteriorAxialLength() {
		return leftAnteriorAxialLength;
	}

	public void setLeftAnteriorAxialLength(String leftAnteriorAxialLength) {
		this.leftAnteriorAxialLength = leftAnteriorAxialLength;
	}

	public String getRightEyeSphericalLens() {
		return rightEyeSphericalLens;
	}

	public void setRightEyeSphericalLens(String rightEyeSphericalLens) {
		this.rightEyeSphericalLens = rightEyeSphericalLens;
	}

	public String getRightCylinder() {
		return rightCylinder;
	}

	public void setRightCylinder(String rightCylinder) {
		this.rightCylinder = rightCylinder;
	}

	public String getRightCylinderAxial() {
		return rightCylinderAxial;
	}

	public void setRightCylinderAxial(String rightCylinderAxial) {
		this.rightCylinderAxial = rightCylinderAxial;
	}

	public String getRightEyeSphericalLensSecond() {
		return rightEyeSphericalLensSecond;
	}

	public void setRightEyeSphericalLensSecond(String rightEyeSphericalLensSecond) {
		this.rightEyeSphericalLensSecond = rightEyeSphericalLensSecond;
	}

	public String getRightCylinderSecond() {
		return rightCylinderSecond;
	}

	public void setRightCylinderSecond(String rightCylinderSecond) {
		this.rightCylinderSecond = rightCylinderSecond;
	}

	public String getRightCylinderAxialSecond() {
		return rightCylinderAxialSecond;
	}

	public void setRightCylinderAxialSecond(String rightCylinderAxialSecond) {
		this.rightCylinderAxialSecond = rightCylinderAxialSecond;
	}

	public String getRightEyeSphericalLensThird() {
		return rightEyeSphericalLensThird;
	}

	public void setRightEyeSphericalLensThird(String rightEyeSphericalLensThird) {
		this.rightEyeSphericalLensThird = rightEyeSphericalLensThird;
	}

	public String getRightCylinderThird() {
		return rightCylinderThird;
	}

	public void setRightCylinderThird(String rightCylinderThird) {
		this.rightCylinderThird = rightCylinderThird;
	}

	public String getRightCylinderAxialThird() {
		return rightCylinderAxialThird;
	}

	public void setRightCylinderAxialThird(String rightCylinderAxialThird) {
		this.rightCylinderAxialThird = rightCylinderAxialThird;
	}

	public String getRefractionRightEyeAverages() {
		return refractionRightEyeAverages;
	}

	public void setRefractionRightEyeAverages(String refractionRightEyeAverages) {
		this.refractionRightEyeAverages = refractionRightEyeAverages;
	}

	public String getRightEyeRetinoscopy() {
		return rightEyeRetinoscopy;
	}

	public void setRightEyeRetinoscopy(String rightEyeRetinoscopy) {
		this.rightEyeRetinoscopy = rightEyeRetinoscopy;
	}

	public String getRightEyeNearVision() {
		return rightEyeNearVision;
	}

	public void setRightEyeNearVision(String rightEyeNearVision) {
		this.rightEyeNearVision = rightEyeNearVision;
	}

	public String getRightEyeSpectaclesDegrees() {
		return rightEyeSpectaclesDegrees;
	}

	public void setRightEyeSpectaclesDegrees(String rightEyeSpectaclesDegrees) {
		this.rightEyeSpectaclesDegrees = rightEyeSpectaclesDegrees;
	}

	public String getRightEyeVisionCorrection() {
		return rightEyeVisionCorrection;
	}

	public void setRightEyeVisionCorrection(String rightEyeVisionCorrection) {
		this.rightEyeVisionCorrection = rightEyeVisionCorrection;
	}

	public String getRightAnteriorAxialLength() {
		return rightAnteriorAxialLength;
	}

	public void setRightAnteriorAxialLength(String rightAnteriorAxialLength) {
		this.rightAnteriorAxialLength = rightAnteriorAxialLength;
	}

	public String getOcularInspectionEquipment() {
		return ocularInspectionEquipment;
	}

	public void setOcularInspectionEquipment(String ocularInspectionEquipment) {
		this.ocularInspectionEquipment = ocularInspectionEquipment;
	}

	public String getIopcheckTheSerialNumber() {
		return iopcheckTheSerialNumber;
	}

	public void setIopcheckTheSerialNumber(String iopcheckTheSerialNumber) {
		this.iopcheckTheSerialNumber = iopcheckTheSerialNumber;
	}

	public String getOcularInspectionDetectionTime() {
		return ocularInspectionDetectionTime;
	}

	public void setOcularInspectionDetectionTime(String ocularInspectionDetectionTime) {
		this.ocularInspectionDetectionTime = ocularInspectionDetectionTime;
	}

	public String getLeftEyeFirstIop() {
		return leftEyeFirstIop;
	}

	public void setLeftEyeFirstIop(String leftEyeFirstIop) {
		this.leftEyeFirstIop = leftEyeFirstIop;
	}

	public String getRightEyeFirstIop() {
		return rightEyeFirstIop;
	}

	public void setRightEyeFirstIop(String rightEyeFirstIop) {
		this.rightEyeFirstIop = rightEyeFirstIop;
	}

	public String getLeftEyeSecondIop() {
		return leftEyeSecondIop;
	}

	public void setLeftEyeSecondIop(String leftEyeSecondIop) {
		this.leftEyeSecondIop = leftEyeSecondIop;
	}

	public String getRightEyeSecondIop() {
		return rightEyeSecondIop;
	}

	public void setRightEyeSecondIop(String rightEyeSecondIop) {
		this.rightEyeSecondIop = rightEyeSecondIop;
	}

	public String getLeftEyeThirdIop() {
		return leftEyeThirdIop;
	}

	public void setLeftEyeThirdIop(String leftEyeThirdIop) {
		this.leftEyeThirdIop = leftEyeThirdIop;
	}

	public String getRightEyeThirdIop() {
		return rightEyeThirdIop;
	}

	public void setRightEyeThirdIop(String rightEyeThirdIop) {
		this.rightEyeThirdIop = rightEyeThirdIop;
	}

	public String getLeftEyeFourthIop() {
		return leftEyeFourthIop;
	}

	public void setLeftEyeFourthIop(String leftEyeFourthIop) {
		this.leftEyeFourthIop = leftEyeFourthIop;
	}

	public String getRightEyeFourthIop() {
		return rightEyeFourthIop;
	}

	public void setRightEyeFourthIop(String rightEyeFourthIop) {
		this.rightEyeFourthIop = rightEyeFourthIop;
	}

	public String getLeftEyeTheMeanIop() {
		return leftEyeTheMeanIop;
	}

	public void setLeftEyeTheMeanIop(String leftEyeTheMeanIop) {
		this.leftEyeTheMeanIop = leftEyeTheMeanIop;
	}

	public String getRightEyeTheMeanIop() {
		return rightEyeTheMeanIop;
	}

	public void setRightEyeTheMeanIop(String rightEyeTheMeanIop) {
		this.rightEyeTheMeanIop = rightEyeTheMeanIop;
	}

	public String getBinocularVision() {
		return binocularVision;
	}

	public void setBinocularVision(String binocularVision) {
		this.binocularVision = binocularVision;
	}

	public String getLeftEyePosition() {
		return leftEyePosition;
	}

	public void setLeftEyePosition(String leftEyePosition) {
		this.leftEyePosition = leftEyePosition;
	}

	public String getRightEyePosition() {
		return rightEyePosition;
	}

	public void setRightEyePosition(String rightEyePosition) {
		this.rightEyePosition = rightEyePosition;
	}

	public String getLeftEyeMuscle() {
		return leftEyeMuscle;
	}

	public void setLeftEyeMuscle(String leftEyeMuscle) {
		this.leftEyeMuscle = leftEyeMuscle;
	}

	public String getRightEyeMuscle() {
		return rightEyeMuscle;
	}

	public void setRightEyeMuscle(String rightEyeMuscle) {
		this.rightEyeMuscle = rightEyeMuscle;
	}

	public String getLeftEyelid() {
		return leftEyelid;
	}

	public void setLeftEyelid(String leftEyelid) {
		this.leftEyelid = leftEyelid;
	}

	public String getRightEyelid() {
		return rightEyelid;
	}

	public void setRightEyelid(String rightEyelid) {
		this.rightEyelid = rightEyelid;
	}

	public String getLeftEyeLacrimalApparatus() {
		return leftEyeLacrimalApparatus;
	}

	public void setLeftEyeLacrimalApparatus(String leftEyeLacrimalApparatus) {
		this.leftEyeLacrimalApparatus = leftEyeLacrimalApparatus;
	}

	public String getRightEyeLacrimalApparatus() {
		return rightEyeLacrimalApparatus;
	}

	public void setRightEyeLacrimalApparatus(String rightEyeLacrimalApparatus) {
		this.rightEyeLacrimalApparatus = rightEyeLacrimalApparatus;
	}

	public String getLeftEyeConjunctiva() {
		return leftEyeConjunctiva;
	}

	public void setLeftEyeConjunctiva(String leftEyeConjunctiva) {
		this.leftEyeConjunctiva = leftEyeConjunctiva;
	}

	public String getRightEyeConjunctiva() {
		return rightEyeConjunctiva;
	}

	public void setRightEyeConjunctiva(String rightEyeConjunctiva) {
		this.rightEyeConjunctiva = rightEyeConjunctiva;
	}

	public String getLeftEyeSclera() {
		return leftEyeSclera;
	}

	public void setLeftEyeSclera(String leftEyeSclera) {
		this.leftEyeSclera = leftEyeSclera;
	}

	public String getRightEyeSclera() {
		return rightEyeSclera;
	}

	public void setRightEyeSclera(String rightEyeSclera) {
		this.rightEyeSclera = rightEyeSclera;
	}

	public String getLeftEyePupil() {
		return leftEyePupil;
	}

	public void setLeftEyePupil(String leftEyePupil) {
		this.leftEyePupil = leftEyePupil;
	}

	public String getRightEyePupil() {
		return rightEyePupil;
	}

	public void setRightEyePupil(String rightEyePupil) {
		this.rightEyePupil = rightEyePupil;
	}

	public String getLeftEyeCornea() {
		return leftEyeCornea;
	}

	public void setLeftEyeCornea(String leftEyeCornea) {
		this.leftEyeCornea = leftEyeCornea;
	}

	public String getRightEyeCornea() {
		return rightEyeCornea;
	}

	public void setRightEyeCornea(String rightEyeCornea) {
		this.rightEyeCornea = rightEyeCornea;
	}

	public String getLeftEyeAnteriorChamber() {
		return leftEyeAnteriorChamber;
	}

	public void setLeftEyeAnteriorChamber(String leftEyeAnteriorChamber) {
		this.leftEyeAnteriorChamber = leftEyeAnteriorChamber;
	}

	public String getRightEyeAnteriorChamber() {
		return rightEyeAnteriorChamber;
	}

	public void setRightEyeAnteriorChamber(String rightEyeAnteriorChamber) {
		this.rightEyeAnteriorChamber = rightEyeAnteriorChamber;
	}

	public String getLeftEyeCrystal() {
		return leftEyeCrystal;
	}

	public void setLeftEyeCrystal(String leftEyeCrystal) {
		this.leftEyeCrystal = leftEyeCrystal;
	}

	public String getRightEyeCrystal() {
		return rightEyeCrystal;
	}

	public void setRightEyeCrystal(String rightEyeCrystal) {
		this.rightEyeCrystal = rightEyeCrystal;
	}

	public String getLeftEyeFundus() {
		return leftEyeFundus;
	}

	public void setLeftEyeFundus(String leftEyeFundus) {
		this.leftEyeFundus = leftEyeFundus;
	}

	public String getRightEyeFundus() {
		return rightEyeFundus;
	}

	public void setRightEyeFundus(String rightEyeFundus) {
		this.rightEyeFundus = rightEyeFundus;
	}

	public String getLeftEyeOther() {
		return leftEyeOther;
	}

	public void setLeftEyeOther(String leftEyeOther) {
		this.leftEyeOther = leftEyeOther;
	}

	public String getRightEyeOther() {
		return rightEyeOther;
	}

	public void setRightEyeOther(String rightEyeOther) {
		this.rightEyeOther = rightEyeOther;
	}

	@JSON(name = "STURESULT")
	public String getStuResult() {
		return stuResult;
	}

	public void setStuResult(String stuResult) {
		this.stuResult = stuResult;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}
	
	public List getErrorList() {
		return errorList;
	}

	public void setErrorList(List errorList) {
		this.errorList = errorList;
	}
	
	public List getErrorReason() {
		return errorReason;
	}

	public void setErrorReason(List errorReason) {
		this.errorReason = errorReason;
	}

	public List getSimilarList() {
		return similarList;
	}

	public void setSimilarList(List similarList) {
		this.similarList = similarList;
	}
	
	public List getSimilarReason() {
		return similarReason;
	}

	public void setSimilarReason(List similarReason) {
		this.similarReason = similarReason;
	}
	
	@JSON(name = "PAGEBEAN")
	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
	
	//@JSON(serialize=false) 	//把相关有依赖注入的变量的get方法去掉就可以，或者也可以在相应的get方法上添加标签
	//public VisioncheckService getVisioncheckService() {
	//	return visioncheckService;
	//}

	public void setVisioncheckService(VisioncheckService visioncheckService) {
		this.visioncheckService = visioncheckService;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	@JSON(name = "MSG")
	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	@JSON(name = "TOTALROWS")
	public int getTotalrows() {
		return totalrows;
	}

	public void setTotalrows(int totalrows) {
		this.totalrows = totalrows;
	}
	
	@JSON(name = "CURRENTROWS")
	public int getCurrentrows() {
		return currentrows;
	}

	public void setCurrentrows(int currentrows) {
		this.currentrows = currentrows;
	}

	public int getActualrows() {
		return actualrows;
	}

	public void setActualrows(int actualrows) {
		this.actualrows = actualrows;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
//		this.password = getMD5.makeMD5(password);
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public Boolean getAccountNonExpired() {
		return accountNonExpired;
	}

	public void setAccountNonExpired(Boolean accountNonExpired) {
		this.accountNonExpired = accountNonExpired;
	}

	public Boolean getCredentialsNonExpired() {
		return credentialsNonExpired;
	}

	public void setCredentialsNonExpired(Boolean credentialsNonExpired) {
		this.credentialsNonExpired = credentialsNonExpired;
	}

	public Boolean getAccountNonLocked() {
		return accountNonLocked;
	}

	public void setAccountNonLocked(Boolean accountNonLocked) {
		this.accountNonLocked = accountNonLocked;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGuardianName() {
		return guardianName;
	}

	public void setGuardianName(String guardianName) {
		this.guardianName = guardianName;
	}

	public int getSchool() {
		return school;
	}

	public void setSchool(int school) {
		this.school = school;
	}
	
	public int getManageCommunity() {
		return manageCommunity;
	}

	public void setManageCommunity(int manageCommunity) {
		this.manageCommunity = manageCommunity;
	}
	

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getStuClass() {
		return stuClass;
	}

	public void setStuClass(String stuClass) {
		this.stuClass = stuClass;
	}

	public String getIdNumber() {
		return idNumber;
	}

	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	//@JSON(serialize=false) 	//把相关有依赖注入的变量的get方法去掉就可以，或者也可以在相应的get方法上添加标签	2016-8-15
	//public UserinfoService getUserinfoService() {
	//	return userinfoService;
	//}

	public void setUserinfoService(UserinfoService userinfoService) {
		this.userinfoService = userinfoService;
	}


///-----------------------统计社区视觉信息------------------------
/**
	public String communityVisionInfo() {
		//try {

			System.out.println("This is communityVisionInfo() of CommunityVisionInfoAction!");
			req = ServletActionContext.getRequest();
			Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
			//String address = u.getAddress();
			String hql = "select u.username,u.realname,u.gender,u.age,u.school," +
					" u.grade,u.stuClass,u.nation,u.height,u.weight,u.guardianName,v.visionlevel " +
						" from Userinfo u, Visioncheck v " +
						" where u.level in(?,?)  and u.username = v.username and v.visionlevel=? and v.tableId in " +			//and u.address=?
						"( " +
							" select MAX(v.tableId) from Userinfo u, Visioncheck v " +
							" where u.level in(?,?) and u.username = v.username " +				// and u.address=?
							" group by u.username " +
						")" +
						" group by u.username "; // 查询语句

			//String[] values = new String[] { "学生" , "家长" , address , "学生" , "家长" , address };
			String[] values = new String[] { "学生" , "家长" , "正常" , "学生" , "家长"};
			//list = visioncheckService.findInfo(hql, values);
			this.pageBean = userinfoService.querySearchForPage(10, page, hql, values);
			list = pageBean.getList();
			System.out.println("list.size()为"+list.size());
			
			if (list.size() <= 0) {
				this.pageBean = userinfoService.querySearchForPage(10, page - 1, hql, values);
				list = pageBean.getList();
				this.pageBean.setTotalPage(1);
				this.pageBean.setCurrentPage(1);
			}
			
			//ActionContext ac = ActionContext.getContext();
			/**
			if(list.size()>0){
				Visioncheck vcheck = (Visioncheck) list.get(list.size()-1);
			
				String hql2="from Userinfo u where u.username=?";
				String[] values2=new String[]{vcheck.getUsername()};
				List templist =userinfoService.findInfo(hql2, values2);
				System.out.println("templist.size()为："+templist.size());
				if(templist.size()>0){
					
					Userinfo uinfo=(Userinfo)templist.get(0);
					ac.put("vcheck", vcheck);
					ac.put("uinfo", uinfo);
				}
			}
			**/
			/**
			this.pageBean = visioncheckService.querySearchForPage(10, page, hql, values);
			list = pageBean.getList();

			if (list.size() <= 0) {
				this.pageBean = visioncheckService.querySearchForPage(10, 1, hql, values);
				list = pageBean.getList();
				this.pageBean.setTotalPage(1);
				this.pageBean.setCurrentPage(1);
			}
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
			return "success";
	}
	**/
	
	//2017.4.26重构
	public void communityVisionInfo() {		//将查询结果返回给页面，json方法待定
		try {
			System.out.println("This is communityVisionInfo() of CommunityVisionInfoAction!");
//			System.out.println("visionlevel为："+visionlevel);
 
			req = ServletActionContext.getRequest();
			Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
			
			String[] userPropvalues={"username","realname","age","phone","school"};
			String[] visionPropvalues={"checkTime","visionlevel","rightEyeLittleValue","rightEyeVisualFunction","leftEyeLittleValue","leftEyeVisualFunction"};
			String[] schoolPropvalues={"schoolname"};
			
			String hql = "select ";
			if(userPropvalues.length>0){
				hql+="u."+userPropvalues[0];
			}
			int i;
			for(i=1;i<userPropvalues.length;i++){
				hql+=",u."+userPropvalues[i];
			}
			for(i=0;i<visionPropvalues.length;i++){
				hql+=",v."+visionPropvalues[i];
			}
			for(i=0;i<schoolPropvalues.length;i++){
				hql+=",s."+schoolPropvalues[i];
			}
			
			hql +=  " from Userinfo u, Visioncheck v, Schoolinfo s " +
					" where u.level in(?,?)  and u.username = v.username and u.manageCommunity=? and u.school=s.schoolid "+
					" and v.tableId in " +
						"( " +
						" select MAX(v.tableId) from Userinfo u, Visioncheck v " +
						" where u.level in(?,?) and u.username = v.username and u.manageCommunity=? and u.school=s.schoolid " +	
						" group by u.username " +
						")";
			
			Object[] values = new Object[] { "学生" , "家长" , u.getManageCommunity() , "学生" , "家长" , u.getManageCommunity()  };
			list = userinfoService.findInfo(hql,values);
			//创建自定义对象转json方法
			String listjson = JsonUtil.myListToJson(list,userPropvalues,visionPropvalues,schoolPropvalues);
			String jsonstring="{\"data\":"+listjson+",\"draw\":\"1\",\"recordsTotal\":"+list.size()+",\"recordsFiltered\":"+list.size()+"}";
			ServletActionContext.getResponse().getWriter().write(jsonstring);  //以这种方式传值json
		} catch (Exception e) {
			e.printStackTrace();
			return;
		}
		
	}
	
	///-----------------------统计社区视觉信息------------------------

//	public String communityVisionInfo() {		//将查询结果返回给页面，json方法待定
//		try {
//			System.out.println("This is communityVisionInfo() of CommunityVisionInfoAction!");
//			System.out.println("visionlevel为："+visionlevel);
// 
//			req = ServletActionContext.getRequest();
//			Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
//			String address = u.getAddress();
//			
//			String hql="";
//			
//			ArrayList<String> namelist =new ArrayList<String>();	//用来存放values
//			namelist.add("学生");
//			namelist.add("家长");
//			namelist.add(address);
//			if(visionlevel==null || visionlevel.equals("")){
//				return "success";
//			}
//			if(Integer.parseInt(visionlevel)<0){		//默认参数为-1，2016-06-29
//				hql = 	"select u.username,u.realname,u.gender,u.age,u.phone,u.school, " +
//						" u.grade,u.stuClass,u.nation,u.height,u.weight,u.guardianName, " +
//						" v.checkTime,v.visionlevel,v.rightEyeLittleValue,v.rightEyeVisualFunction, " +
//						" v.leftEyeLittleValue,v.leftEyeVisualFunction" +
//						" from Userinfo u, Visioncheck v " +
//						" where u.level in(?,?)  and u.username = v.username and u.address=? "+
//						" and v.tableId in " +
//							"( " +
//							" select MAX(v.tableId) from Userinfo u, Visioncheck v " +
//							" where u.level in(?,?) and u.username = v.username and u.address=? " +	
//							" group by u.username " +
//							")";
//			
////				namelist.add(levelvalue[Integer.parseInt(visionlevel)]);
//				namelist.add("学生");
//				namelist.add("家长");
//				namelist.add(address);
//			}
//			else if(Integer.parseInt(visionlevel)>=0 && Integer.parseInt(visionlevel)<=5){		//对传过来的参数visionlevel进行判断
//				String[] levelvalue = new String[]{"正常","预警","亚健康","异常","错误","未知"};			//新增视觉等级亚健康3，2016-07-13
//				hql = 	"select u.username,u.realname,u.gender,u.age,u.phone,u.school, " +
//						" u.grade,u.stuClass,u.nation,u.height,u.weight,u.guardianName, " +
//						" v.checkTime,v.visionlevel,v.rightEyeLittleValue,v.rightEyeVisualFunction, " +
//						" v.leftEyeLittleValue,v.leftEyeVisualFunction" +
//						" from Userinfo u, Visioncheck v " +
//						" where u.level in(?,?)  and u.username = v.username and u.address=?  and v.visionlevel=? "+
//						" and v.tableId in " +
//							"( " +
//							" select MAX(v.tableId) from Userinfo u, Visioncheck v " +
//							" where u.level in(?,?) and u.username = v.username and u.address=? " +	
//							" group by u.username " +
//							")";
//			
//				namelist.add(levelvalue[Integer.parseInt(visionlevel)]);
//				namelist.add("学生");
//				namelist.add("家长");
//				namelist.add(address);
//			}
//			else {		//无视觉档案的人员信息 else if(visionlevel.equals("5"))
//				System.out.println("visionlevel为："+visionlevel);
//				hql = "select u.username,u.realname,u.gender,u.age,u.phone,u.school," +
//						" u.grade,u.stuClass,u.nation,u.height,u.weight,u.guardianName "+
//						" from Userinfo u " +
//						" where u.level in(?,?) and u.address=?  and u.username not in " +
//						"(" +
//							" select v.username from Visioncheck v " +
//							" group by v.username " +
//						")";
//			}
//
//			String[] values = new String[namelist.size()];
//			for(int i=0;i<namelist.size();i++){
//				values[i]=namelist.get(i);
//				System.out.println("values["+i+"]为："+values[i]);
//			}
//			//values={ "学生" , "家长" , address , visionlevel , "学生" , "家长" , address };
//			//String[] values = new String[] { "学生" , "家长" , visionlevel , "学生" , "家长"};
//			//list = userinfoService.findInfo(hql, values);
//			//stuResult = JsonUtil.listToJson(list);
//			
//			this.pageBean = userinfoService.querySearchForPage(10, page, hql, values);
//			list = pageBean.getList();
//			System.out.println("list.size()为"+list.size());
//			
//			
//			
//			if (list.size() <= 0) {
//				this.pageBean = userinfoService.querySearchForPage(10, 1, hql, values);
//				list = pageBean.getList();
//				this.pageBean.setTotalPage(1);
//				this.pageBean.setCurrentPage(1);
//			}
//			//stuResult = JsonUtil.listToJson(list);
//			//System.out.println("stuResult为"+stuResult);
//			
//			return "success";
//		} catch (Exception e) {
//			System.out.println("search方法错误！");
//			e.printStackTrace();
//			return null;
//		}
//		
//	}
	//------------预警人员信息查询
	public String visionAlertInfo() {		//将查询结果返回给页面，json方法待定
		try {
			//System.out.println("This is searchCommunityVisionInfo() of CommunityVisionInfoAction!");
			System.out.println("This is visionAlertInfo() of CommunityVisionInfoAction!");

			req = ServletActionContext.getRequest();
			Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
			String address = u.getAddress();
			
			String hql="";
			
			ArrayList<String> namelist =new ArrayList<String>();	//用来存放values
			namelist.add("学生");
			namelist.add("家长");
			namelist.add(address);
			
				hql = 	"select u.username,u.realname,u.gender,u.age,u.school," +
						" u.grade,u.stuClass,u.nation,u.height,u.weight,u.guardianName," +
						" v.visionlevel,v.checkTime,u.phone " +
						" from Userinfo u, Visioncheck v " +
						" where u.level in(?,?)  and u.username = v.username and u.address=?  and v.visionlevel=? "+
						" and v.tableId in " +
							"( " +
							" select MAX(v.tableId) from Userinfo u, Visioncheck v " +
							" where u.level in(?,?) and u.username = v.username and u.address=? " +	
							" group by u.username " +
							")" +
							" order by DATE_FORMAT(v.checkTime,'%Y-%m-%d') asc ";	//desc为降序
			
			namelist.add("预警");
			namelist.add("学生");
			namelist.add("家长");
			namelist.add(address);
			

			String[] values = new String[namelist.size()];
			
			for(int i=0;i<namelist.size();i++){
				values[i]=namelist.get(i);
				//System.out.println("values["+i+"]为："+values[i]);
			}
			
			//values={ "学生" , "家长" , address , visionlevel , "学生" , "家长" , address };
			//String[] values = new String[] { "学生" , "家长" , visionlevel , "学生" , "家长"};
			//list = userinfoService.findInfo(hql, values);
			//stuResult = JsonUtil.listToJson(list);
			list = userinfoService.findInfo(hql, values);
			/**
			this.pageBean = userinfoService.querySearchForPage(pageBean.getAllRow() , page, hql, values);
			list = pageBean.getList();
			**/
			/**
			this.pageBean = userinfoService.querySearchForPage(pageBean.getAllRow(), page, hql, values);
			list = pageBean.getList();
			System.out.println("list.size()为"+list.size());
			if (list.size() <= 0) {
				this.pageBean = userinfoService.querySearchForPage(10, 1, hql, values);
				list = pageBean.getList();
				this.pageBean.setTotalPage(1);
				this.pageBean.setCurrentPage(1);
			}
			//stuResult = JsonUtil.listToJson(list);
			//System.out.println("stuResult为"+stuResult);
			**/
			return "success";
		} catch (Exception e) {
			System.out.println("查询错误！");
			e.printStackTrace();
			return null;
		}
		
	}
	public String theVisionAlertPeople(){
		//将查询结果返回给页面，json方法待定
		try {
			System.out.println("This is theVisionAlertPeople() of CommunityVisionInfoAction! and the visionalert is:"+visionalert);
			if(visionalert==null){
				return null;
			}
			req = ServletActionContext.getRequest();
			Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
			String address = u.getAddress();
			
			//DATEDIFF(NOW(),v.recordTime) < 30		查询检查时间小于30天的信息

			String hql = 	"select u.username,u.realname,u.gender,u.age,u.school, " +
						" u.grade,u.stuClass,u.nation,u.height,u.weight,u.guardianName, " +
						" v.visionlevel,v.checkTime,u.phone " +
						" from Userinfo u, Visioncheck v " +
						" where u.level in(?,?)  and u.username = v.username and u.address=?  and v.visionlevel=? ";

				if(visionalert==1){
					hql += " and DATEDIFF(NOW(),v.checkTime) = 15 ";
				}
				else if(visionalert==2){
					hql += " and DATEDIFF(NOW(),v.checkTime) > 60 ";
				}
				hql += 	" and v.tableId in " +
						"( " +
						" select MAX(v.tableId) from Userinfo u, Visioncheck v " +
						" where u.level in(?,?) and u.username = v.username and u.address=? " +	
						" group by u.username " +
						")" +
						" order by DATE_FORMAT(v.checkTime,'%Y-%m-%d') asc ";	//desc为降序


			String[] values={ "学生" , "家长" , address , "预警" , "学生" , "家长" , address };
			//list = userinfoService.findInfo(hql, values);
			//stuResult = JsonUtil.listToJson(list);
			list = userinfoService.findInfo(hql, values);
			//System.out.println("list.size()为："+list.size()+"\ttheVisionAlertPeople()方法结束！");
			return "success";
		} catch (Exception e) {
			System.out.println("查询错误！");
			e.printStackTrace();
			return null;
		}
		
	
	}
	
	//前台调用timeComputing方法，计算经过的天数2016-1-26
	public long timeComputing(String date,String level) {
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date dt;
			long day = 0;
			try {
				dt = df.parse(date);
			
				Date now = new Date();
				day = (now.getTime()-dt.getTime())/(24*3600*1000);

				//System.out.println("This is timeComputing()! and the day is:"+day);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				//e.printStackTrace();
				//System.out.println("日期出错！");
				return 0;
			}
			if(level.equals("预警")){
				return 60-day;
			}
			else if(level.equals("正常") || level.equals("异常") || level.equals("亚健康")){
				return 90-day;
			}
			else{
				return 0;
			}
	}
	
	public String levelComputing(double EyeValue, double anotherEyeValue, double VisualFunction,String birthdate){
		///System.out.println("This is levelComputing()!");
		//System.out.println("接收到的参数为："+EyeValue+VisualFunction+age);
		int state = -2;
		String[] visionstate= new String[]{"未知","异常","预警","正常","错误","亚健康"};
		try{
			double temp=Math.abs( Math.log10(1/EyeValue)-Math.log10(1/anotherEyeValue) );
			if( Double.isNaN(temp) || Double.isInfinite(temp)  || temp>=0.2){		//如果temp计算结果异常，则置为错误，状态2
				state = 2;
				return visionstate[state+2];
			}
		}catch(Exception e){
			state = 2;
			return visionstate[state+2];
		}
		
		Calendar now = Calendar.getInstance();
		try{
			int age = now.get(Calendar.YEAR)  - Integer.parseInt(birthdate.substring(0, 4));
			state = IsVisualFunctionNormal(EyeValue,VisualFunction,age );
		}catch(Exception e){
			state = 2;
			System.out.println("该学生视觉错误！");
			return visionstate[state+2];
		}
		return visionstate[state+2];
		
	}
	
	public  String  modifydetailVisionInfo() {
		try {
			String hql = "from Visioncheck v where v.tableId=?";
			Integer[] values = new Integer[] { tableId };
			list = visioncheckService.findInfo(hql, values);
			Visioncheck visioncheck = (Visioncheck) list.get(0);
			ActionContext ac = ActionContext.getContext();
			ac.put("vc", visioncheck);
///////visioncheck vc  取出该订单的详情  展示 修改
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public String updatedetailVisionInfo(){///修改更新
		try {
			String hql = "from Visioncheck v where v.tableId=?";
			Integer[] values = new Integer[] { tableId };
			list = visioncheckService.findInfo(hql, values);
			Visioncheck visioncheck = (Visioncheck) list.get(0);
			
			visioncheck.setRefractiveCorrectionMethod(refractiveCorrectionMethod);// 屈光矫正方法
			visioncheck.setTheNumberOfAnnualEyeCheck(theNumberOfAnnualEyeCheck);// 年检眼次数
			visioncheck.setBirthSituation(birthSituation);
			visioncheck.setMoreThan600degreesOfMyopiaRelatives(moreThan600degreesOfMyopiaRelatives);
			visioncheck.setDrugAllergies(drugAllergies);
			visioncheck.setMedicalHistory(medicalHistory);
			visioncheck.setEveryTimeTheElectronicProducts(everyTimeTheElectronicProducts);
			visioncheck.setContinuousAsTheRecentBreak(continuousAsTheRecentBreak);
			visioncheck.setDiet(diet);
			visioncheck.setTheDailyDrinking(theDailyDrinking);
			visioncheck.setEveryTimeOutdoors(everyTimeOutdoors);
		//	String csString=username+checkSequence;
			visioncheck.setCheckSequence(checkSequence);
		//	visioncheck.setCheckSequence(csString);
			visioncheck.setCheckTime(checkTime);
			visioncheck.setDoublecare(doublecare);
			//visioncheck.setVisionlevel(visionlevel);
			visioncheck.setVisionlevel("update");
			visioncheck.setCompanion(companion);
			visioncheck.setCheckTheDataExaminer(checkTheDataExaminer);
			visioncheck.setVisualIinspectionInspectionEquipment(visualIinspectionInspectionEquipment);
			visioncheck.setVisualInspectionSerialNumber(visualInspectionSerialNumber);
			visioncheck.setVisualInspectionDetectionTime(visualInspectionDetectionTime);
			visioncheck.setVisualInspectionExaminer(visualInspectionExaminer);

			visioncheck.setLeftEyeDetectionEnvironment(leftEyeDetectionEnvironment);
			visioncheck.setLeftEyeLittleValue(leftEyeLittleValue);
			visioncheck.setLeftEyeVisualFunction(leftEyeVisualFunction);
			visioncheck.setLeftEyeSpeed(leftEyeSpeed);

			visioncheck.setLeftEyeDetectionEnvironmentSecond(leftEyeDetectionEnvironmentSecond);
			visioncheck.setLeftEyeLittleValueSecond(leftEyeLittleValueSecond);
			visioncheck.setLeftEyeVisualFunctionSecond(leftEyeVisualFunctionSecond);
			visioncheck.setLeftEyeSpeedSecond(leftEyeSpeedSecond);

			visioncheck.setRightEyeDetectionEnvironment(rightEyeDetectionEnvironment);
			visioncheck.setRightEyeLittleValue(rightEyeLittleValue);
			visioncheck.setRightEyeVisualFunction(rightEyeVisualFunction);
			visioncheck.setRightEyeSpeed(rightEyeSpeed);

			visioncheck.setRightEyeDetectionEnvironmentSecond(rightEyeDetectionEnvironmentSecond);
			visioncheck.setRightEyeLittleValueSecond(rightEyeLittleValueSecond);
			visioncheck.setRightEyeVisualFunctionSecond(rightEyeVisualFunctionSecond);
			visioncheck.setRightEyeSpeedSecond(rightEyeSpeedSecond);

			visioncheck.setRefractionInspectionEquipment(refractionInspectionEquipment);
			visioncheck.setRefractiveCheckTheSerialNumber(refractiveCheckTheSerialNumber);
			visioncheck.setRefractionDetectionTime(refractionDetectionTime);
			visioncheck.setRefractionDetectionVd(refractionDetectionVd);
			visioncheck.setRefractionDetectionCyl(refractionDetectionCyl);
			visioncheck.setRefractionDetectionExaminer(refractionDetectionExaminer);
			visioncheck.setRefractionDetectionIpd(refractionDetectionIpd);

			visioncheck.setLeftEyeSphericalLens(leftEyeSphericalLens);
			visioncheck.setLeftCylinder(leftCylinder);
			visioncheck.setLeftCylinderAxial(leftCylinderAxial);
			visioncheck.setLeftEyeSphericalLensSecond(leftEyeSphericalLensSecond);
			visioncheck.setLeftCylinderSecond(leftCylinderSecond);
			visioncheck.setLeftCylinderAxialSecond(leftCylinderAxialSecond);
			visioncheck.setLeftEyeSphericalLensThird(leftEyeSphericalLensThird);
			visioncheck.setLeftCylinderThird(leftCylinderThird);
			visioncheck.setLeftCylinderAxialThird(leftCylinderAxialThird);
			visioncheck.setRefractionLeftEyeAverages(refractionLeftEyeAverages);
			visioncheck.setLeftEyeRetinoscopy(leftEyeRetinoscopy);
			visioncheck.setLeftEyeNearVision(leftEyeNearVision);
			visioncheck.setLeftEyeSpectaclesDegrees(leftEyeSpectaclesDegrees);
			visioncheck.setLeftEyeVisionCorrection(leftEyeVisionCorrection);
			visioncheck.setLeftAnteriorAxialLength(leftAnteriorAxialLength);

			visioncheck.setRightEyeSphericalLens(rightEyeSphericalLens);
			visioncheck.setRightCylinder(rightCylinder);
			visioncheck.setRightCylinderAxial(rightCylinderAxial);
			visioncheck.setRightEyeSphericalLensSecond(rightEyeSphericalLensSecond);
			visioncheck.setRightCylinderSecond(rightCylinderSecond);
			visioncheck.setRightCylinderAxialSecond(rightCylinderAxialSecond);
			visioncheck.setRightEyeSphericalLensThird(rightEyeSphericalLensThird);
			visioncheck.setRightCylinderThird(rightCylinderThird);
			visioncheck.setRightCylinderAxialThird(rightCylinderAxialThird);
			visioncheck.setRefractionRightEyeAverages(refractionRightEyeAverages);
			visioncheck.setRightEyeRetinoscopy(rightEyeRetinoscopy);
			visioncheck.setRightEyeNearVision(rightEyeNearVision);
			visioncheck.setRightEyeSpectaclesDegrees(rightEyeSpectaclesDegrees);
			visioncheck.setRightEyeVisionCorrection(rightEyeVisionCorrection);
			visioncheck.setRightAnteriorAxialLength(rightAnteriorAxialLength);

			visioncheck.setOcularInspectionEquipment(ocularInspectionEquipment);
			visioncheck.setIopcheckTheSerialNumber(iopcheckTheSerialNumber);
			visioncheck.setOcularInspectionDetectionTime(ocularInspectionDetectionTime);

			visioncheck.setLeftEyeFirstIop(leftEyeFirstIop);
			visioncheck.setRightEyeFirstIop(rightEyeFirstIop);
			visioncheck.setLeftEyeSecondIop(leftEyeSecondIop);
			visioncheck.setRightEyeSecondIop(rightEyeSecondIop);
			visioncheck.setLeftEyeThirdIop(leftEyeThirdIop);
			visioncheck.setRightEyeThirdIop(rightEyeThirdIop);
			visioncheck.setLeftEyeFourthIop(leftEyeFourthIop);
			visioncheck.setRightEyeFourthIop(rightEyeFourthIop);
			visioncheck.setLeftEyeTheMeanIop(leftEyeTheMeanIop);
			visioncheck.setRightEyeTheMeanIop(rightEyeTheMeanIop);

			visioncheck.setBinocularVision(binocularVision);
			visioncheck.setLeftEyePosition(leftEyePosition);
			visioncheck.setRightEyePosition(rightEyePosition);
			visioncheck.setLeftEyeMuscle(leftEyeMuscle);
			visioncheck.setRightEyeMuscle(rightEyeMuscle);
			visioncheck.setLeftEyelid(leftEyelid);
			visioncheck.setRightEyelid(rightEyelid);
			visioncheck.setLeftEyeLacrimalApparatus(leftEyeLacrimalApparatus);
			visioncheck.setRightEyeLacrimalApparatus(rightEyeLacrimalApparatus);
			visioncheck.setLeftEyeConjunctiva(leftEyeConjunctiva);
			visioncheck.setRightEyeConjunctiva(rightEyeConjunctiva);
			visioncheck.setLeftEyeSclera(leftEyeSclera);
			visioncheck.setRightEyeSclera(rightEyeSclera);
			visioncheck.setLeftEyePupil(leftEyePupil);
			visioncheck.setRightEyePupil(rightEyePupil);
			visioncheck.setLeftEyeCornea(leftEyeCornea);
			visioncheck.setRightEyeCornea(rightEyeCornea);
			visioncheck.setLeftEyeAnteriorChamber(leftEyeAnteriorChamber);
			visioncheck.setRightEyeAnteriorChamber(rightEyeAnteriorChamber);
			visioncheck.setLeftEyeCrystal(leftEyeCrystal);
			visioncheck.setRightEyeCrystal(rightEyeCrystal);
			visioncheck.setLeftEyeFundus(leftEyeFundus);
			visioncheck.setRightEyeFundus(rightEyeFundus);
			visioncheck.setLeftEyeOther(leftEyeOther);
			visioncheck.setRightEyeOther(rightEyeOther);

			visioncheckService.update(visioncheck);	
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	
	
	
	public String stuVisionInfo() {
		try {
			ActionContext ac = ActionContext.getContext();
			ac.put("username", username);
			String hql = "from Visioncheck v where v.username=?";
			String[] values = new String[1];
			values[0] = username;
			this.pageBean = visioncheckService.querySearchForPage(10, page, hql, values);
			list = pageBean.getList();

			if (list.size() <= 0) {
				this.pageBean = visioncheckService.querySearchForPage(10, 1, hql, values);
				list = pageBean.getList();
				this.pageBean.setTotalPage(1);
				this.pageBean.setCurrentPage(1);
			}
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public String createVisionArchive() {
		try {
			ActionContext ac = ActionContext.getContext();
			ac.put("username", username);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public String createVisionArchive_msg() {
		
		try {
			req = ServletActionContext.getRequest();
			String new_uname = (String) req.getSession().getAttribute("new_username");
			ActionContext ac = ActionContext.getContext();
			ac.put("username", new_uname);	
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	
	

	public String expertDiagnose() {
		try {
			req = ServletActionContext.getRequest();
			Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");

			String hql = "from Userinfo u,Authorizerelation a where u.username=a.username and a.specialistName=? and a.isAgreed=?";
			String[] values = new String[2];
			values[0] = u.getUsername();
			values[1] = "是";
			this.pageBean = visioncheckService.querySearchForPage(10, page, hql, values);
			List l = pageBean.getList();
			if (l.size() <= 0) {
				this.pageBean = visioncheckService.querySearchForPage(10, 1, hql, values);
				l = pageBean.getList();
				this.pageBean.setTotalPage(1);
				this.pageBean.setCurrentPage(1);
			}

			ArrayList sList = (ArrayList) l;
			Iterator iterator1 = sList.iterator();
			List l2 = new ArrayList<Userinfo>();
			while (iterator1.hasNext()) {
				Object[] o = (Object[]) iterator1.next();
				Userinfo v = (Userinfo) o[0];
				l2.add(v);
			}
			list = l2;

			// stuResult = JsonUtil.listToJson(list);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public String expertDiagnoseOneStu() {
		try {
			String hql = "from Visioncheck v where v.username=? ";
			String[] values = new String[1];
			values[0] = username;
			
			ActionContext ac = ActionContext.getContext();
			ac.put("username", username);
			
			this.pageBean = visioncheckService.querySearchForPage(10, page, hql, values);
			list = pageBean.getList();
			if (list.size() <= 0) {
				this.pageBean = visioncheckService.querySearchForPage(10, 1, hql, values);
				list = pageBean.getList();
				this.pageBean.setTotalPage(1);
				this.pageBean.setCurrentPage(1);
			}
			stuResult = JsonUtil.listToJson(list);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public String expertDetailVisionInfo() {
		try {
			String hql = "from Visioncheck v where v.tableId=?";
			Integer[] values = new Integer[] { tableId };
			list = visioncheckService.findInfo(hql, values);
			Visioncheck visioncheck = (Visioncheck) list.get(0);
			ActionContext ac = ActionContext.getContext();
			ac.put("visioncheck", visioncheck);

			String h = "from Assessments a where a.tableId= " + tableId + " and a.specialistName=?";
			String[] values1 = new String[1];

			req = ServletActionContext.getRequest();
			Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
			values1[0] = u.getUsername();

			List li = assessmentsService.findInfo(h, values1);
			String str="暂无诊断意见";
			if (li.size() > 0) {
				Assessments ass = new Assessments();
				ass = (Assessments) li.get(0);
				str=ass.getAssessment();
			}

			ac.put("assessment", str);

			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public String detailVisionInfo() {
		try {
			String hql = "from Visioncheck v where v.tableId=?";
			Integer[] values = new Integer[] { tableId };
			list = visioncheckService.findInfo(hql, values);
			Visioncheck visioncheck = (Visioncheck) list.get(0);
			
			String hql2="from Userinfo u where u.username=?";
			String[] values2=new String[]{visioncheck.getUsername()};
			List tempList =userinfoService.findInfo(hql2, values2);
			Userinfo tUserinfo=(Userinfo)tempList.get(0);

			ActionContext ac = ActionContext.getContext();
			ac.put("visioncheck", visioncheck);
			ac.put("tUserinfo", tUserinfo);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public String addVisionInfo() {
		try {

			req = ServletActionContext.getRequest();
			Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");

			Calendar now = Calendar.getInstance();
			String date = now.get(Calendar.YEAR) + "-" + (now.get(Calendar.MONTH) + 1) + "-" + now.get(Calendar.DATE);
			Visioncheck visioncheck = new Visioncheck();
			visioncheck.setUsername(username);
			visioncheck.setRecorder(u.getUsername());
			visioncheck.setRecordTime(date);

			// //////////*****88个**********
			visioncheck.setRefractiveCorrectionMethod(refractiveCorrectionMethod);// 屈光矫正方法
			visioncheck.setTheNumberOfAnnualEyeCheck(theNumberOfAnnualEyeCheck);// 年检眼次数
			visioncheck.setBirthSituation(birthSituation);
			visioncheck.setMoreThan600degreesOfMyopiaRelatives(moreThan600degreesOfMyopiaRelatives);
			visioncheck.setDrugAllergies(drugAllergies);
			visioncheck.setMedicalHistory(medicalHistory);
			visioncheck.setEveryTimeTheElectronicProducts(everyTimeTheElectronicProducts);
			visioncheck.setContinuousAsTheRecentBreak(continuousAsTheRecentBreak);
			visioncheck.setDiet(diet);
			visioncheck.setDoublecare(doublecare);
			//visioncheck.setVisionlevel(visionlevel);
			visioncheck.setVisionlevel("add");
			visioncheck.setTheDailyDrinking(theDailyDrinking);
			visioncheck.setEveryTimeOutdoors(everyTimeOutdoors);
		//	String csString=username+checkSequence;
			visioncheck.setCheckSequence(checkSequence);
		//	visioncheck.setCheckSequence(csString);
			visioncheck.setCheckTime(checkTime);
			visioncheck.setCompanion(companion);
			visioncheck.setCheckTheDataExaminer(checkTheDataExaminer);
			visioncheck.setVisualIinspectionInspectionEquipment(visualIinspectionInspectionEquipment);
			visioncheck.setVisualInspectionSerialNumber(visualInspectionSerialNumber);
			visioncheck.setVisualInspectionDetectionTime(visualInspectionDetectionTime);
			visioncheck.setVisualInspectionExaminer(visualInspectionExaminer);

			visioncheck.setLeftEyeDetectionEnvironment(leftEyeDetectionEnvironment);
			visioncheck.setLeftEyeLittleValue(leftEyeLittleValue);
			visioncheck.setLeftEyeVisualFunction(leftEyeVisualFunction);
			visioncheck.setLeftEyeSpeed(leftEyeSpeed);

			visioncheck.setLeftEyeDetectionEnvironmentSecond(leftEyeDetectionEnvironmentSecond);
			visioncheck.setLeftEyeLittleValueSecond(leftEyeLittleValueSecond);
			visioncheck.setLeftEyeVisualFunctionSecond(leftEyeVisualFunctionSecond);
			visioncheck.setLeftEyeSpeedSecond(leftEyeSpeedSecond);

			visioncheck.setRightEyeDetectionEnvironment(rightEyeDetectionEnvironment);
			visioncheck.setRightEyeLittleValue(rightEyeLittleValue);
			visioncheck.setRightEyeVisualFunction(rightEyeVisualFunction);
			visioncheck.setRightEyeSpeed(rightEyeSpeed);

			visioncheck.setRightEyeDetectionEnvironmentSecond(rightEyeDetectionEnvironmentSecond);
			visioncheck.setRightEyeLittleValueSecond(rightEyeLittleValueSecond);
			visioncheck.setRightEyeVisualFunctionSecond(rightEyeVisualFunctionSecond);
			visioncheck.setRightEyeSpeedSecond(rightEyeSpeedSecond);

			visioncheck.setRefractionInspectionEquipment(refractionInspectionEquipment);
			visioncheck.setRefractiveCheckTheSerialNumber(refractiveCheckTheSerialNumber);
			visioncheck.setRefractionDetectionTime(refractionDetectionTime);
			visioncheck.setRefractionDetectionVd(refractionDetectionVd);
			visioncheck.setRefractionDetectionCyl(refractionDetectionCyl);
			visioncheck.setRefractionDetectionExaminer(refractionDetectionExaminer);
			visioncheck.setRefractionDetectionIpd(refractionDetectionIpd);

			visioncheck.setLeftEyeSphericalLens(leftEyeSphericalLens);
			visioncheck.setLeftCylinder(leftCylinder);
			visioncheck.setLeftCylinderAxial(leftCylinderAxial);
			visioncheck.setLeftEyeSphericalLensSecond(leftEyeSphericalLensSecond);
			visioncheck.setLeftCylinderSecond(leftCylinderSecond);
			visioncheck.setLeftCylinderAxialSecond(leftCylinderAxialSecond);
			visioncheck.setLeftEyeSphericalLensThird(leftEyeSphericalLensThird);
			visioncheck.setLeftCylinderThird(leftCylinderThird);
			visioncheck.setLeftCylinderAxialThird(leftCylinderAxialThird);
			visioncheck.setRefractionLeftEyeAverages(refractionLeftEyeAverages);
			visioncheck.setLeftEyeRetinoscopy(leftEyeRetinoscopy);
			visioncheck.setLeftEyeNearVision(leftEyeNearVision);
			visioncheck.setLeftEyeSpectaclesDegrees(leftEyeSpectaclesDegrees);
			visioncheck.setLeftEyeVisionCorrection(leftEyeVisionCorrection);
			visioncheck.setLeftAnteriorAxialLength(leftAnteriorAxialLength);

			visioncheck.setRightEyeSphericalLens(rightEyeSphericalLens);
			visioncheck.setRightCylinder(rightCylinder);
			visioncheck.setRightCylinderAxial(rightCylinderAxial);
			visioncheck.setRightEyeSphericalLensSecond(rightEyeSphericalLensSecond);
			visioncheck.setRightCylinderSecond(rightCylinderSecond);
			visioncheck.setRightCylinderAxialSecond(rightCylinderAxialSecond);
			visioncheck.setRightEyeSphericalLensThird(rightEyeSphericalLensThird);
			visioncheck.setRightCylinderThird(rightCylinderThird);
			visioncheck.setRightCylinderAxialThird(rightCylinderAxialThird);
			visioncheck.setRefractionRightEyeAverages(refractionRightEyeAverages);
			visioncheck.setRightEyeRetinoscopy(rightEyeRetinoscopy);
			visioncheck.setRightEyeNearVision(rightEyeNearVision);
			visioncheck.setRightEyeSpectaclesDegrees(rightEyeSpectaclesDegrees);
			visioncheck.setRightEyeVisionCorrection(rightEyeVisionCorrection);
			visioncheck.setRightAnteriorAxialLength(rightAnteriorAxialLength);

			visioncheck.setOcularInspectionEquipment(ocularInspectionEquipment);
			visioncheck.setIopcheckTheSerialNumber(iopcheckTheSerialNumber);
			visioncheck.setOcularInspectionDetectionTime(ocularInspectionDetectionTime);

			visioncheck.setLeftEyeFirstIop(leftEyeFirstIop);
			visioncheck.setRightEyeFirstIop(rightEyeFirstIop);
			visioncheck.setLeftEyeSecondIop(leftEyeSecondIop);
			visioncheck.setRightEyeSecondIop(rightEyeSecondIop);
			visioncheck.setLeftEyeThirdIop(leftEyeThirdIop);
			visioncheck.setRightEyeThirdIop(rightEyeThirdIop);
			visioncheck.setLeftEyeFourthIop(leftEyeFourthIop);
			visioncheck.setRightEyeFourthIop(rightEyeFourthIop);
			visioncheck.setLeftEyeTheMeanIop(leftEyeTheMeanIop);
			visioncheck.setRightEyeTheMeanIop(rightEyeTheMeanIop);

			visioncheck.setBinocularVision(binocularVision);
			visioncheck.setLeftEyePosition(leftEyePosition);
			visioncheck.setRightEyePosition(rightEyePosition);
			visioncheck.setLeftEyeMuscle(leftEyeMuscle);
			visioncheck.setRightEyeMuscle(rightEyeMuscle);
			visioncheck.setLeftEyelid(leftEyelid);
			visioncheck.setRightEyelid(rightEyelid);
			visioncheck.setLeftEyeLacrimalApparatus(leftEyeLacrimalApparatus);
			visioncheck.setRightEyeLacrimalApparatus(rightEyeLacrimalApparatus);
			visioncheck.setLeftEyeConjunctiva(leftEyeConjunctiva);
			visioncheck.setRightEyeConjunctiva(rightEyeConjunctiva);
			visioncheck.setLeftEyeSclera(leftEyeSclera);
			visioncheck.setRightEyeSclera(rightEyeSclera);
			visioncheck.setLeftEyePupil(leftEyePupil);
			visioncheck.setRightEyePupil(rightEyePupil);
			visioncheck.setLeftEyeCornea(leftEyeCornea);
			visioncheck.setRightEyeCornea(rightEyeCornea);
			visioncheck.setLeftEyeAnteriorChamber(leftEyeAnteriorChamber);
			visioncheck.setRightEyeAnteriorChamber(rightEyeAnteriorChamber);
			visioncheck.setLeftEyeCrystal(leftEyeCrystal);
			visioncheck.setRightEyeCrystal(rightEyeCrystal);
			visioncheck.setLeftEyeFundus(leftEyeFundus);
			visioncheck.setRightEyeFundus(rightEyeFundus);
			visioncheck.setLeftEyeOther(leftEyeOther);
			visioncheck.setRightEyeOther(rightEyeOther);

			// ///************

			visioncheckService.save(visioncheck);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public String parentStuVisionInfo() {
		try {
			String hql = "from Visioncheck v where v.username=?";
			String[] values = new String[] { username };
			this.pageBean = visioncheckService.querySearchForPage(10, page, hql, values);
			list = pageBean.getList();

			if (list.size() <= 0) {
				this.pageBean = visioncheckService.querySearchForPage(10, 1, hql, values);
				list = pageBean.getList();
				this.pageBean.setTotalPage(1);
				this.pageBean.setCurrentPage(1);
			}
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// ///导入excel文件
	@SuppressWarnings("static-access")
	public String importCommunityExcelFile() throws IOException {

		HttpServletRequest request = ServletActionContext.getRequest();
		// String filePath=request.getRealPath("/")+"\\upload\\test.xlsx";
		String basepath=request.getSession().getServletContext().getRealPath("/");
	//	String filePath = request.getRealPath("/") + "\\upload";
		String filePath=basepath+"/upload";
		// ServletActionContext.getServletContext().getRealPath("/");
		
		System.out.println("This is importCommunityExcelFile() of CommunityVisionInfoAction! And the realpath is: " + filePath);
		if (uploadfile != null) {
			File savefile = new File(new File(filePath), "test.xlsx");
			if (!savefile.getParentFile().exists())
				savefile.getParentFile().mkdirs();
			FileUtils.copyFile(uploadfile, savefile);
			ActionContext.getContext().put("message", "文件上传成功");
			System.out.println("!!!");
		} else {
			System.out.println("~~~");
		}
		
		String fileName="/test.xlsx";
		//filePath = request.getRealPath("/") + "\\upload\\test.xlsx";
		filePath+=fileName;
		try {
			FileInputStream fis = new FileInputStream(new File(filePath));
			// 创建对Excel工作簿文件的引用­
			XSSFWorkbook wookbook = new XSSFWorkbook(fis);
			// 在Excel文档中，第一张工作表的缺省索引是0
			// 其语句为：
			XSSFSheet sheet = wookbook.getSheetAt(0);
		//	XSSFSheet sheet = wookbook.getSheet("Sheet1");
			// 获取到Excel文件中的所有行数­
			int rows = sheet.getPhysicalNumberOfRows();
			totalrows = rows;
			actualrows = 0;
		//	int rows = sheet.getLastRowNum();
			
			String[] visionstate= new String[]{"未知","异常","预警","正常","错误","亚健康"};
			int state = -2,state_Left=-2,state_Right=-2;		//存放视觉状态，1表示正常，0表示预警，-1表示异常，-2表示未知，2表示错误，3表示亚健康 2016-07-13
			double temp=0;
			int cells = 162;	//设定cells大小为固定值，共有的数据列数
			boolean flag_u=true,flag_v=true;	//标志位，用于保存该条记录（用户、档案）是否错误 2016-8-7
			//double tempeyevalue=0;	//暂存视力信息，用于检查数值是否为小数

			errorList = new ArrayList();
			errorReason = new ArrayList();
			similarList = new ArrayList();
			similarReason = new ArrayList();
//			if(!errorList.isEmpty()){	//清空错误列表信息
//				errorList.clear();
//			}
//			if(!errorReason.isEmpty()){
//				errorReason.clear();
//			}
			
			// 遍历行­
			for (int i = 4; i < rows; i++) {
				flag_u=true;
				flag_v=true;
				currentrows=i;
				// 读取左上端单元格­
				XSSFRow row = sheet.getRow(i);
//				if(row.getCell(6)==null || row.getCell(6).equals("")){
//					System.out.println("读取的第"+i+"行为空行！");
//					continue;
//				}
				// 行不为空­
				if (row != null) {
					//currentrows=i;
					//int cells = row.getPhysicalNumberOfCells();		// 获取到Excel文件中的所有的列­
					
				  	//System.out.println("cells的大小为"+cells);
					String value = "";
					// 遍历列
					for (int j = 0; j < cells; j++) {
						// 获取到列的值
						XSSFCell cell = row.getCell(j);
						if (cell != null) {
							switch (cell.getCellType()) {
							case XSSFCell.CELL_TYPE_FORMULA:
								break;
							case XSSFCell.CELL_TYPE_NUMERIC:
								 Double x=cell.getNumericCellValue();
								 if ((x-Math.floor(x))==0) {
									 int y=(int) cell.getNumericCellValue();
									 value += y + "&";
								}else {
									value += cell.getNumericCellValue() + "&";
								}
								break;
							case XSSFCell.CELL_TYPE_STRING:
								value += cell.getStringCellValue().replace(" ", "") + "&";		//删除字符串中的空格
								break;
							default:
								// value += "0"+",";
								value += "/" + "&";
								break;
							}

						} else {
							value += "/" + "&";
						}
					}
					
					// 将数据插入到mysql数据库中­
					String[] val = value.split("&");
					System.out.println("读取的第"+i+"行value为："+value);
					
					if(val[6].equals("/") || val[6].equals("")){
						System.out.println("读取的第"+i+"行为空行！");
						continue;
					}
					
					//System.out.println("val的大小为"+val.length);
				//	System.out.println(i);
					
					Userinfo uentity = new Userinfo();
					uentity.setUsername(UUID.randomUUID().toString());
					//uentity.setUsername(val[5]);
					val[5]=uentity.getUsername();
					//uentity.setPassword(val[5]);
					String pw = getMD5.makeMD5("000000");
					uentity.setPassword(pw);		//设置默认密码000000
					
					uentity.setLevel("学生");
					uentity.setRealname(val[6]);
					uentity.setGender(val[8]);
					//uentity.setAge(val[9]);		//注意判断年龄
					Calendar time = Calendar.getInstance();
					//-------------------------------------------------处理年龄，2016-07-26
					if(val[9].equals("/")){		//如果日期为空，查看身份证、年级属性再进行设置
						if(!val[7].equals("/") && (
								(val[7].length()==18 && val[7].matches("^\\d+$"))
								||
								(val[7].length()==19 && val[7].startsWith("'") && val[7].substring(1).matches("^\\d+$"))
								) ){	//18位且均为数字，或19位以“'”开头并后18位均为数字
							if( val[7].length()==18 && val[7].matches("^\\d+$") ){
								val[9]= getProperDate.makeProperDate(val[7].substring(6, 14));
							}
							else{// if( val[7].length()==19 && val[7].startsWith("'") && val[7].substring(1).matches("^\\d+$")){
								val[9]= getProperDate.makeProperDate(val[7].substring(7, 15));
							}
						}
						else{
							if(val[3].contains("小")){
								val[9]= getProperDate.makeProperDate("3");
							}
							else if(val[3].contains("中")){
								val[9]= getProperDate.makeProperDate("4");
							}
							else if(val[3].contains("大") || val[3].contains("学前")){
								val[9]= getProperDate.makeProperDate("5");
							}
							else if(val[3].contains("一") && !val[3].contains("初一") && !val[3].contains("初中一") || val[3].contains("1")){
								val[9]= getProperDate.makeProperDate("6");
							}
							else if(val[3].contains("二") && !val[3].contains("初二") && !val[3].contains("初中二") || val[3].contains("2")){
								val[9]= getProperDate.makeProperDate("7");
							}
							else if(val[3].contains("三") && !val[3].contains("初三") && !val[3].contains("初中三") || val[3].contains("3")){
								val[9]= getProperDate.makeProperDate("8");
							}
							else if(val[3].contains("四") || val[3].contains("4")){
								val[9]= getProperDate.makeProperDate("9");
							}
							else if(val[3].contains("五") || val[3].contains("5")){
								val[9]= getProperDate.makeProperDate("10");
							}
							else if(val[3].contains("六") || val[3].contains("6")){
								val[9]= getProperDate.makeProperDate("11");
							}
							else if(val[3].contains("初一") || val[3].contains("初中一") || val[3].contains("七") || val[3].contains("7")){
								val[9]= getProperDate.makeProperDate("12");
							}
							else if(val[3].contains("初二") || val[3].contains("初中二") || val[3].contains("八") || val[3].contains("8")){
								val[9]= getProperDate.makeProperDate("13");
							}
							else if(val[3].contains("初三") || val[3].contains("初中三") || val[3].contains("九") || val[3].contains("9")){
								val[9]= getProperDate.makeProperDate("14");
							}
							else if(val[3].contains("高一") || val[3].contains("高中一")){
								val[9]= getProperDate.makeProperDate("15");
							}
							else if(val[3].contains("高二") || val[3].contains("高中二")){
								val[9]= getProperDate.makeProperDate("16");
							}
							else if(val[3].contains("高三") || val[3].contains("高中三")){
								val[9]= getProperDate.makeProperDate("17");
							}
							else{
								val[9]="/";
							}
						}
					}
					else{
						val[9] = getProperDate.makeProperDate(val[9]);
					}
					if(val[9].equals("/")){
						flag_u=false;			//年龄错误
						System.out.println("第"+i+"行记录年龄错误！姓名为："+uentity.getRealname());
						errorList.add(i+1);
						errorReason.add("年龄错误");
						continue;
					}
					uentity.setAge( val[9] );
					
					
					req = ServletActionContext.getRequest();
					Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
					//对地址信息判断
					if(val[1].equals("/")){
						uentity.setAddress(u.getAddress());				//若未输入地址信息，则默认填充社工地址
					}
					else{
						uentity.setAddress(val[1].replace("，", ","));///服务站地址，将中文逗号改为英文逗号
					}
					uentity.setSchool(Integer.valueOf(val[2]));
					if(!val[2].equals("/")){	//将学校保存
						String[] s1=new String[]{val[2]};
						List<Schoolinfo> temps=schoolinfoService.findInfo("from Schoolinfo s where s.schoolname=?", s1);
						if (temps.size()<=0) {
							Schoolinfo schoolinfo = new Schoolinfo();
							schoolinfo.setSchoolname(val[2]);
							schoolinfo.setAddressid(0);
							schoolinfoService.save(schoolinfo);
							//System.out.println("发现新学校，已保存！");
						}
					}
					uentity.setGrade(val[3]);
					uentity.setStuClass(val[4]);
					uentity.setIdNumber(val[7]);
					uentity.setNation(val[10]);
					uentity.setHeight(val[11]);
					uentity.setWeight(val[12]);
					uentity.setEnabled(true);
					uentity.setAccountNonExpired(true);
					uentity.setAccountNonLocked(true);
					uentity.setCredentialsNonExpired(true);
					uentity.setCreater(u.getUsername());
					
					//System.out.println("Username为："+v1[0]);
					
					
//					if(!flag){
//						System.out.println("第"+i+"行记录错误！姓名为："+uentity.getRealname());
//						errorList.add(i+1);
//						errorReason.add("");
//						continue;		//继续下一条记录
//					}
					
																					//社工导入时，检查学校、姓名、性别、年龄信息是否重复
					String hql="from Userinfo u where u.school=? and u.realname=? and u.gender=? and u.age=? ";
					Object[] v1=new Object[]{uentity.getSchool(), uentity.getRealname(), uentity.getGender(), uentity.getAge() };
					//v1[0]=uentity.getUsername();
					List<Userinfo> tempu=userinfoService.findInfo(hql, v1);
					
					Visioncheck ventity = new Visioncheck();		//保存视觉信息代码前移至此处2016-8-7
					
					if (tempu.size()<=0) {
						flag_u=true;
						userinfoService.save(uentity);
						//System.out.println("Userinfo保存成功！");
						ventity.setUsername(val[5]);
					}
					else{
//						for(int j=0;j<tempu.size();j++){
//							System.out.println("发现疑似重复用户："+tempu.get(j).getUsername());
//						}
						flag_u=false;
						similarList.add(currentrows+1);
						similarReason.add(tempu.get(0).getUsername());
						ventity.setUsername(tempu.get(0).getUsername());		//将重复人员的视觉档案信息添加到该人员中
					}
					
					

					List<Userrole> tempur=userroleService.
							findInfo("from Userrole ur where ur.username=? and roleId=1", new String[]{uentity.getUsername()});
			//		System.out.println(tempur.size());
					if (tempur.size()<=0) {
						Userrole userrole = new Userrole();
						userrole.setUsername(val[5]);
						//userrole.setUsername(uentity.getUsername());
						userrole.setRoleId(1);
						userroleService.save(userrole);
						//System.out.println("Userrole保存成功！");
					}
					
					// ///0、1-12 基本信息
					// 13开始
					//Visioncheck ventity = new Visioncheck();
					//ventity.setUsername(val[5]);
					//ventity.setUsername(uentity.getUsername());		//可视化检查	2015.12.8
					
					//req = ServletActionContext.getRequest();
					//Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
					ventity.setRecorder(u.getUsername());
					Calendar now = Calendar.getInstance();
					String date = now.get(Calendar.YEAR) + "-" + (now.get(Calendar.MONTH) + 1) + "-" + now.get(Calendar.DATE);
					ventity.setRecordTime(date);

					if ("是".equals(val[13]) ) {
						ventity.setRefractiveCorrectionMethod("框架眼镜");
					} else if ("是".equals(val[14])) {
						ventity.setRefractiveCorrectionMethod("隐形眼镜");
					} else if ("是".equals(val[15])) {
						ventity.setRefractiveCorrectionMethod("OK镜");
					} else if ("是".equals(val[16])) {
						ventity.setRefractiveCorrectionMethod("膜手术或植入物");
					} else if (!"/".equals(val[17])) {
						ventity.setRefractiveCorrectionMethod(val[17]);
					}

					if ("是".equals(val[18]) ) {
						ventity.setTheNumberOfAnnualEyeCheck("1次");
					} else if ("是".equals(val[19])) {
						ventity.setTheNumberOfAnnualEyeCheck("2次以上");
					} else if ("是".equals(val[20])) {
						ventity.setTheNumberOfAnnualEyeCheck("无");
					}

					String birthsis = null;
					if ("是".equals(val[21])) {
						birthsis = "孕不足37周";
					}
					if ("是".equals(val[22])) {
						if (birthsis == null) {
							birthsis = "体重低于2.5KG";
						} else {
							birthsis += ",体重低于2.5KG";
						}
					}
					if ("是".equals(val[23])) {
						if (birthsis == null) {
							birthsis = "缺氧";
						} else {
							birthsis += ",缺氧";
						}
					}
					if (!"/".equals(val[24])) {
						if (birthsis == null) {
							birthsis = val[24];
						} else {
							birthsis += "," + val[24];
						}
					}
					ventity.setBirthSituation(birthsis);

					// 600度以上近视亲戚
					if ("是".equals(val[28])) {
						ventity.setMoreThan600degreesOfMyopiaRelatives("无");
					} else {
						String peo = null;
						if ("是".equals(val[25])) {
							peo = "母亲";
						}
						if ("是".equals(val[26])) {
							if (peo != null) {
								peo += ",父亲";
							} else {
								peo = "父亲";
							}
						}
						if ("是".equals(val[27])) {
							if (peo != null) {
								peo += ",近亲";
							} else {
								peo = "近亲";
							}
						}
						ventity.setMoreThan600degreesOfMyopiaRelatives(peo);
					}
					ventity.setDrugAllergies(val[29]); // 药物过敏
					ventity.setMedicalHistory(val[30]);// 既往病史
					// 电子产品使用时间
					if ("是".equals(val[31])) {
						ventity.setEveryTimeTheElectronicProducts("不用");
					} else if ("是".equals(val[32])) {
						ventity.setEveryTimeTheElectronicProducts("半小时");
					} else if ("是".equals(val[33])) {
						ventity.setEveryTimeTheElectronicProducts("1－2小时");
					} else if ("是".equals(val[34])) {
						ventity.setEveryTimeTheElectronicProducts("3小时");
					} else if ("是".equals(val[35])) {
						ventity.setEveryTimeTheElectronicProducts("3小时以上");
					} else {
						ventity.setEveryTimeTheElectronicProducts(val[36]);
					}

					if ("是".equals(val[37])) {
						ventity.setContinuousAsTheRecentBreak("每小时休10分钟");
					} else if ("是".equals(val[38])) {
						ventity.setContinuousAsTheRecentBreak("1-2小时休10分钟");
					} else if ("是".equals(val[39])) {
						ventity.setContinuousAsTheRecentBreak("可以长时间不休息");
					}

					// 饮食习惯
					String dietString = null;
					if ("是".equals(val[40])) {
						dietString = "咸";
					}
					if ("是".equals(val[41])) {
						if (dietString == null) {
							dietString = "甜";
						} else {
							dietString += ",甜";
						}
					}
					if ("是".equals(val[42])) {
						if (dietString == null) {
							dietString = "辣";
						} else {
							dietString += ",辣";
						}
					}
					if ("是".equals(val[43])) {
						if (dietString == null) {
							dietString = "油腻";
						} else {
							dietString += ",油腻";
						}
					}
					if ("是".equals(val[44])) {
						if (dietString == null) {
							dietString = "清淡";
						} else {
							dietString += ",清淡";
						}
					}
					if ("是".equals(val[45])) {
						if (dietString == null) {
							dietString = "其它";
						} else {
							dietString += ",其它";
						}
					}
					ventity.setDiet(dietString);

					if ("是".equals(val[46])) {
						ventity.setTheDailyDrinking("三餐");
					} else if ("是".equals(val[47])) {
						ventity.setTheDailyDrinking("一到两餐");
					} else if ("是".equals(val[48])) {
						ventity.setTheDailyDrinking("不定时大量");
					} else if ("是".equals(val[49])) {
						ventity.setTheDailyDrinking("偶尔小量");
					} else if ("是".equals(val[50])) {
						ventity.setTheDailyDrinking("无");
					} else {
						ventity.setTheDailyDrinking(val[51]);
					}

					if ("是".equals(val[52])) {
						ventity.setEveryTimeOutdoors("半小时");
					} else if ("是".equals(val[53])) {
						ventity.setEveryTimeOutdoors("1小时");
					} else if ("是".equals(val[54])) {
						ventity.setEveryTimeOutdoors("2小时");
					} else if ("是".equals(val[55])) {
						ventity.setEveryTimeOutdoors("2小时以上");
					} else if ("是".equals(val[56])) {
						ventity.setEveryTimeOutdoors("无");
					}

				//	String cs=val[5]+val[57];
					ventity.setCheckSequence(val[57]);
				//	ventity.setCheckSequence(cs);  //检查序列
				//	System.out.println("设置检查序列成功！且序列号为："+cs);
					
					//处理导入时的录入日期格式问题2016-1-30
					//val[58]=val[58].replace("/", "-");
					//val[58]=val[58].replace(".", "-");
					val[58] = getProperDate.makeProperDate(val[58]);
					DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
					Date dt;
					try {
						dt = df.parse(val[58]);			//转换为时间格式，再转为给定标准格式
						ventity.setCheckTime(df.format(dt).toString());
					}catch (ParseException e) {
						// TODO Auto-generated catch block
						//e.printStackTrace();
						System.out.println("日期转换错误！");
						Date nowtime = new Date();
						ventity.setCheckTime(df.format(nowtime));
					}
					
					//ventity.setCheckTime(val[58]);
					ventity.setCompanion(val[59]);  //监护人
					ventity.setCheckTheDataExaminer(val[60]);
					// 视力检查
					ventity.setVisualInspectionExaminer(val[80]);
					ventity.setVisualIinspectionInspectionEquipment(val[61]);
					ventity.setVisualInspectionSerialNumber(val[62]);
					ventity.setVisualInspectionDetectionTime(val[63]);

					
					try{
						Double.parseDouble(val[65]);		//分别表示左右眼睛的小数值、视功能值
						Double.parseDouble(val[66]);
						//Double.parseDouble(val[67]);
						Double.parseDouble(val[73]);
						Double.parseDouble(val[74]);
						//Double.parseDouble(val[75]);
					}
					catch(Exception e){
						flag_v=false;
						System.out.println("第"+i+"行视力、视功能记录错误！姓名为："+uentity.getRealname());
						errorList.add(i+1);
						errorReason.add("视力、视功能数值错误");
						if(flag_u){
							actualrows++;
						}
						continue;		//继续下一条记录
					}

					ventity.setRightEyeDetectionEnvironment(val[64]);
					ventity.setRightEyeLittleValue(val[65]);
					ventity.setRightEyeVisualFunction(val[66]);
					ventity.setRightEyeSpeed(val[67]);
					ventity.setRightEyeDetectionEnvironmentSecond(val[68]);
					ventity.setRightEyeLittleValueSecond(val[69]);
					ventity.setRightEyeVisualFunctionSecond(val[70]);
					ventity.setRightEyeSpeedSecond(val[71]);
					
					
					
					ventity.setLeftEyeDetectionEnvironment(val[72]);
					ventity.setLeftEyeLittleValue(val[73]);
					ventity.setLeftEyeVisualFunction(val[74]);
					ventity.setLeftEyeSpeed(val[75]);
					ventity.setLeftEyeDetectionEnvironmentSecond(val[76]);
					ventity.setLeftEyeLittleValueSecond(val[77]);
					ventity.setLeftEyeVisualFunctionSecond(val[78]);
					ventity.setLeftEyeSpeedSecond(val[79]);
					
					

					//System.out.println("开始进行屈光检查！");
					// 屈光检查
					ventity.setRefractionInspectionEquipment(val[81]);
					ventity.setRefractiveCheckTheSerialNumber(val[82]);
					ventity.setRefractionDetectionTime(val[83]);
					ventity.setRefractionDetectionVd(val[84]);
					ventity.setRefractionDetectionCyl(val[85]);
					ventity.setRefractionDetectionExaminer(val[86]);
					ventity.setRefractionDetectionIpd(val[87]);

					ventity.setRightEyeSphericalLens(val[88]);
					ventity.setRightCylinder(val[89]);
					ventity.setRightCylinderAxial(val[90]);
					ventity.setRightEyeSphericalLensSecond(val[91]);
					ventity.setRightCylinderSecond(val[92]);
					ventity.setRightCylinderAxialSecond(val[93]);
					ventity.setRightEyeSphericalLensThird(val[94]);
					ventity.setRightCylinderThird(val[95]);
					ventity.setRightCylinderAxialThird(val[96]);
					ventity.setRefractionRightEyeAverages(val[97]);
					ventity.setRightEyeRetinoscopy(val[98]);
					ventity.setRightEyeNearVision(val[99]);
					ventity.setRightEyeSpectaclesDegrees(val[100]);
					ventity.setRightEyeVisionCorrection(val[101]);
					ventity.setRightAnteriorAxialLength(val[102]);

					ventity.setLeftEyeSphericalLens(val[103]);
					ventity.setLeftCylinder(val[104]);
					ventity.setLeftCylinderAxial(val[105]);
					ventity.setLeftEyeSphericalLensSecond(val[106]);
					ventity.setLeftCylinderSecond(val[107]);
					ventity.setLeftCylinderAxialSecond(val[108]);
					ventity.setLeftEyeSphericalLensThird(val[109]);
					ventity.setLeftCylinderThird(val[110]);
					ventity.setLeftCylinderAxialThird(val[111]);
					ventity.setRefractionLeftEyeAverages(val[112]);
					ventity.setLeftEyeRetinoscopy(val[113]);
					ventity.setLeftEyeNearVision(val[114]);
					ventity.setLeftEyeSpectaclesDegrees(val[115]);
					ventity.setLeftEyeVisionCorrection(val[116]);
					ventity.setLeftAnteriorAxialLength(val[117]);

					//System.out.println("开始进行眼压检查！");
					// /眼压检查
					ventity.setOcularInspectionEquipment(val[118]);
					ventity.setIopcheckTheSerialNumber(val[119]);
					ventity.setOcularInspectionDetectionTime(val[120]);
					ventity.setLeftEyeFirstIop(val[121]);
					ventity.setRightEyeFirstIop(val[122]);
					ventity.setLeftEyeSecondIop(val[123]);
					ventity.setRightEyeSecondIop(val[124]);
					ventity.setLeftEyeThirdIop(val[125]);
					ventity.setRightEyeThirdIop(val[126]);
					ventity.setLeftEyeFourthIop(val[127]);
					ventity.setRightEyeFourthIop(val[128]);
					ventity.setLeftEyeTheMeanIop(val[129]);
					ventity.setRightEyeTheMeanIop(val[130]);
					

					if ("是".equals(val[131])) {
						ventity.setBinocularVision("跟随");
					} else if ("是".equals(val[132])) {
						ventity.setBinocularVision("扫视");
					} else if ("是".equals(val[133])) {
						ventity.setBinocularVision("记忆");
					}
					ventity.setLeftEyePosition(val[134]);
					ventity.setRightEyePosition(val[135]);
					ventity.setLeftEyeMuscle(val[136]);
					ventity.setRightEyeMuscle(val[137]);
					ventity.setLeftEyelid(val[138]);
					ventity.setRightEyelid(val[139]);
					ventity.setLeftEyeLacrimalApparatus(val[140]);
					ventity.setRightEyeLacrimalApparatus(val[141]);
					ventity.setLeftEyeConjunctiva(val[142]);
					ventity.setRightEyeConjunctiva(val[143]);
					ventity.setLeftEyeSclera(val[144]);
					ventity.setRightEyeSclera(val[145]);
					ventity.setLeftEyePupil(val[146]);
					ventity.setRightEyePupil(val[147]);
					ventity.setLeftEyeCornea(val[148]);
					ventity.setRightEyeCornea(val[149]);
					ventity.setLeftEyeAnteriorChamber(val[150]);
					ventity.setRightAnteriorAxialLength(val[151]);
					ventity.setLeftEyeCrystal(val[152]);
					ventity.setRightEyeCrystal(val[153]);
					ventity.setLeftEyeFundus(val[154]);
					ventity.setRightEyeFundus(val[155]);
					ventity.setLeftEyeOther(val[156]);
					ventity.setRightEyeOther(val[157]);
					if(val.length<162){
						ventity.setDoublecare("");
					}
					else{
						ventity.setDoublecare(val[161]);
					}
					//ventity.setVisionlevel("import");
				//////计算视觉等级
					state = -2;
					state_Left=-2;
					state_Right=-2;		//存放视觉状态，1表示正常，0表示预警，-1表示异常，-2表示未知，2表示错误
					
					try{
						int age = now.get(Calendar.YEAR)  - Integer.parseInt(val[9].substring(0, 4));
						//for(int j=0;j<agevalue.length;j++){		//将错误年龄抛出异常
						//	System.out.print(Integer.parseInt(agevalue[j]));
						//}
						temp=Math.abs( Math.log10(1/Double.parseDouble(val[73]))-Math.log10(1/Double.parseDouble(val[65])) );
						//System.out.println("temp为："+temp);
						if( Double.isNaN(temp) || Double.isInfinite(temp) ){		//如果temp计算结果异常，则置为错误，状态2
							state = 2;
						}
						else if(temp>=0.2){
							state = -1;
						}
						else{
							state_Left=IsVisualFunctionNormal(Double.parseDouble(val[73]),Double.parseDouble(val[74]),age);
							state_Right=IsVisualFunctionNormal(Double.parseDouble(val[65]),Double.parseDouble(val[66]),age);
							if(state_Left==-1 || state_Right==-1){
								state=-1;
							}
							else if(state_Left==3 || state_Right==3){
								state=3;
							}
							else if(state_Left==0 || state_Right==0){
								state=0;
							}
							else{
								state=1;
							}
							
						}
					}catch(Exception e){
						//e.printStackTrace();
						flag_v=false;
						state = 2;
						System.out.println("用户名为："+val[5]+"的学生视觉错误！");
						errorList.add(i+1);
						errorReason.add("其他错误1");
						if(flag_u){
							actualrows++;
						}
						continue;
					}
//					String[] visionstate= new String[]{"未知","异常","预警","正常","错误"};
					
					ventity.setVisionlevel(visionstate[state+2]);
					
					String hql2="from Visioncheck v where v.username=? and v.leftEyeLittleValue=? and v.leftEyeVisualFunction=? " +
							" and v.rightEyeLittleValue=? and v.rightEyeVisualFunction=? and v.visionlevel=? and v.checkTime=? ";
					String[] v2=new String[]{ventity.getUsername(), ventity.getLeftEyeLittleValue() , ventity.getLeftEyeVisualFunction() ,
							 ventity.getRightEyeLittleValue() , ventity.getRightEyeVisualFunction() , ventity.getVisionlevel() , ventity.getCheckTime()};
					//v1[0]=uentity.getUsername();
					List<Visioncheck> tempv=visioncheckService.findInfo(hql2, v2);
					if(tempv.size()>0){
						flag_v=false;
						System.out.println("发现该用户有重复的视觉档案！");
						errorList.add(i+1);
						errorReason.add("视觉档案重复");
						if(flag_u){
							actualrows++;
						}
						continue;		//继续下一条记录
					}
					else{
						flag_v=true;
						visioncheckService.save(ventity);
					}
					if(flag_u || flag_v){		//true
						actualrows++;
					}

					System.out.println("完成全部检查！");
					
//					System.out.println("val[160]为："+val[160]);
					if (!"/".equals(val[160])) {
//						String[] va = new String[1];
//						va[0] = ventity.getCheckSequence();
//						List<Visioncheck> tempvlist = visioncheckService.findInfo("from Visioncheck v where v.checkSequence=?", va);
//						Visioncheck tempv = tempvlist.get(0);
//						Assessments tempass = new Assessments();
//						tempass.setTableId(tempv.getTableId());
//						tempass.setSpecialistName(val[160]);
//						tempass.setAssessment("诊断:" + val[158] + " 建议:" + val[159]);
//						assessmentsService.save(tempass);
						
						//修改医生诊断逻辑 2016.05.23
						Assessments tempass = new Assessments();
						tempass.setTableId(ventity.getTableId());
						tempass.setSpecialistName(val[160]);
						tempass.setAssessment("诊断:" + val[158] + " 建议:" + val[159]);
						assessmentsService.save(tempass);

						String[] values = new String[2];
//						values[0] = tempv.getUsername();
						values[0] = ventity.getUsername();
						values[1] = val[160];
						List<Authorizerelation> ta = authorizerelationService.findInfo(
								" from Authorizerelation a where a.username=? and a.specialistName=? ", values);
						if (ta.size() <= 0) {
							Authorizerelation te = new Authorizerelation();
							te.setUsername(values[0]);
							te.setSpecialistName(values[1]);
							te.setIsAgreed("是");
							authorizerelationService.save(te);
						}
					}
					else{
						//修改医生诊断逻辑，设置默认校医 2016.05.23
						Assessments tempass = new Assessments();
						tempass.setTableId(ventity.getTableId());
						tempass.setSpecialistName("DEFAULT_DOCTOR");
						tempass.setAssessment("诊断:" + val[158] + " 建议:" + val[159]);
						assessmentsService.save(tempass);
						
						String[] values = new String[2];
						values[0] = ventity.getUsername();
						values[1] = "DEFAULT_DOCTOR";
						List<Authorizerelation> ta = authorizerelationService.findInfo(
								" from Authorizerelation a where a.username=? and a.specialistName=? ", values);
						if (ta.size() <= 0) {
							Authorizerelation te = new Authorizerelation();
							te.setUsername(values[0]);
							te.setSpecialistName(values[1]);
							te.setIsAgreed("是");
							authorizerelationService.save(te);
						}
					}
					
//					if(!flag){
//						System.out.println("第"+i+"行记录的视觉档案错误！姓名为："+uentity.getRealname());
//						errorList.add(i+1);
//						errorReason.add("未知错误");
//						continue;		//继续下一条记录
//					}

				}
			}
			
			for(int j=0;j<errorList.size();j++){
				System.out.print("错误信息有第："+errorList.get(j)+"行！");
				System.out.println("\t错误原因为："+errorReason.get(j)+"！");
			}
			for(int k=0;k<similarList.size();k++){
				System.out.print("发现相似用户第："+similarList.get(k)+"行！");
				System.out.println("\t相似用户为："+similarReason.get(k)+"！");
				
			}
			return SUCCESS;
//			return null;
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ERROR;
	}
	
	
	//手机客户端登录。2016-8-26
	public String personalVisionInfo(){
		System.out.println("This is personalVisionInfo() of CommunityVisionInfoAction!");
		System.out.println("接收到的参数tableId为："+tableId);
		
		//String hql = "from Userinfo u where u.phone=? and u.idNumber=?";
		String hql = "from Visioncheck v where v.tableId=?";
		Integer[] values = new Integer[] { tableId };
		list = visioncheckService.findInfo(hql, values);
		System.out.println("list.size()为："+list.size());
		
		String[] visionstate= new String[]{"未知","异常","预警","正常","错误","亚健康"};
		int state_Left=-2,state_Right=-2;		//存放视觉状态，1表示正常，0表示预警，-1表示异常，-2表示未知，2表示错误，3表示亚健康 2016-07-13
		
		if(list.size()>0){
			Visioncheck visioncheck = (Visioncheck)list.get(0);
			ActionContext ac = ActionContext.getContext();
			ac.put("visioncheck", visioncheck);
			
			req = ServletActionContext.getRequest();
			Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
			System.out.println("u为："+u.getRealname()+"\t"+u.getAge());
			
			Calendar now = Calendar.getInstance();
			int age = now.get(Calendar.YEAR) - Integer.parseInt(u.getAge().substring(0, 4));
			if(visioncheck.getVisionlevel().equals("异常")){
				state_Left=-1;
				state_Right=-1;
			}
			else if(visioncheck.getVisionlevel().equals("错误")){
				state_Left=2;
				state_Right=2;
			}
			else{
				try{
					state_Left=IsVisualFunctionNormal(Double.parseDouble(visioncheck.getLeftEyeLittleValue()),Double.parseDouble(visioncheck.getLeftEyeVisualFunction()),age);
					state_Right=IsVisualFunctionNormal(Double.parseDouble(visioncheck.getRightEyeLittleValue()),Double.parseDouble(visioncheck.getRightEyeVisualFunction()),age);
				}
				catch(Exception e){
					System.out.println("视觉等级转换错误！");
					state_Left=2;
					state_Right=2;
				}
			}
			
			req.getSession().setAttribute("age",age);
			req.getSession().setAttribute("state_Left",visionstate[state_Left+2]);
			req.getSession().setAttribute("state_Right",visionstate[state_Right+2]);
			
			String advice="";
			if(visioncheck.getVisionlevel().equals("异常")){
				advice=	"1、视觉质量差，建议到专业医疗机构进行进一步检查；</br>"+
						"2、改善用眼习惯与环境，加强眼保健，争取改善视力状况；</br>"+
						"3、减少电子产品的使用时间，多做亮睛操；</br>"+
						"4、均衡饮食，多做户外活动；</br>"+
						"5、在医院治疗后保持3~6个月一次的复查频率，密切关注视觉质量的变化。";
			}
			else if(visioncheck.getVisionlevel().equals("预警")){
				advice=	"1、视觉质量欠佳，改善用眼习惯与环境，加强眼保健，争取改善视力状况；</br>"+
						"2、均衡饮食，多做户外活动；</br>"+
						"3、减少电子产品的使用时间，多做亮睛操；</br>"+
						"4、保持2~3个月一次的复查频率，密切关注视觉质量的变化。";
			}
			else if(visioncheck.getVisionlevel().equals("正常")){
				advice= "1、鼓励继续保持良好的用眼卫生与习惯，坚持科学保健；</br>"+
						"2、尽量减少电子产品的使用时间；</br>"+
						"3、均衡饮食，多做户外活动；</br>"+
						"4、保持3~6个月一次的复查频率，密切关注视觉质量的变化。";
			}
			else if(visioncheck.getVisionlevel().equals("亚健康")){
				advice= "1、视觉质量欠佳，建议到专业医疗机构进行进一步检查；</br>"+
						"2、改善用眼习惯与环境，加强眼保健，争取改善视力状况；</br>"+
						"3、均衡饮食，多做户外活动；</br>"+
						"4、减少电子产品的使用时间，多做亮睛操；</br>"+
						"5、保持2~3个月一次的复查频率，密切关注视觉质量的变化。";
			}
			else{
				advice= "暂无。";
			}
			req.getSession().setAttribute("advice",advice);
			
			
			
			
			double StandEyeValue;		//视力标准值
			if(age>=0 && age<5){
				StandEyeValue=0.45;
			}
			else if(age>=5 && age<8){
				StandEyeValue=0.55;
			}
			else if(age>=8 && age<12){
				StandEyeValue=0.7;
			}
			else if(age>=12 && age<150){
				StandEyeValue=0.9;
			}
			else{
				StandEyeValue=0;
			}
			req.getSession().setAttribute("StandEyeValue",StandEyeValue);
			
			String StandAnteriorAxialLength;		//眼轴标准值
			if(age>=0 && age<18){
				StandAnteriorAxialLength="18mm";
			}
			else if(age>=18 && age<150){
				StandAnteriorAxialLength="23mm";
			}
			else{
				StandAnteriorAxialLength="0";
			}
			req.getSession().setAttribute("StandAnteriorAxialLength",StandAnteriorAxialLength);
			
			String StandRefractionEyeAverages;		//屈光标准值
			if(age>=0 && age<3){
				StandRefractionEyeAverages="3.00D";
			}
			else if(age>=3 && age<8){
				StandRefractionEyeAverages="2.00D";
			}
			else if(age>=8 && age<12){
				StandRefractionEyeAverages="1.50D";
			}
			else if(age>=12 && age<18){
				StandRefractionEyeAverages="1.00D";
			}
			else if(age>=18 && age<150){
				StandRefractionEyeAverages="0.75D";
			}
			else{
				StandRefractionEyeAverages="0";
			}
			req.getSession().setAttribute("StandRefractionEyeAverages",StandRefractionEyeAverages);
			
			
			
			
			
//			String hql2 = "from Userinfo u where u.username=?";
//			String[] values2 = new String[] { visioncheck.getUsername() };
//			List templist = userinfoService.findInfo(hql2, values2);
//			if(templist.size()>0){
//				Userinfo userinfo = (Userinfo)templist.get(0);
//				System.out.println("userinfo为："+userinfo.getRealname()+"\t"+userinfo.getAge());
//			}
		}
		return SUCCESS;
	}
	
	
	
	
	
	
	
	
	
	
	///******************************判断每个学生视力是否正常
	private int IsVisualFunctionNormal(double EyeValue,double VisualFunction,int age){
		//System.out.println("EyeValue:"+EyeValue+"\tVisualFunction:"+VisualFunction+"\tage"+age);
		if(!IsAgeLegal(EyeValue,age)){
			return -1;
			//return con_abnor;
		}
		else if(VisualFunction<=0.36){
			return 1;
			//System.out.println(con_normal);
			//return con_normal;
		}
		else if(VisualFunction>0.36 && VisualFunction<=0.46){
			return 0;
			//return con_warn;
		}
		else //if(VisualFunction>0.45)
			{
			return 3;
			//return con_abnor;
			}
	}
	
///******************************判断每个学生年龄是否合法	
	private boolean IsAgeLegal(double EyeValue,int age){
		if(age>=0 && age<5){
			if(EyeValue>=0.45)	//EyeValue>=0.5，2016-6-20修改阈值
				return true;
			else
				return false;
		}
		else if(age>=5 && age<8){
			if(EyeValue>=0.55)	//EyeValue>=0.5
				return true;
			else
				return false;
		}
		else if(age>=8 && age<12){
			if(EyeValue>=0.7)	//EyeValue>=0.8
				return true;
			else
				return false;
		}
		else if(age>=12 && age<150){
			if(EyeValue>=0.9)	//EyeValue>=1.0
				return true;
			else
				return false;
		}
		else
			return false;
	}
	
	public String checkProcess(){
		System.out.println("This is checkProcess() of CommunityVisionInfoAction!");
		System.out.println("currentrows:"+currentrows+"\ttotalrows:"+totalrows);
		return "success";
	}
	
	public String stopImport(){
		System.out.println("This is stopImport() of CommunityVisionInfoAction!");	//停止当前上传进度
		return "success";
	}

}
