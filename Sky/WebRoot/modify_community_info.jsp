<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*" %>

<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>视康云</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
<script type="text/javascript" src="jquery/jquery-2.1.1.min.js"></script>
<link type="text/css" rel="stylesheet" href="css/main.min.css">
<link type="text/css" rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="bootstrap/css/bootstrap-datetimepicker.min.css">

<!-- <link type="text/css" rel="stylesheet" href="materialize/css/materialize.min.css"/> -->
<!-- <link type="text/css" rel="stylesheet" href="materialize/css/ghpages-materialize.css"> -->
<link type="text/css" rel="stylesheet" href="css/selectize.css" />

<script type="text/javascript" src="materialize/js/materialize.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript" src="js/geo.js"></script>		<!-- 获取通信地址 -->
<script type="text/javascript" src="js/selectize.js"></script>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>		<!-- 时间控件 2015-12-31 -->
<style type="text/css">
	.mycity{
		margin-bottom: 5px;
		height:36px;
		border: 1px solid #d0d0d0;
		border-radius: 3px;
		display:inline-block !important;
	}
	#toast-container {
	    right: 5%;
	    top: 7%;
	    max-width: 90%;
	    display: block;
	    position: fixed;
	    z-index: 10000;
	}
	.toast {
	    border-radius: 2px;
	    top: 0;
	    width: auto;
	    clear: both;
	    margin-top: 10px;
	    position: relative;
	    max-width: 100%;
	    height: auto;
	    min-height: 48px;
	    line-height: 1.5em;
	    word-break: break-all;
	    background-color: #323232;
	    padding: 13px 25px;
	    font-size: 1.1rem;
	    font-weight: 300;
	    color: #fff;
	    display: -webkit-flex;
	    display: -ms-flexbox;
	    display: flex;
	    -webkit-align-items: center;
	    -ms-flex-align: center;
	    align-items: center;
	    -webkit-justify-content: space-between;
	    -ms-flex-pack: justify;
	    justify-content: space-between;
	}
/* 	input[type=text]{ */
/* 		height: 1.5rem !important; */
/* 	} */
/* 	select#grade  option */
/*     { */
/*         padding : 5px 8px !important; */
/*         border  : 1px solid #d0d0d0; */
/*         font-size: 13px; */
/*     	line-height: 18px; */
/*     } */
</style>
</head>
<body onload="setup();">	<!-- preselect('江苏省');promptinfo() -->
	<div class="content sky-content" id="page-container">
		<div class="frame-records">
			<div class="records-new part4">
				<div class="title">修改信息</div>
				<div class="context" style="padding-left: 10px !important;">
<!-- 					<form name="updateform" id="updateform" class="form-horizontal" -->
<!-- 						action="updateCommunityInfo.action" method="post" > -->
					<form id="modifyinfoform" class="form-horizontal">
						<fieldset>
							<div class="f2">
								<div class="form-group" style="display:none;">
									<label for="IDCard" class="col-sm-3 control-label">ID</label>
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
										<!-- 
										<select type="select" id="gender" name="gender" class="form-control" value='${userinfo.gender}'>
											<option value='${userinfo.gender}'>${userinfo.gender}</option>
											<option value="男">男</option>
											<option value="女">女</option>
										</select>
										 -->
										<label class="radio-inline"> 
										<input type="radio" name="gender" value="男" 
											<c:if test="${userinfo.gender=='男' }">checked="checked"</c:if>> 男
										</label>
										<label class="radio-inline"> 
										<input type="radio" name="gender" value="女" 
											<c:if test="${userinfo.gender=='女' }">checked="checked"</c:if>> 女
										</label>
									</div>
								</div>
								<div class="form-group">
									<label for="IDCard" class="col-sm-3 control-label">出生日期</label>
										<div class="col-sm-6">
											<input type="text" class="form-control col-sm-6 " id="age"
												name="age" onClick="WdatePicker()" value='${userinfo.age}'>
									</div>
								</div>

								<div class="form-group">
									<label for="IDCard" class="col-sm-3 control-label">原授权社区</label>
									<div class="col-sm-6">
										<input type="text" class="form-control col-sm-6" id="originManageCommunity"
											name="originManageCommunity" value='${userinfo.manageCommunity}' readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="IDCard" class="col-sm-3 control-label">现授权社区</label>
									<div class="col-sm-6">
										<div class="">
											<div>
												<select name="province" id="s1" class="mycity">
												</select>
												<select name="city" id="s2" class="mycity">
												</select>
												<select name="county" id="s3" class="mycity">
												</select>
											</div>
<!-- 											<label>填写省、市、区县</label> -->
										</div>
										<div>
											<select name="street" id="street" data-placeholder="请选择或输入一个社区的名称" >	<!-- class="mystreet" -->
										    </select>
<!-- 										    <label>填写街道</label> -->
										</div>
										<div>
											<select name="community" id="community" data-placeholder="请选择或输入一个街道的名称" >	<!-- class="mystreet" -->
										    </select>
<!-- 										    <label>填写社区</label> -->
										</div>
										<input type="hidden" id="manageCommunity" name="manageCommunity" value='${userinfo.manageCommunity}'>
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
								
							</div>
							<div class="f2" style="padding-left:1%;">
								<div class="form-group">
									<label for="IDCard" class="col-sm-3 control-label">学校</label>
									<div class="col-sm-6">
										<select id="school" name="school" data-placeholder="请选择或输入学校名称">
										</select>
										<input type="hidden" id="myschool" name="myschool" value='${userinfo.school}'>
									</div>
								</div>
								<div class="form-group">
									<label for="IDCard" class="col-sm-3 control-label">年级</label>
									<div class="col-sm-3" >
										<select type="select" id="grade" name="grade" class="form-control" value='${userinfo.grade}'> <!--  style="text-align:center;" -->
								         <option value='${userinfo.grade}'>${userinfo.grade}</option>
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
										<select id="nation" name="nation" data-placeholder="请选择民族">
										</select>
										<input type="hidden" id="mynation" name="mynation" value='${userinfo.nation}'>
									</div>
								</div>

								<div class="form-group">
									<label for="IDCard" class="col-sm-3 control-label">身高</label>
									<div class="col-sm-6">
										<input type="text" class="form-control col-sm-6" id="height"
											name="height" value='${userinfo.height}'>
										
									</div>
									<span style="color:black;padding-right: 5px;top:5px;vertical-align: middle;">CM</span>
								</div>
								<div class="form-group">
									<label for="IDCard" class="col-sm-3 control-label">体重</label>
									<div class="col-sm-6">
										<input type="text" class="form-control col-sm-6" id="weight"
											name="weight" value='${userinfo.weight}'>
									</div>
									<span style="color:black;padding-right: 5px;top:5px;vertical-align: middle;">KG</span>
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

						</fieldset>
					</form>
						<div class="modal-footer" style="padding-right: 22%;">
							<button type="button" class="btn btn-warning"
								onClick="history.back(-1)">返回</button>
<!-- 							<button type="submit" class="btn btn-primary" id="submit">确定</button> -->
							<button class="btn btn-primary" id="submitbtn">确定</button>
						</div>
<!-- 					</form> -->
					
				</div>
			</div>
		</div>
	</div>
	<div id="toast-container">
		<div class="toast" style="display:none;touch-action: pan-y; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); top: 0px; opacity: 1;">12345
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

<script>
$(function(){		//查询授权社区
	$.ajax({
         data: {"addressid": $("#originManageCommunity").val()},
         url:"getTheDistrict.action",
         type:"POST",
         success: function(results) {
         	var obj=eval('('+results+')');
         	//console.log(obj);
         	$("#originManageCommunity").val(obj[0].district+","+obj[0].street+","+obj[0].community);
         },
         error: function(error) {
             console.log(error);
         }
    });
});

var select_street, $select_street;
var select_community, $select_community;

$select_street = $('#street').selectize({
	create: true,
    valueField: 'name',
    labelField: 'name',
    searchField: ['name'],
    onChange: function(value) {
    	select_community.clearOptions();
    	if (!value.length) return;
    	// alert(value);
//     	console.log("onChange value:"+value);
    	select_community.load(function(callback) {
            $.ajax({
                data: {"province": document.getElementById('s1').value,"city": document.getElementById('s2').value,"town": document.getElementById('s3').value,"street": document.getElementById('street').value},
                url:"getTheCommunity.action",
                type:"POST",
                success: function(results) {
                	var obj=eval('('+results+')');
                	//console.log(obj);
                    //添加options
                    // select_community.clearOptions();
			        for(var i = 0; i < obj.length; i++){
			            select_community.addOption({
			                name : obj[i]["community"]
			            });
			        }
                },
                error: function() {
                    callback();
                }
            })
        });

    	
    }
});

$select_community = $('#community').selectize({
	create: true,
    valueField: 'name',
    labelField: 'name',
    searchField: ['name'],
    onChange: function(value) {
//     	console.log("onChange value:"+value);
    	if (!value.length) return;
    	// alert(value);
//     	console.log("onChange value:"+value);
        $.ajax({
            data: {"district": $('#s1').val()+","+$('#s2').val()+","+$('#s3').val(),
            		"street": $('#street').val(),"community": $('#community').val()},
            url:"getTheAddressId.action",
            type:"POST",
            success: function(results) {
            	var obj=eval('('+results+')');
//             	console.log(obj);
            	$('#manageCommunity').val(obj[0].addressid);
            },
            error: function() {
				callback();
            }
        });
    }
});

select_street  = $select_street[0].selectize;
select_community = $select_community[0].selectize;


//动态获取街道
$("#s3").change(function(){
	select_street.clearOptions();
	// console.log(this.value);
	if (this.value!="区县") {
		select_street.load(function(callback) {
            $.ajax({
                data: {"province": document.getElementById('s1').value,"city": document.getElementById('s2').value,"town": document.getElementById('s3').value},
                url:"getTheStreet.action",
                type:"POST",
                success: function(results) {
                	var obj=eval('('+results+')');
			        for(var i = 0; i < obj.length; i++){
			            select_street.addOption({
			                name : obj[i]["street"]
			            });
			        }
                },
                error: function() {
                    callback();
                }
            })
        });
	}
});
	
$select_school = $('#school').selectize({
	create: false,
    valueField: 'id',
    labelField: 'name',
    searchField: ['name'],
    options: [],  
    dropdownParent : 'body',
    onInitialize   : getSchool
});
var select_school = $select_school[0].selectize;
function getSchool(){
// 	console.log("onFocus getSchool!");
	$.ajax({
         url:"getAllSchools.action",
         type:"GET",
         success: function(results) {
         	var obj=eval('('+results+')');
//          	console.log(obj);
         	select_school.clearOptions();
         	for (var i = 0; i < obj.length ; i++ ) {
         		select_school.addOption({
	                id : obj[i]["schoolid"],  
	                name : obj[i]["schoolname"]
	            });
			}
// 			console.log($("#myschool").val());
			select_school.setValue($("#myschool").val());
         },
         error: function(error) {
             console.log(error);
         }
    });
}

//民族
var national = [
            "汉族", "壮族", "满族", "回族", "苗族", "维吾尔族", "土家族", "彝族", "蒙古族", "藏族", "布依族", "侗族", "瑶族", "朝鲜族", "白族", "哈尼族",
            "哈萨克族", "黎族", "傣族", "畲族", "傈僳族", "仡佬族", "东乡族", "高山族", "拉祜族", "水族", "佤族", "纳西族", "羌族", "土族", "仫佬族", "锡伯族",
            "柯尔克孜族", "达斡尔族", "景颇族", "毛南族", "撒拉族", "布朗族", "塔吉克族", "阿昌族", "普米族", "鄂温克族", "怒族", "京族", "基诺族", "德昂族", "保安族",
            "俄罗斯族", "裕固族", "乌孜别克族", "门巴族", "鄂伦春族", "独龙族", "塔塔尔族", "赫哲族", "珞巴族"
    ];
	
//设置民族
var select_nation,$select_nation;
$select_nation = $('#nation').selectize({
	create: false,
    valueField: 'name',
    labelField: 'name',
    searchField: ['name'],
    options: [],  
    dropdownParent : 'body',
    onFocus   : getNation
//     onInitialize:setNation
});
select_nation = $select_nation[0].selectize;
select_nation.addOption({name : $('#mynation').val()});
select_nation.setValue($('#mynation').val());
function getNation(){
   	for (var i = 0; i < national.length ; i++ ) {
   		select_nation.addOption({
// 			id:i,
			name : national[i]
       });
	}
}

//这个函数是必须的，因为在geo.js里每次更改地址时会调用此函数
function promptinfo()
{
//     var address = document.getElementById('address');
//     var s1 = document.getElementById('s1');
//     var s2 = document.getElementById('s2');
//     var s3 = document.getElementById('s3');
//     var s4 = document.getElementById('s4');
//     var s5 = document.getElementById('s5');
//     if(s4.value == "undefined")
//     	s4.value = '';
// 	if(s5.value == "undefined")
//     	s5.value = '';
//     alert("s5为："+s5);
//     address.value = s1.value +"," + s2.value +","+ s3.value +","+ s4.value +","+ s5.value;
}

$("#submitbtn").click(function(){
	$.ajax({
		url:"updateCommunityInfo.action",
		type:"POST",
		data:$('#modifyinfoform').serialize(),
		success:function(result){
// 			console.log(result);
			var obj=eval('('+result+')');
// 			Materialize.toast("123");
			showToast(obj.msg, 2000);
		},
		error:function(error){
			var obj=eval('('+error+')');
			showToast(obj.msg, 2000);
// 	    	Materialize.toast(obj.msg, 2000);
	        console.log(error);
		}
	});
});

function showToast(msg, time){
	$('.toast').css("display","block");
	$('.toast').html(msg);
	console.log("in showToast, msg:"+msg);
	setTimeout(closetoast,time);
}
function closetoast(){
	$('.toast').css("display","none");
}

function checkform()
{
 	var s6 = document.getElementById('s6');
 	alert("s6的值为："+s6.value);
	if(document.getElementById("s1").value!="省份" && ( document.getElementById("s2").value=="地级市"  
		|| document.getElementById("s3").value=="县级市、县" || document.getElementById("s4").value=='' || document.getElementById("s5").value=='') )
	{
		alert("请将通信地址填写完整！");
		return false;
	}
	//判断年龄输入是否合法 2015-12-31
	var date = new Date();
	var nowyear = date.getFullYear();		//获取完整的年份(4位,1970-????)
	var nowmonth = date.getMonth()+1; 		//获取当前月份(0-11,0代表1月)
	var nowday = date.getDate();			//获取当前日(1-31)
	//var nowtime = nowyear.toString() + nowmonth.toString() + nowday.toString();
	var nowtime = nowyear*10000 + nowmonth*100 + nowday;	//转换为20160104格式
	var age = document.getElementById("age").value;
	var agetime = age.replace('-','').replace('-','');
	if( parseInt(nowtime) - parseInt(agetime) <0 ){
		alert("出生日期输入错误！");
		return false;
	}
	//alert(document.getElementById("s1").value+document.getElementById("s2").value+document.getElementById("s3").value+document.getElementById("s4").value);
	alert("成功添加信息！");
	return true;
}
</script>

</body>

</html>