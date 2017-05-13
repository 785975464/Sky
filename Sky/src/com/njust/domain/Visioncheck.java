package com.njust.domain;

/**
 * Visioncheck entity. @author MyEclipse Persistence Tools
 */

public class Visioncheck implements java.io.Serializable {

	// Fields

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
	private String doublecare;		//新增双倍关怀计划 2015-1-5
	private String visionlevel;		//新增视觉等级 2015-1-12
	private String theDailyDrinking;
	private String everyTimeOutdoors;
	private String checkSequence;
	private String checkTime;
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

	// Constructors

	/** default constructor */
	public Visioncheck() {
	}

	/** full constructor */
	public Visioncheck(String username, String recorder, String recordTime, String refractiveCorrectionMethod,
			String theNumberOfAnnualEyeCheck, String birthSituation, String moreThan600degreesOfMyopiaRelatives, String drugAllergies,
			String medicalHistory, String everyTimeTheElectronicProducts, String continuousAsTheRecentBreak, String diet, String doublecare,String visionlevel,
			String theDailyDrinking, String everyTimeOutdoors, String checkSequence, String checkTime, String companion,
			String checkTheDataExaminer, String visualIinspectionInspectionEquipment, String visualInspectionSerialNumber,
			String visualInspectionDetectionTime, String leftEyeDetectionEnvironment, String leftEyeLittleValue,
			String leftEyeVisualFunction, String leftEyeSpeed, String leftEyeDetectionEnvironmentSecond, String leftEyeLittleValueSecond,
			String leftEyeVisualFunctionSecond, String leftEyeSpeedSecond, String rightEyeDetectionEnvironment, String rightEyeLittleValue,
			String rightEyeVisualFunction, String rightEyeSpeed, String rightEyeDetectionEnvironmentSecond,
			String rightEyeLittleValueSecond, String rightEyeVisualFunctionSecond, String rightEyeSpeedSecond,
			String visualInspectionExaminer, String refractionInspectionEquipment, String refractiveCheckTheSerialNumber,
			String refractionDetectionTime, String refractionDetectionVd, String refractionDetectionCyl,
			String refractionDetectionExaminer, String refractionDetectionIpd, String leftEyeSphericalLens, String leftCylinder,
			String leftCylinderAxial, String leftEyeSphericalLensSecond, String leftCylinderSecond, String leftCylinderAxialSecond,
			String leftEyeSphericalLensThird, String leftCylinderThird, String leftCylinderAxialThird, String refractionLeftEyeAverages,
			String leftEyeRetinoscopy, String leftEyeNearVision, String leftEyeSpectaclesDegrees, String leftEyeVisionCorrection,
			String leftAnteriorAxialLength, String rightEyeSphericalLens, String rightCylinder, String rightCylinderAxial,
			String rightEyeSphericalLensSecond, String rightCylinderSecond, String rightCylinderAxialSecond,
			String rightEyeSphericalLensThird, String rightCylinderThird, String rightCylinderAxialThird,
			String refractionRightEyeAverages, String rightEyeRetinoscopy, String rightEyeNearVision, String rightEyeSpectaclesDegrees,
			String rightEyeVisionCorrection, String rightAnteriorAxialLength, String ocularInspectionEquipment,
			String iopcheckTheSerialNumber, String ocularInspectionDetectionTime, String leftEyeFirstIop, String rightEyeFirstIop,
			String leftEyeSecondIop, String rightEyeSecondIop, String leftEyeThirdIop, String rightEyeThirdIop, String leftEyeFourthIop,
			String rightEyeFourthIop, String leftEyeTheMeanIop, String rightEyeTheMeanIop, String binocularVision, String leftEyePosition,
			String rightEyePosition, String leftEyeMuscle, String rightEyeMuscle, String leftEyelid, String rightEyelid,
			String leftEyeLacrimalApparatus, String rightEyeLacrimalApparatus, String leftEyeConjunctiva, String rightEyeConjunctiva,
			String leftEyeSclera, String rightEyeSclera, String leftEyePupil, String rightEyePupil, String leftEyeCornea,
			String rightEyeCornea, String leftEyeAnteriorChamber, String rightEyeAnteriorChamber, String leftEyeCrystal,
			String rightEyeCrystal, String leftEyeFundus, String rightEyeFundus, String leftEyeOther, String rightEyeOther) {
		this.username = username;
		this.recorder = recorder;
		this.recordTime = recordTime;
		this.refractiveCorrectionMethod = refractiveCorrectionMethod;
		this.theNumberOfAnnualEyeCheck = theNumberOfAnnualEyeCheck;
		this.birthSituation = birthSituation;
		this.moreThan600degreesOfMyopiaRelatives = moreThan600degreesOfMyopiaRelatives;
		this.drugAllergies = drugAllergies;
		this.medicalHistory = medicalHistory;
		this.everyTimeTheElectronicProducts = everyTimeTheElectronicProducts;
		this.continuousAsTheRecentBreak = continuousAsTheRecentBreak;
		this.diet = diet;
		this.theDailyDrinking = theDailyDrinking;
		this.everyTimeOutdoors = everyTimeOutdoors;
		this.checkSequence = checkSequence;
		this.checkTime = checkTime;
		this.doublecare = doublecare;
		this.visionlevel = visionlevel;
		this.companion = companion;
		this.checkTheDataExaminer = checkTheDataExaminer;
		this.visualIinspectionInspectionEquipment = visualIinspectionInspectionEquipment;
		this.visualInspectionSerialNumber = visualInspectionSerialNumber;
		this.visualInspectionDetectionTime = visualInspectionDetectionTime;
		this.leftEyeDetectionEnvironment = leftEyeDetectionEnvironment;
		this.leftEyeLittleValue = leftEyeLittleValue;
		this.leftEyeVisualFunction = leftEyeVisualFunction;
		this.leftEyeSpeed = leftEyeSpeed;
		this.leftEyeDetectionEnvironmentSecond = leftEyeDetectionEnvironmentSecond;
		this.leftEyeLittleValueSecond = leftEyeLittleValueSecond;
		this.leftEyeVisualFunctionSecond = leftEyeVisualFunctionSecond;
		this.leftEyeSpeedSecond = leftEyeSpeedSecond;
		this.rightEyeDetectionEnvironment = rightEyeDetectionEnvironment;
		this.rightEyeLittleValue = rightEyeLittleValue;
		this.rightEyeVisualFunction = rightEyeVisualFunction;
		this.rightEyeSpeed = rightEyeSpeed;
		this.rightEyeDetectionEnvironmentSecond = rightEyeDetectionEnvironmentSecond;
		this.rightEyeLittleValueSecond = rightEyeLittleValueSecond;
		this.rightEyeVisualFunctionSecond = rightEyeVisualFunctionSecond;
		this.rightEyeSpeedSecond = rightEyeSpeedSecond;
		this.visualInspectionExaminer = visualInspectionExaminer;
		this.refractionInspectionEquipment = refractionInspectionEquipment;
		this.refractiveCheckTheSerialNumber = refractiveCheckTheSerialNumber;
		this.refractionDetectionTime = refractionDetectionTime;
		this.refractionDetectionVd = refractionDetectionVd;
		this.refractionDetectionCyl = refractionDetectionCyl;
		this.refractionDetectionExaminer = refractionDetectionExaminer;
		this.refractionDetectionIpd = refractionDetectionIpd;
		this.leftEyeSphericalLens = leftEyeSphericalLens;
		this.leftCylinder = leftCylinder;
		this.leftCylinderAxial = leftCylinderAxial;
		this.leftEyeSphericalLensSecond = leftEyeSphericalLensSecond;
		this.leftCylinderSecond = leftCylinderSecond;
		this.leftCylinderAxialSecond = leftCylinderAxialSecond;
		this.leftEyeSphericalLensThird = leftEyeSphericalLensThird;
		this.leftCylinderThird = leftCylinderThird;
		this.leftCylinderAxialThird = leftCylinderAxialThird;
		this.refractionLeftEyeAverages = refractionLeftEyeAverages;
		this.leftEyeRetinoscopy = leftEyeRetinoscopy;
		this.leftEyeNearVision = leftEyeNearVision;
		this.leftEyeSpectaclesDegrees = leftEyeSpectaclesDegrees;
		this.leftEyeVisionCorrection = leftEyeVisionCorrection;
		this.leftAnteriorAxialLength = leftAnteriorAxialLength;
		this.rightEyeSphericalLens = rightEyeSphericalLens;
		this.rightCylinder = rightCylinder;
		this.rightCylinderAxial = rightCylinderAxial;
		this.rightEyeSphericalLensSecond = rightEyeSphericalLensSecond;
		this.rightCylinderSecond = rightCylinderSecond;
		this.rightCylinderAxialSecond = rightCylinderAxialSecond;
		this.rightEyeSphericalLensThird = rightEyeSphericalLensThird;
		this.rightCylinderThird = rightCylinderThird;
		this.rightCylinderAxialThird = rightCylinderAxialThird;
		this.refractionRightEyeAverages = refractionRightEyeAverages;
		this.rightEyeRetinoscopy = rightEyeRetinoscopy;
		this.rightEyeNearVision = rightEyeNearVision;
		this.rightEyeSpectaclesDegrees = rightEyeSpectaclesDegrees;
		this.rightEyeVisionCorrection = rightEyeVisionCorrection;
		this.rightAnteriorAxialLength = rightAnteriorAxialLength;
		this.ocularInspectionEquipment = ocularInspectionEquipment;
		this.iopcheckTheSerialNumber = iopcheckTheSerialNumber;
		this.ocularInspectionDetectionTime = ocularInspectionDetectionTime;
		this.leftEyeFirstIop = leftEyeFirstIop;
		this.rightEyeFirstIop = rightEyeFirstIop;
		this.leftEyeSecondIop = leftEyeSecondIop;
		this.rightEyeSecondIop = rightEyeSecondIop;
		this.leftEyeThirdIop = leftEyeThirdIop;
		this.rightEyeThirdIop = rightEyeThirdIop;
		this.leftEyeFourthIop = leftEyeFourthIop;
		this.rightEyeFourthIop = rightEyeFourthIop;
		this.leftEyeTheMeanIop = leftEyeTheMeanIop;
		this.rightEyeTheMeanIop = rightEyeTheMeanIop;
		this.binocularVision = binocularVision;
		this.leftEyePosition = leftEyePosition;
		this.rightEyePosition = rightEyePosition;
		this.leftEyeMuscle = leftEyeMuscle;
		this.rightEyeMuscle = rightEyeMuscle;
		this.leftEyelid = leftEyelid;
		this.rightEyelid = rightEyelid;
		this.leftEyeLacrimalApparatus = leftEyeLacrimalApparatus;
		this.rightEyeLacrimalApparatus = rightEyeLacrimalApparatus;
		this.leftEyeConjunctiva = leftEyeConjunctiva;
		this.rightEyeConjunctiva = rightEyeConjunctiva;
		this.leftEyeSclera = leftEyeSclera;
		this.rightEyeSclera = rightEyeSclera;
		this.leftEyePupil = leftEyePupil;
		this.rightEyePupil = rightEyePupil;
		this.leftEyeCornea = leftEyeCornea;
		this.rightEyeCornea = rightEyeCornea;
		this.leftEyeAnteriorChamber = leftEyeAnteriorChamber;
		this.rightEyeAnteriorChamber = rightEyeAnteriorChamber;
		this.leftEyeCrystal = leftEyeCrystal;
		this.rightEyeCrystal = rightEyeCrystal;
		this.leftEyeFundus = leftEyeFundus;
		this.rightEyeFundus = rightEyeFundus;
		this.leftEyeOther = leftEyeOther;
		this.rightEyeOther = rightEyeOther;
	}

	// Property accessors

	public Integer getTableId() {
		return this.tableId;
	}

	public void setTableId(Integer tableId) {
		this.tableId = tableId;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getRecorder() {
		return this.recorder;
	}

	public void setRecorder(String recorder) {
		this.recorder = recorder;
	}

	public String getRecordTime() {
		return this.recordTime;
	}

	public void setRecordTime(String recordTime) {
		this.recordTime = recordTime;
	}

	public String getRefractiveCorrectionMethod() {
		return this.refractiveCorrectionMethod;
	}

	public void setRefractiveCorrectionMethod(String refractiveCorrectionMethod) {
		this.refractiveCorrectionMethod = refractiveCorrectionMethod;
	}

	public String getTheNumberOfAnnualEyeCheck() {
		return this.theNumberOfAnnualEyeCheck;
	}

	public void setTheNumberOfAnnualEyeCheck(String theNumberOfAnnualEyeCheck) {
		this.theNumberOfAnnualEyeCheck = theNumberOfAnnualEyeCheck;
	}

	public String getBirthSituation() {
		return this.birthSituation;
	}

	public void setBirthSituation(String birthSituation) {
		this.birthSituation = birthSituation;
	}

	public String getMoreThan600degreesOfMyopiaRelatives() {
		return this.moreThan600degreesOfMyopiaRelatives;
	}

	public void setMoreThan600degreesOfMyopiaRelatives(String moreThan600degreesOfMyopiaRelatives) {
		this.moreThan600degreesOfMyopiaRelatives = moreThan600degreesOfMyopiaRelatives;
	}

	public String getDrugAllergies() {
		return this.drugAllergies;
	}

	public void setDrugAllergies(String drugAllergies) {
		this.drugAllergies = drugAllergies;
	}

	public String getMedicalHistory() {
		return this.medicalHistory;
	}

	public void setMedicalHistory(String medicalHistory) {
		this.medicalHistory = medicalHistory;
	}

	public String getEveryTimeTheElectronicProducts() {
		return this.everyTimeTheElectronicProducts;
	}

	public void setEveryTimeTheElectronicProducts(String everyTimeTheElectronicProducts) {
		this.everyTimeTheElectronicProducts = everyTimeTheElectronicProducts;
	}

	public String getContinuousAsTheRecentBreak() {
		return this.continuousAsTheRecentBreak;
	}

	public void setContinuousAsTheRecentBreak(String continuousAsTheRecentBreak) {
		this.continuousAsTheRecentBreak = continuousAsTheRecentBreak;
	}

	public String getDiet() {
		return this.diet;
	}

	public void setDiet(String diet) {
		this.diet = diet;
	}

	//新增双倍关怀计划 2015-1-5
	public String getDoublecare() {
		return this.doublecare;
	}
	public void setDoublecare(String doublecare) {
		this.doublecare = doublecare;
	}
	
	//新增视觉等级 2015-1-12
	public String getVisionlevel() {
		return this.visionlevel;
	}
	public void setVisionlevel(String visionlevel) {
		this.visionlevel = visionlevel;
	}
	
	public String getTheDailyDrinking() {
		return this.theDailyDrinking;
	}

	public void setTheDailyDrinking(String theDailyDrinking) {
		this.theDailyDrinking = theDailyDrinking;
	}

	public String getEveryTimeOutdoors() {
		return this.everyTimeOutdoors;
	}

	public void setEveryTimeOutdoors(String everyTimeOutdoors) {
		this.everyTimeOutdoors = everyTimeOutdoors;
	}

	public String getCheckSequence() {
		return this.checkSequence;
	}

	public void setCheckSequence(String checkSequence) {
		this.checkSequence = checkSequence;
	}

	public String getCheckTime() {
		return this.checkTime;
	}

	public void setCheckTime(String checkTime) {
		this.checkTime = checkTime;
	}
	
	public String getCompanion() {
		return this.companion;
	}

	public void setCompanion(String companion) {
		this.companion = companion;
	}

	public String getCheckTheDataExaminer() {
		return this.checkTheDataExaminer;
	}

	public void setCheckTheDataExaminer(String checkTheDataExaminer) {
		this.checkTheDataExaminer = checkTheDataExaminer;
	}

	public String getVisualIinspectionInspectionEquipment() {
		return this.visualIinspectionInspectionEquipment;
	}

	public void setVisualIinspectionInspectionEquipment(String visualIinspectionInspectionEquipment) {
		this.visualIinspectionInspectionEquipment = visualIinspectionInspectionEquipment;
	}

	public String getVisualInspectionSerialNumber() {
		return this.visualInspectionSerialNumber;
	}

	public void setVisualInspectionSerialNumber(String visualInspectionSerialNumber) {
		this.visualInspectionSerialNumber = visualInspectionSerialNumber;
	}

	public String getVisualInspectionDetectionTime() {
		return this.visualInspectionDetectionTime;
	}

	public void setVisualInspectionDetectionTime(String visualInspectionDetectionTime) {
		this.visualInspectionDetectionTime = visualInspectionDetectionTime;
	}

	public String getLeftEyeDetectionEnvironment() {
		return this.leftEyeDetectionEnvironment;
	}

	public void setLeftEyeDetectionEnvironment(String leftEyeDetectionEnvironment) {
		this.leftEyeDetectionEnvironment = leftEyeDetectionEnvironment;
	}

	public String getLeftEyeLittleValue() {
		return this.leftEyeLittleValue;
	}

	public void setLeftEyeLittleValue(String leftEyeLittleValue) {
		this.leftEyeLittleValue = leftEyeLittleValue;
	}

	public String getLeftEyeVisualFunction() {
		return this.leftEyeVisualFunction;
	}

	public void setLeftEyeVisualFunction(String leftEyeVisualFunction) {
		this.leftEyeVisualFunction = leftEyeVisualFunction;
	}

	public String getLeftEyeSpeed() {
		return this.leftEyeSpeed;
	}

	public void setLeftEyeSpeed(String leftEyeSpeed) {
		this.leftEyeSpeed = leftEyeSpeed;
	}

	public String getLeftEyeDetectionEnvironmentSecond() {
		return this.leftEyeDetectionEnvironmentSecond;
	}

	public void setLeftEyeDetectionEnvironmentSecond(String leftEyeDetectionEnvironmentSecond) {
		this.leftEyeDetectionEnvironmentSecond = leftEyeDetectionEnvironmentSecond;
	}

	public String getLeftEyeLittleValueSecond() {
		return this.leftEyeLittleValueSecond;
	}

	public void setLeftEyeLittleValueSecond(String leftEyeLittleValueSecond) {
		this.leftEyeLittleValueSecond = leftEyeLittleValueSecond;
	}

	public String getLeftEyeVisualFunctionSecond() {
		return this.leftEyeVisualFunctionSecond;
	}

	public void setLeftEyeVisualFunctionSecond(String leftEyeVisualFunctionSecond) {
		this.leftEyeVisualFunctionSecond = leftEyeVisualFunctionSecond;
	}

	public String getLeftEyeSpeedSecond() {
		return this.leftEyeSpeedSecond;
	}

	public void setLeftEyeSpeedSecond(String leftEyeSpeedSecond) {
		this.leftEyeSpeedSecond = leftEyeSpeedSecond;
	}

	public String getRightEyeDetectionEnvironment() {
		return this.rightEyeDetectionEnvironment;
	}

	public void setRightEyeDetectionEnvironment(String rightEyeDetectionEnvironment) {
		this.rightEyeDetectionEnvironment = rightEyeDetectionEnvironment;
	}

	public String getRightEyeLittleValue() {
		return this.rightEyeLittleValue;
	}

	public void setRightEyeLittleValue(String rightEyeLittleValue) {
		this.rightEyeLittleValue = rightEyeLittleValue;
	}

	public String getRightEyeVisualFunction() {
		return this.rightEyeVisualFunction;
	}

	public void setRightEyeVisualFunction(String rightEyeVisualFunction) {
		this.rightEyeVisualFunction = rightEyeVisualFunction;
	}

	public String getRightEyeSpeed() {
		return this.rightEyeSpeed;
	}

	public void setRightEyeSpeed(String rightEyeSpeed) {
		this.rightEyeSpeed = rightEyeSpeed;
	}

	public String getRightEyeDetectionEnvironmentSecond() {
		return this.rightEyeDetectionEnvironmentSecond;
	}

	public void setRightEyeDetectionEnvironmentSecond(String rightEyeDetectionEnvironmentSecond) {
		this.rightEyeDetectionEnvironmentSecond = rightEyeDetectionEnvironmentSecond;
	}

	public String getRightEyeLittleValueSecond() {
		return this.rightEyeLittleValueSecond;
	}

	public void setRightEyeLittleValueSecond(String rightEyeLittleValueSecond) {
		this.rightEyeLittleValueSecond = rightEyeLittleValueSecond;
	}

	public String getRightEyeVisualFunctionSecond() {
		return this.rightEyeVisualFunctionSecond;
	}

	public void setRightEyeVisualFunctionSecond(String rightEyeVisualFunctionSecond) {
		this.rightEyeVisualFunctionSecond = rightEyeVisualFunctionSecond;
	}

	public String getRightEyeSpeedSecond() {
		return this.rightEyeSpeedSecond;
	}

	public void setRightEyeSpeedSecond(String rightEyeSpeedSecond) {
		this.rightEyeSpeedSecond = rightEyeSpeedSecond;
	}

	public String getVisualInspectionExaminer() {
		return this.visualInspectionExaminer;
	}

	public void setVisualInspectionExaminer(String visualInspectionExaminer) {
		this.visualInspectionExaminer = visualInspectionExaminer;
	}

	public String getRefractionInspectionEquipment() {
		return this.refractionInspectionEquipment;
	}

	public void setRefractionInspectionEquipment(String refractionInspectionEquipment) {
		this.refractionInspectionEquipment = refractionInspectionEquipment;
	}

	public String getRefractiveCheckTheSerialNumber() {
		return this.refractiveCheckTheSerialNumber;
	}

	public void setRefractiveCheckTheSerialNumber(String refractiveCheckTheSerialNumber) {
		this.refractiveCheckTheSerialNumber = refractiveCheckTheSerialNumber;
	}

	public String getRefractionDetectionTime() {
		return this.refractionDetectionTime;
	}

	public void setRefractionDetectionTime(String refractionDetectionTime) {
		this.refractionDetectionTime = refractionDetectionTime;
	}

	public String getRefractionDetectionVd() {
		return this.refractionDetectionVd;
	}

	public void setRefractionDetectionVd(String refractionDetectionVd) {
		this.refractionDetectionVd = refractionDetectionVd;
	}

	public String getRefractionDetectionCyl() {
		return this.refractionDetectionCyl;
	}

	public void setRefractionDetectionCyl(String refractionDetectionCyl) {
		this.refractionDetectionCyl = refractionDetectionCyl;
	}

	public String getRefractionDetectionExaminer() {
		return this.refractionDetectionExaminer;
	}

	public void setRefractionDetectionExaminer(String refractionDetectionExaminer) {
		this.refractionDetectionExaminer = refractionDetectionExaminer;
	}

	public String getRefractionDetectionIpd() {
		return this.refractionDetectionIpd;
	}

	public void setRefractionDetectionIpd(String refractionDetectionIpd) {
		this.refractionDetectionIpd = refractionDetectionIpd;
	}

	public String getLeftEyeSphericalLens() {
		return this.leftEyeSphericalLens;
	}

	public void setLeftEyeSphericalLens(String leftEyeSphericalLens) {
		this.leftEyeSphericalLens = leftEyeSphericalLens;
	}

	public String getLeftCylinder() {
		return this.leftCylinder;
	}

	public void setLeftCylinder(String leftCylinder) {
		this.leftCylinder = leftCylinder;
	}

	public String getLeftCylinderAxial() {
		return this.leftCylinderAxial;
	}

	public void setLeftCylinderAxial(String leftCylinderAxial) {
		this.leftCylinderAxial = leftCylinderAxial;
	}

	public String getLeftEyeSphericalLensSecond() {
		return this.leftEyeSphericalLensSecond;
	}

	public void setLeftEyeSphericalLensSecond(String leftEyeSphericalLensSecond) {
		this.leftEyeSphericalLensSecond = leftEyeSphericalLensSecond;
	}

	public String getLeftCylinderSecond() {
		return this.leftCylinderSecond;
	}

	public void setLeftCylinderSecond(String leftCylinderSecond) {
		this.leftCylinderSecond = leftCylinderSecond;
	}

	public String getLeftCylinderAxialSecond() {
		return this.leftCylinderAxialSecond;
	}

	public void setLeftCylinderAxialSecond(String leftCylinderAxialSecond) {
		this.leftCylinderAxialSecond = leftCylinderAxialSecond;
	}

	public String getLeftEyeSphericalLensThird() {
		return this.leftEyeSphericalLensThird;
	}

	public void setLeftEyeSphericalLensThird(String leftEyeSphericalLensThird) {
		this.leftEyeSphericalLensThird = leftEyeSphericalLensThird;
	}

	public String getLeftCylinderThird() {
		return this.leftCylinderThird;
	}

	public void setLeftCylinderThird(String leftCylinderThird) {
		this.leftCylinderThird = leftCylinderThird;
	}

	public String getLeftCylinderAxialThird() {
		return this.leftCylinderAxialThird;
	}

	public void setLeftCylinderAxialThird(String leftCylinderAxialThird) {
		this.leftCylinderAxialThird = leftCylinderAxialThird;
	}

	public String getRefractionLeftEyeAverages() {
		return this.refractionLeftEyeAverages;
	}

	public void setRefractionLeftEyeAverages(String refractionLeftEyeAverages) {
		this.refractionLeftEyeAverages = refractionLeftEyeAverages;
	}

	public String getLeftEyeRetinoscopy() {
		return this.leftEyeRetinoscopy;
	}

	public void setLeftEyeRetinoscopy(String leftEyeRetinoscopy) {
		this.leftEyeRetinoscopy = leftEyeRetinoscopy;
	}

	public String getLeftEyeNearVision() {
		return this.leftEyeNearVision;
	}

	public void setLeftEyeNearVision(String leftEyeNearVision) {
		this.leftEyeNearVision = leftEyeNearVision;
	}

	public String getLeftEyeSpectaclesDegrees() {
		return this.leftEyeSpectaclesDegrees;
	}

	public void setLeftEyeSpectaclesDegrees(String leftEyeSpectaclesDegrees) {
		this.leftEyeSpectaclesDegrees = leftEyeSpectaclesDegrees;
	}

	public String getLeftEyeVisionCorrection() {
		return this.leftEyeVisionCorrection;
	}

	public void setLeftEyeVisionCorrection(String leftEyeVisionCorrection) {
		this.leftEyeVisionCorrection = leftEyeVisionCorrection;
	}

	public String getLeftAnteriorAxialLength() {
		return this.leftAnteriorAxialLength;
	}

	public void setLeftAnteriorAxialLength(String leftAnteriorAxialLength) {
		this.leftAnteriorAxialLength = leftAnteriorAxialLength;
	}

	public String getRightEyeSphericalLens() {
		return this.rightEyeSphericalLens;
	}

	public void setRightEyeSphericalLens(String rightEyeSphericalLens) {
		this.rightEyeSphericalLens = rightEyeSphericalLens;
	}

	public String getRightCylinder() {
		return this.rightCylinder;
	}

	public void setRightCylinder(String rightCylinder) {
		this.rightCylinder = rightCylinder;
	}

	public String getRightCylinderAxial() {
		return this.rightCylinderAxial;
	}

	public void setRightCylinderAxial(String rightCylinderAxial) {
		this.rightCylinderAxial = rightCylinderAxial;
	}

	public String getRightEyeSphericalLensSecond() {
		return this.rightEyeSphericalLensSecond;
	}

	public void setRightEyeSphericalLensSecond(String rightEyeSphericalLensSecond) {
		this.rightEyeSphericalLensSecond = rightEyeSphericalLensSecond;
	}

	public String getRightCylinderSecond() {
		return this.rightCylinderSecond;
	}

	public void setRightCylinderSecond(String rightCylinderSecond) {
		this.rightCylinderSecond = rightCylinderSecond;
	}

	public String getRightCylinderAxialSecond() {
		return this.rightCylinderAxialSecond;
	}

	public void setRightCylinderAxialSecond(String rightCylinderAxialSecond) {
		this.rightCylinderAxialSecond = rightCylinderAxialSecond;
	}

	public String getRightEyeSphericalLensThird() {
		return this.rightEyeSphericalLensThird;
	}

	public void setRightEyeSphericalLensThird(String rightEyeSphericalLensThird) {
		this.rightEyeSphericalLensThird = rightEyeSphericalLensThird;
	}

	public String getRightCylinderThird() {
		return this.rightCylinderThird;
	}

	public void setRightCylinderThird(String rightCylinderThird) {
		this.rightCylinderThird = rightCylinderThird;
	}

	public String getRightCylinderAxialThird() {
		return this.rightCylinderAxialThird;
	}

	public void setRightCylinderAxialThird(String rightCylinderAxialThird) {
		this.rightCylinderAxialThird = rightCylinderAxialThird;
	}

	public String getRefractionRightEyeAverages() {
		return this.refractionRightEyeAverages;
	}

	public void setRefractionRightEyeAverages(String refractionRightEyeAverages) {
		this.refractionRightEyeAverages = refractionRightEyeAverages;
	}

	public String getRightEyeRetinoscopy() {
		return this.rightEyeRetinoscopy;
	}

	public void setRightEyeRetinoscopy(String rightEyeRetinoscopy) {
		this.rightEyeRetinoscopy = rightEyeRetinoscopy;
	}

	public String getRightEyeNearVision() {
		return this.rightEyeNearVision;
	}

	public void setRightEyeNearVision(String rightEyeNearVision) {
		this.rightEyeNearVision = rightEyeNearVision;
	}

	public String getRightEyeSpectaclesDegrees() {
		return this.rightEyeSpectaclesDegrees;
	}

	public void setRightEyeSpectaclesDegrees(String rightEyeSpectaclesDegrees) {
		this.rightEyeSpectaclesDegrees = rightEyeSpectaclesDegrees;
	}

	public String getRightEyeVisionCorrection() {
		return this.rightEyeVisionCorrection;
	}

	public void setRightEyeVisionCorrection(String rightEyeVisionCorrection) {
		this.rightEyeVisionCorrection = rightEyeVisionCorrection;
	}

	public String getRightAnteriorAxialLength() {
		return this.rightAnteriorAxialLength;
	}

	public void setRightAnteriorAxialLength(String rightAnteriorAxialLength) {
		this.rightAnteriorAxialLength = rightAnteriorAxialLength;
	}

	public String getOcularInspectionEquipment() {
		return this.ocularInspectionEquipment;
	}

	public void setOcularInspectionEquipment(String ocularInspectionEquipment) {
		this.ocularInspectionEquipment = ocularInspectionEquipment;
	}

	public String getIopcheckTheSerialNumber() {
		return this.iopcheckTheSerialNumber;
	}

	public void setIopcheckTheSerialNumber(String iopcheckTheSerialNumber) {
		this.iopcheckTheSerialNumber = iopcheckTheSerialNumber;
	}

	public String getOcularInspectionDetectionTime() {
		return this.ocularInspectionDetectionTime;
	}

	public void setOcularInspectionDetectionTime(String ocularInspectionDetectionTime) {
		this.ocularInspectionDetectionTime = ocularInspectionDetectionTime;
	}

	public String getLeftEyeFirstIop() {
		return this.leftEyeFirstIop;
	}

	public void setLeftEyeFirstIop(String leftEyeFirstIop) {
		this.leftEyeFirstIop = leftEyeFirstIop;
	}

	public String getRightEyeFirstIop() {
		return this.rightEyeFirstIop;
	}

	public void setRightEyeFirstIop(String rightEyeFirstIop) {
		this.rightEyeFirstIop = rightEyeFirstIop;
	}

	public String getLeftEyeSecondIop() {
		return this.leftEyeSecondIop;
	}

	public void setLeftEyeSecondIop(String leftEyeSecondIop) {
		this.leftEyeSecondIop = leftEyeSecondIop;
	}

	public String getRightEyeSecondIop() {
		return this.rightEyeSecondIop;
	}

	public void setRightEyeSecondIop(String rightEyeSecondIop) {
		this.rightEyeSecondIop = rightEyeSecondIop;
	}

	public String getLeftEyeThirdIop() {
		return this.leftEyeThirdIop;
	}

	public void setLeftEyeThirdIop(String leftEyeThirdIop) {
		this.leftEyeThirdIop = leftEyeThirdIop;
	}

	public String getRightEyeThirdIop() {
		return this.rightEyeThirdIop;
	}

	public void setRightEyeThirdIop(String rightEyeThirdIop) {
		this.rightEyeThirdIop = rightEyeThirdIop;
	}

	public String getLeftEyeFourthIop() {
		return this.leftEyeFourthIop;
	}

	public void setLeftEyeFourthIop(String leftEyeFourthIop) {
		this.leftEyeFourthIop = leftEyeFourthIop;
	}

	public String getRightEyeFourthIop() {
		return this.rightEyeFourthIop;
	}

	public void setRightEyeFourthIop(String rightEyeFourthIop) {
		this.rightEyeFourthIop = rightEyeFourthIop;
	}

	public String getLeftEyeTheMeanIop() {
		return this.leftEyeTheMeanIop;
	}

	public void setLeftEyeTheMeanIop(String leftEyeTheMeanIop) {
		this.leftEyeTheMeanIop = leftEyeTheMeanIop;
	}

	public String getRightEyeTheMeanIop() {
		return this.rightEyeTheMeanIop;
	}

	public void setRightEyeTheMeanIop(String rightEyeTheMeanIop) {
		this.rightEyeTheMeanIop = rightEyeTheMeanIop;
	}

	public String getBinocularVision() {
		return this.binocularVision;
	}

	public void setBinocularVision(String binocularVision) {
		this.binocularVision = binocularVision;
	}

	public String getLeftEyePosition() {
		return this.leftEyePosition;
	}

	public void setLeftEyePosition(String leftEyePosition) {
		this.leftEyePosition = leftEyePosition;
	}

	public String getRightEyePosition() {
		return this.rightEyePosition;
	}

	public void setRightEyePosition(String rightEyePosition) {
		this.rightEyePosition = rightEyePosition;
	}

	public String getLeftEyeMuscle() {
		return this.leftEyeMuscle;
	}

	public void setLeftEyeMuscle(String leftEyeMuscle) {
		this.leftEyeMuscle = leftEyeMuscle;
	}

	public String getRightEyeMuscle() {
		return this.rightEyeMuscle;
	}

	public void setRightEyeMuscle(String rightEyeMuscle) {
		this.rightEyeMuscle = rightEyeMuscle;
	}

	public String getLeftEyelid() {
		return this.leftEyelid;
	}

	public void setLeftEyelid(String leftEyelid) {
		this.leftEyelid = leftEyelid;
	}

	public String getRightEyelid() {
		return this.rightEyelid;
	}

	public void setRightEyelid(String rightEyelid) {
		this.rightEyelid = rightEyelid;
	}

	public String getLeftEyeLacrimalApparatus() {
		return this.leftEyeLacrimalApparatus;
	}

	public void setLeftEyeLacrimalApparatus(String leftEyeLacrimalApparatus) {
		this.leftEyeLacrimalApparatus = leftEyeLacrimalApparatus;
	}

	public String getRightEyeLacrimalApparatus() {
		return this.rightEyeLacrimalApparatus;
	}

	public void setRightEyeLacrimalApparatus(String rightEyeLacrimalApparatus) {
		this.rightEyeLacrimalApparatus = rightEyeLacrimalApparatus;
	}

	public String getLeftEyeConjunctiva() {
		return this.leftEyeConjunctiva;
	}

	public void setLeftEyeConjunctiva(String leftEyeConjunctiva) {
		this.leftEyeConjunctiva = leftEyeConjunctiva;
	}

	public String getRightEyeConjunctiva() {
		return this.rightEyeConjunctiva;
	}

	public void setRightEyeConjunctiva(String rightEyeConjunctiva) {
		this.rightEyeConjunctiva = rightEyeConjunctiva;
	}

	public String getLeftEyeSclera() {
		return this.leftEyeSclera;
	}

	public void setLeftEyeSclera(String leftEyeSclera) {
		this.leftEyeSclera = leftEyeSclera;
	}

	public String getRightEyeSclera() {
		return this.rightEyeSclera;
	}

	public void setRightEyeSclera(String rightEyeSclera) {
		this.rightEyeSclera = rightEyeSclera;
	}

	public String getLeftEyePupil() {
		return this.leftEyePupil;
	}

	public void setLeftEyePupil(String leftEyePupil) {
		this.leftEyePupil = leftEyePupil;
	}

	public String getRightEyePupil() {
		return this.rightEyePupil;
	}

	public void setRightEyePupil(String rightEyePupil) {
		this.rightEyePupil = rightEyePupil;
	}

	public String getLeftEyeCornea() {
		return this.leftEyeCornea;
	}

	public void setLeftEyeCornea(String leftEyeCornea) {
		this.leftEyeCornea = leftEyeCornea;
	}

	public String getRightEyeCornea() {
		return this.rightEyeCornea;
	}

	public void setRightEyeCornea(String rightEyeCornea) {
		this.rightEyeCornea = rightEyeCornea;
	}

	public String getLeftEyeAnteriorChamber() {
		return this.leftEyeAnteriorChamber;
	}

	public void setLeftEyeAnteriorChamber(String leftEyeAnteriorChamber) {
		this.leftEyeAnteriorChamber = leftEyeAnteriorChamber;
	}

	public String getRightEyeAnteriorChamber() {
		return this.rightEyeAnteriorChamber;
	}

	public void setRightEyeAnteriorChamber(String rightEyeAnteriorChamber) {
		this.rightEyeAnteriorChamber = rightEyeAnteriorChamber;
	}

	public String getLeftEyeCrystal() {
		return this.leftEyeCrystal;
	}

	public void setLeftEyeCrystal(String leftEyeCrystal) {
		this.leftEyeCrystal = leftEyeCrystal;
	}

	public String getRightEyeCrystal() {
		return this.rightEyeCrystal;
	}

	public void setRightEyeCrystal(String rightEyeCrystal) {
		this.rightEyeCrystal = rightEyeCrystal;
	}

	public String getLeftEyeFundus() {
		return this.leftEyeFundus;
	}

	public void setLeftEyeFundus(String leftEyeFundus) {
		this.leftEyeFundus = leftEyeFundus;
	}

	public String getRightEyeFundus() {
		return this.rightEyeFundus;
	}

	public void setRightEyeFundus(String rightEyeFundus) {
		this.rightEyeFundus = rightEyeFundus;
	}

	public String getLeftEyeOther() {
		return this.leftEyeOther;
	}

	public void setLeftEyeOther(String leftEyeOther) {
		this.leftEyeOther = leftEyeOther;
	}

	public String getRightEyeOther() {
		return this.rightEyeOther;
	}

	public void setRightEyeOther(String rightEyeOther) {
		this.rightEyeOther = rightEyeOther;
	}

}