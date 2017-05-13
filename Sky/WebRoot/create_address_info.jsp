<%@ page contentType="text/html" pageEncoding="UTF-8"%>

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
<script type="text/javascript" src="js/geo.js"></script>

</head>
<body onload="setup();promptinfo();">	<!-- onload="setup()" -->
	<div class="content sky-content" id="page-container">
		<div class="frame-records">
			<div class="records-new part4">
				<div class="title">添加社区<span style="font-size: 12px;color:#f00;">&nbsp;&nbsp;带*为必填项</span></div>
				<div class="context" style="padding-left: 10px !important;">
							
							
							
							<form name="addform" id="addform" class="form-horizontal"
								action="addAddressInfo" method="post" onsubmit="return checkCommunityName()">
								<fieldset>
								<!-- <div class="f2"> -->
									<div class="form-group">
										<label for="IDCard" class="col-sm-3 control-label">新建社区</label>
										<div class="col-sm-6">
											<input type="text" class="form-control col-sm-6" id="community"
												name="community" placeholder="请填写社区名称" value='' required onchange="setDisabled();">	<!-- onblur="checkschoolname() -->
											<span style="font-size:20px; color:#f00;position: absolute;top:5px;">&nbsp;&nbsp;*</span>
										</div>
										<span style="color:#f00;position: relative;top: 5px;right:-6px;" id="checkcommunitynameinfo"></span>
										
									</div>
									<div class="form-group">
										<label for="IDCard" class="col-sm-3 control-label">所属省市区</label>
										<div class="col-sm-6">
								
											<input type="hidden" class="form-control" id="district" name="district" value="" />
							 					<select class="select" name="province" id="s1" style="height:33px;" >
              										<option></option>
            									</select>
            									<select class="select" name="city" id="s2" style="height:33px;" >
              										<option></option>
            									</select>
            									<select class="select" name="town" id="s3" style="height:33px;" >
              										<option></option>
            									</select>
											<span style="font-size:20px; color:#f00;position: absolute;top:5px;right:-6px;">&nbsp;&nbsp;*</span>
										</div>
										<span style="color:#f00;position: relative;top: 5px;right:-6px;" id="checkdistrictnameinfo"></span>
									</div>
								
									<div class="form-group">
										<label for="IDCard" class="col-sm-3 control-label">所属街道</label>
										<div class="col-sm-6">
											<span style="overflow:hidden;">
											<select class="select" name="choosestreet" id="choosestreet" 
												 style="width:220px;height:33px;" onchange="changeStreet();">
              									<option>请选择所属街道</option>
            								</select>
            								</span><input id="street" name="street" style="width:200px;height:33px;position:absolute;left:15px;top:0px;"
											  placeholder="  请输入或选择所属街道" value=''> 
											<span style="font-size:20px; color:#f00;position: absolute;top:5px;right:-6px;">&nbsp;&nbsp;*</span>
										</div>
										<span style="color:#f00;position: relative;top: 5px;right:-6px;" id="checkstreetnameinfo"></span>
									</div>
									
									
								</fieldset>
								<div class="modal-footer" style="padding-right: 13%;">
									<!-- <a href="allAddressInfo.action" class="btn btn-warning">返回</a> -->
									<button type="button"  class="btn btn-warning" onclick="checkCommunityName();">检查</button>
									<button type="submit" class="btn btn-primary" id="submit" disabled="true" >增加</button>	<!-- style="visibility:hidden;" -->
								</div>
							</form>
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
		//var msg="unknown";
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
		function getCommunityNum() {
			//alert("check!");
			var province = document.getElementById("s1").value;
			var city = document.getElementById("s2").value;
			var town = document.getElementById("s3").value;
			
			if(province!="省份" && city!="地级市" && town!="县级市、县" ){
				province = encodeURI(encodeURI(province));
				city = encodeURI(encodeURI(city));
				town = encodeURI(encodeURI(town));
				
				var url = "getCommNum.action?province="+province+"&city="+city+"&town="+town;
				//alert(url);
				createXMLHttpRequest();
				xmlHttpReq.open("POST", url, true);
				xmlHttpReq.onreadystatechange = getCheckResult;
				xmlHttpReq.send(null);
			}
		}
		
		function getCheckResult() {
			if (xmlHttpReq.readyState == 4) {
				var addresslist = eval('(' + xmlHttpReq.responseText + ')');
				var checkresult = eval(addresslist.CHECKRESULT);
				for ( var i = 0; i < checkresult.length; i++) {
					document.getElementById("choosestreet").options.add(new Option(checkresult[i].street,checkresult[i].street));
				}
			}
		}
		
		function changeStreet(){
			document.getElementById('street').value=
				document.getElementById('choosestreet').options[document.getElementById('choosestreet').selectedIndex].value;
		}
		
		function setDisabled(){
			document.getElementById("submit").disabled = true;
			if(document.getElementById("checkcommunitynameinfo").innerText != ""){
				document.getElementById("checkcommunitynameinfo").innerText = "请重新检查！";
			}
		}
		
		function checkCommunityName(){
			//alert("checkCommunityName!");
			var province = document.getElementById("s1").value;
			var city = document.getElementById("s2").value;
			var town = document.getElementById("s3").value;
			var street = document.getElementById("street").value;
			var community = document.getElementById("community").value;
			//alert("checkCommunityName!street："+street);
			
			
			
			if(province!="省份" && city!="地级市" && town!="县级市、县" && street!="" && street!="请选择所属街道" && community!=""){
				province = encodeURI(encodeURI(province));
				city = encodeURI(encodeURI(city));
				town = encodeURI(encodeURI(town));
				street = encodeURI(encodeURI(street));
				community = encodeURI(encodeURI(community));
				
				var url = "checkCommInfo.action?province="+province+"&city="
					+city+"&town="+town+"&street="+street+"&community="+community;
				createXMLHttpRequest();
				xmlHttpReq.open("POST", url, true);
				xmlHttpReq.onreadystatechange = getResult;
				xmlHttpReq.send(null);
			}
			else{
				if(community==""){
					document.getElementById("checkcommunitynameinfo").innerText = "必填项不得为空！";
				}
				else{
					document.getElementById("checkcommunitynameinfo").innerText = "";
				}
				if(province=="省份" || city=="地级市" || town=="县级市、县"){
					document.getElementById("checkdistrictnameinfo").innerText = "必填项不得为空！";
				}
				else{
					document.getElementById("checkdistrictnameinfo").innerText = "";
				}
				if(street=="" || street=="请选择所属街道"){
					document.getElementById("checkstreetnameinfo").innerText = "必填项不得为空！";
				}
				else{
					document.getElementById("checkstreetnameinfo").innerText = "";
				}
			}
			
			if(document.getElementById("checkcommunitynameinfo").innerText == "填写正确！"){
				//alert("请检查！");
				return true;
			}
			else{
				return false;
			}
		}
		
		function getResult() {
			if (xmlHttpReq.readyState == 4) {
				var res = eval('(' + xmlHttpReq.responseText + ')');
				var msg = res.MSG;
				//msg = msg;
				//alert("getResult()msg为："+msg);
				var checkcommunitynameinfo = document.getElementById("checkcommunitynameinfo");
				checkcommunitynameinfo.innerText = msg;	//社区输入合法 2016-8-7
				/**/
				if (msg=="填写正确！") {
					checkcommunitynameinfo.innerText = msg;	//社区输入合法 2016-8-7
					document.getElementById("submit").disabled = false;
					//document.getElementById("submit").style.visibility="visible";
				} else {
					//checkschoolnameinfo.innerText = msg;
					//checkschoolnameinfo.innerText = "该社区名称已存在！";
					checkcommunitynameinfo.innerText = msg;	
					document.getElementById("submit").disabled = true;
					//document.getElementById("submit").style.visibility="hidden";
				}
				
			}
		}
		
		/**与js中的setup()冲突
		function setup(){
			document.getElementById("submit").disabled = true;
		}
		**/
		
		//这个函数是必须的，因为在geo.js里每次更改地址时会调用此函数
		function promptinfo()
		{
    		var district = document.getElementById('district');
  			var s1 = document.getElementById('s1');
  			var s2 = document.getElementById('s2');
 			var s3 = document.getElementById('s3');
  			//var s4 = document.getElementById('s4');
    		//var s4 = document.getElementById('s4');
   			district.value = s1.value +"," + s2.value +","+ s3.value;// +","+ s4.value + ","+ s5.value;
   			document.getElementById('district').addEventListener("input",getCommunityNum(),false);	//用于检测地址的变化
   			document.getElementById("choosestreet").options.length=1;		//每次更新地址时自动清除choosestreet选项
		}
		
	</script>

</body>

</html>