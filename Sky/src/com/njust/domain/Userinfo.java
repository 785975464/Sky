package com.njust.domain;

import com.njust.servlet.getMD5;

/**
 * Userinfo entity. @author MyEclipse Persistence Tools
 */

public class Userinfo implements java.io.Serializable {

	// Fields

	private String username;
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
	private String creater;
	private String manager;
	private int isDeleted;
	//private Boolean doublecare;
	// Constructors

	/** default constructor */
	public Userinfo() {
	}

	/** minimal constructor */
	public Userinfo(String username, String password, String level) {
		this.username = username;
		this.password = password;
		this.level = level;
	}

	/** full constructor **/
	public Userinfo(String username, String password, String level,
			Boolean enabled, Boolean accountNonExpired,
			Boolean credentialsNonExpired, Boolean accountNonLocked,
			String realname, String gender, String age, String address,
			String phone, String email, String guardianName, int school, int manageCommunity,
			String grade, String stuClass, String idNumber, String nation,
			String height, String weight, int isDeleted) {
		this.username = username;
		this.password = password;
		this.level = level;
		this.enabled = enabled;
		this.accountNonExpired = accountNonExpired;
		this.credentialsNonExpired = credentialsNonExpired;
		this.accountNonLocked = accountNonLocked;
		this.realname = realname;
		this.gender = gender;
		this.age = age;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.guardianName = guardianName;
		this.school = school;
		this.manageCommunity=manageCommunity;
		this.grade = grade;
		this.stuClass = stuClass;
		this.idNumber = idNumber;
		this.nation = nation;
		this.height = height;
		this.weight = weight;
		//this.doublecare = doublecare;
		this.isDeleted=isDeleted;
	}

	// Property accessors

	public Userinfo(String realname, String gender, String age,
			int school, String grade, String stuClass,
			String nation, String height, String weight, String guardianName) {
		// TODO Auto-generated constructor stub
//		this.username = username;
//		this.password = password;
//		this.level = level;
		this.realname = realname;
		this.gender = gender;
		this.age = age;
//		this.address = address;
//		this.phone = phone;
//		this.email = email;
		
		this.school = school;
		this.grade = grade;
		this.stuClass = stuClass;
		this.nation = nation;
		this.height = height;
		this.weight = weight;
		this.guardianName = guardianName;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
//		this.password = getMD5.makeMD5(password);
	}

	public String getLevel() {
		return this.level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public Boolean getEnabled() {
		return this.enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public Boolean getAccountNonExpired() {
		return this.accountNonExpired;
	}

	public void setAccountNonExpired(Boolean accountNonExpired) {
		this.accountNonExpired = accountNonExpired;
	}

	public Boolean getCredentialsNonExpired() {
		return this.credentialsNonExpired;
	}

	public void setCredentialsNonExpired(Boolean credentialsNonExpired) {
		this.credentialsNonExpired = credentialsNonExpired;
	}

	public Boolean getAccountNonLocked() {
		return this.accountNonLocked;
	}

	public void setAccountNonLocked(Boolean accountNonLocked) {
		this.accountNonLocked = accountNonLocked;
	}

	public String getRealname() {
		return this.realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getGender() {
		return this.gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAge() {
		return this.age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGuardianName() {
		return this.guardianName;
	}

	public void setGuardianName(String guardianName) {
		this.guardianName = guardianName;
	}

	public int getSchool() {
		return this.school;
	}

	public void setSchool(int school) {
		this.school = school;
	}

	public int getManageCommunity() {
		return this.manageCommunity;
	}

	public void setManageCommunity(int manageCommunity) {
		this.manageCommunity = manageCommunity;
	}
	
	public String getGrade() {
		return this.grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getStuClass() {
		return this.stuClass;
	}

	public void setStuClass(String stuClass) {
		this.stuClass = stuClass;
	}

	public String getIdNumber() {
		return this.idNumber;
	}

	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}

	public String getNation() {
		return this.nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getHeight() {
		return this.height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getWeight() {
		return this.weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public String getCreater() {
		return creater;
	}

	public void setCreater(String creater) {
		this.creater = creater;
	}

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}
	//新增双倍关怀计划 2015-1-5
	/**
	public Boolean getDoublecare() {
		return this.doublecare;
	}
	public void setDoublecare(Boolean doublecare) {
		this.doublecare = doublecare;
	}
	**/

	public int getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(int isDeleted) {
		this.isDeleted = isDeleted;
	}
}