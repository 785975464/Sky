<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
<title>视康云</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
<!--  -->
<script src="jquery/jquery.min.js"></script>

<link href="jquery/nouislider.min.css" rel="stylesheet">
<script src="jquery/nouislider.min.js"></script>
<script src="jquery/wNumb.js"></script>		<!-- 用于格式化数据 -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<script src="bootstrap/js/bootstrap.min.js"></script>

  
<style type="text/css">
	body {background-image:none!important;}
	input{width:50px;border:0px;}
	.container{margin:20px;}
	/*
	.noUi-connect{
		background: #3FB8AF;
	}
	*/
	.noUi-base{
		/*background: #3FB8AF;
		background: #428bca;*/
		background: #60b4fd;
	}
	.noUi-origin{
		background: #ffffff;
	}
	.question{
		/*margin:25px 0px 25px 0px;*/
		padding:10px 20px 10px 20px;
	}
.box {
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#6699FF', endColorstr='#6699FF'); /*  IE */
	background-image:linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	background-image:-o-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	background-image:-moz-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	background-image:-webkit-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	background-image:-ms-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	
	
	position: relative;
	width: 100%;
	height: 100%;
}
.question-box {
	/*margin: 50px auto;*/
	width: 100%;
	max-width:500px;
	
	position: absolute;
	/*
	top: 50%;

	margin-top: 200px;
	设置负值，为要定位子盒子的一半高度*/
	
}
@media screen and (min-width:500px){
	.question-box {
		left: 50%;
		/*设置负值，为要定位子盒子的一半宽度*/
		margin-left: -250px;
	}
}
.panel-default {
    background: #428bca;
}
form{
	background: #ffffff;
}
h1 small{
	color: #ffffff;
}
.panel{
	margin-bottom:0px;
	border:0px;
	border-radius: 0px;
}

</style>
</head>

<body>
<div class="box">
	<div class="question-box panel panel-default">
		<div class="text-center panel panel-default">
			<h1><small>用眼行为习惯调查问卷</small></h1>
		</div>
		<div>
			<form action="AddRecord" method="post">
				<div class="question">
					<span class="glyphicon glyphicon-question-sign">
						<label for="input-with-keypress1">1、是否近视：</label>
						<label><input type='radio' name='que1' value='不近视' style="width:20px;" checked>不近视</label>
						<label><input type='radio' name='que1' value='近视' style="width:20px;">近视</label>
					</span>
					
				</div>
				<div class="question">
					<span class="glyphicon glyphicon-question-sign">
						<label for="input-with-keypress1">2、视力检测（次/年）：</label>
					</span>
					<input id="input-with-keypress1" name="que2" value="0">
					<div id="slider1"></div>
				</div>
				<div class="question">
					<span class="glyphicon glyphicon-question-sign">
						<label for="input-with-keypress2">3、做亮睛操（次/天）：</label>
					</span>
					<input id="input-with-keypress2" name="que3" value="0">
					<div id="slider2"></div>
				</div>
				<div class="question">
					<span class="glyphicon glyphicon-question-sign">
						<label for="input-with-keypress3">4、视力训练（次/周）：</label>
					</span>
					<input id="input-with-keypress3" name="que4" value="0">
					<div id="slider3"></div>
				</div>
				<div class="question">
					<span class="glyphicon glyphicon-question-sign">
						<label for="input-with-keypress4">5、户外活动（次/天）：</label>
					</span>
					<input id="input-with-keypress4" name="que5" value="0">
					<div id="slider4"></div>
				</div>
				<div class="question">
					<span class="glyphicon glyphicon-question-sign">
						<label for="input-with-keypress5">6、户外活动时长（小时/天）：</label>
					</span>
					<input id="input-with-keypress5" name="que6" value="0">
					<div id="slider5"></div>
				</div>
				<div class="question">
					<span class="glyphicon glyphicon-question-sign">
						<label for="input-with-keypress6">7、近距工作时间间隔（×10分钟）：</label>
					</span>
					<input id="input-with-keypress6" name="que7" value="0">
					<div id="slider6"></div>
				</div>
				<div class="question">
					<span class="glyphicon glyphicon-question-sign">
						<label for="input-with-keypress7">8、电子设备使用间隔（×10分钟）：</label>
					</span>
					<input id="input-with-keypress7" name="que8" value="0">
					<div id="slider7"></div>
				</div>
				<div class="question">
					<span class="glyphicon glyphicon-question-sign">
						<label for="input-with-keypress8">9、睡眠时长（小时/天）：</label>
					</span>
					<input id="input-with-keypress8" name="que9" value="0">
					<div id="slider8"></div>
				</div>
			
			
				<div>
					<input type="hidden" id="sheetid" name="sheetid" value="2016091909370761646D696E">
					<input type="hidden" id="username" name="username" value="">
					<input type="hidden" id="submittype" name="submittype" value="phone">
					<button type="submit" class="btn btn-primary btn-lg btn-block" style="margin-top:20px">	<!-- style="width:90%;margin-top:20px" -->
						<span class="glyphicon glyphicon-saved">提交</span>
					</button>
					
				</div>
			</form>
		</div>
	</div>
</div>

</div>

	
	
	
<script type="text/javascript">
//var slider = document.getElementById('slider');
function setvalue(keypressSlider1,input1,slider1,array){
		//alert(array%1);
		var stp,dec;
		if(array%1==0){
			stp= 1;
			dec= 0;
		}
		else{
			stp=0.5;
			dec= 1;
		}
		//var keypressSlider1 = document.getElementById('slider1');
		//var input1 = document.getElementById('input-with-keypress1');
		noUiSlider.create(slider1, {
			start: 0,
			step: stp,
			range: {
				'min': 0,
				'max': array,
		},
		//转化为整数
		format: wNumb({
			decimals: dec
		})
		/*
		format: {
		  to: function ( value ) {
			return value;
		  },
		  from: function ( value ) {
			return value.replace(',-', '');
		  }
		}
		*/
	});
	
	keypressSlider1.noUiSlider.on('update', function( values, handle ) {
		input1.value = values[handle];
	
	});
	
	input1.addEventListener('change', function(){
		if(this.value>array){
			//大于10则不设置
		}
		else{
			keypressSlider1.noUiSlider.set(this.value);
		}
		
	});
	
	// Listen to keydown events on the input field.
	input1.addEventListener('keydown', function( e ) {
		// Convert the string to a number.
		var value = Number( keypressSlider1.noUiSlider.get() );
		var sliderStep = keypressSlider1.noUiSlider.steps();
		//sliderStep = sliderStep[0];
		// 13 is enter,
		// 38 is key up,
		// 40 is key down.
		switch ( e.which ) {
			case 13:
				keypressSlider1.noUiSlider.set(this.value);
				break;
			case 38:
				keypressSlider1.noUiSlider.set( value + sliderStep[1] );
				break;
			case 40:
				keypressSlider1.noUiSlider.set( value - sliderStep[0] );
				break;
		}
	});
}
$(document).ready(function(){
//初始化
	var array=[18,10,8,10,8,9.5,8.5,18];
	for(var i=1;i<=8;i++){
		var keypressSlider = document.getElementById('slider'+i);
		var input = document.getElementById('input-with-keypress'+i);
		var slider = document.getElementById('slider'+i);
		//alert(keypressSlider+"+"+input);
		setvalue(keypressSlider,input,slider,array[i-1]);
	}
//给特定元素赋值
	//18,10,8,10,8,9.5,8.5,18
	//var slider1 = document.getElementById('slider1');
	//slider1.noUiSlider.set([8]);
});
	</script>
</body>
</html>
