<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>视康云</title>

<link rel="stylesheet"
	href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script
	src="http://cdn.bootcss.com/twitter-bootstrap/3.0.1/js/bootstrap.min.js"></script>

<style>
.bs-docs-home {
	background-color: #0B0434;
	background-image: url(http://localhost/CI/img/intro-bg.jpg);
}

.input-group {
	margin-top: 3px;
	margin-bottom: 3px;
}

.ptitle {
	height: 35px;
	line-height: 35px;
	background-color: #60BBFF;
	font-size: 16px;
	font-family: Microsoft Yahei;
	color: #fff;
	padding-left: 15px;
	position: relative;
}
</style>
</head>

<body>
	<div id="page-container">
		<div class="panel">
			<div class="ptitle">新建问卷</div>
			<div class="panel-body">
				<form role="form" name="form1" class="form-horizontal"
					action="Createasytj" method="post">
					<fieldset>
						<legend>
							<h4>问卷名称</h4>
						</legend>

						<div class="form-group">
							<label for="IDCard" class="col-sm-3 control-label">问卷名称</label>
							<div class="col-sm-4">
								<input type="text" class="form-control col-sm-6" id="tjname"
									name="tjname" value=''>
							</div>
						</div>

						<legend>
							<h4>问卷内容</h4>
						</legend>
						<div class="form-group">
							<label for="Subject" class="col-sm-3 control-label">问题列表</label>
							<div class="col-sm-9" id="fields">
								<div class="col-sm-7">
									<div class="input-group" id="fields1">
										<input type="text" class="form-control" id="Subject1"
											name="Subject1" placeholder="问题#1" value=''> <input
											style='display:none;' type="text" class="form-control"
											id="SType1" name="SType1" value='0'>
										<div class="input-group-btn">
											<input type="button" class="btn btn-default dropdown-toggle"
												data-toggle="dropdown" id="XSubject1" name="XSubject1"
												value='问题类型▼'>
											<ul class="dropdown-menu pull-right">
												<li><a href="#"
													onClick="$('#XSubject1').val('单选');$('#SType1').val('1');addRadio(this);return false;">单选</a>
												</li>
												<li><a href="#"
													onClick="$('#XSubject1').val('多选');$('#SType1').val('2');addRadio(this);return false;">多选</a>
												</li>
												<li><a href="#"
													onClick="$('#XSubject1').val('填空');$('#SType1').val('3');removeRadio(this);return false;">填空</a>
												</li>
											</ul>
										</div>
									</div>
								</div>
								<div class="col-sm-5" style="display:none;">
									<div class="input-group">
										<input name="choices1" id="choices1" style="border-radius: 4px;" type="text" class="form-control" placeholder="请输入选项，以逗号分隔" value='' />
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-3"></div>
							<div class="col-sm-8">
								<input class="btn btn-primary" type="button" value="增加栏位"
									onClick="addTextBox()" /> 
								<input class="btn btn-success"
									type="button" value="删除栏位" onClick="removeTextBox()" />
							</div>
						</div>
					</fieldset>
			</div>
			<div class="panel-footer">
				<button class="btn btn-primary col-md-offset-7" type="submit" >创建问卷</button>
				<button class="btn btn-primary btn-danger " onClick="history.back(-1)">返回上页</button>
			</div>
			</form>
		</div>



	</div>
	

	
<script type="text/javascript">
  
	var textNumber = 1;
	var choiceNumber = 1;
	function addTextBox() {
		textNumber++;
		var fields = $('#fields');
		var node = '<div class="col-sm-7">'+
						'<div class="input-group" id="fields'+textNumber+'">'+
							'<input type="text" class="form-control" id="Subject'+textNumber+'" name="Subject'+textNumber+'" placeholder="问题#'+textNumber+'">'+
							'<input style="display:none;" type="text" class="form-control" id="SType'+textNumber+'" name="SType'+textNumber+'" value="0">'+
							'<div class="input-group-btn">'+
								'<input type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" id="XSubject'+textNumber+'" name="XSubject'+textNumber+'" value="问题类型▼">'+
									'<ul class="dropdown-menu pull-right">'+
										'<li>'+
											'<a href="#" onClick="$(\'#XSubject'+textNumber+'\').val(\'单选\');$(\'#SType'+textNumber+'\').val(\'1\');addRadio(this);return false;">单选</a>'+
										'</li>'+
										'<li>'+
											'<a href="#" onClick="$(\'#XSubject'+textNumber+'\').val(\'多选\');$(\'#SType'+textNumber+'\').val(\'2\');addRadio(this);return false;">多选</a>'+
										'</li>'+
										'<li>'+
											'<a href="#" onClick="$(\'#XSubject'+textNumber+'\').val(\'填空\');$(\'#SType'+textNumber+'\').val(\'3\');removeRadio(this);return false;">填空</a>'+
										'</li>'+
									'</ul>'+
							'</div>'+
						'</div>'+
					'</div>'+
					'<div class="col-sm-5" style="display:none;">'+
						'<div class="input-group">'+
							'<input name="choices'+textNumber+'" id="choices'+textNumber+'" style="border-radius: 4px;" type="text" class="form-control" placeholder="请输入选项，以逗号分隔" />'+
						'</div>'+
					'</div>';
		fields.append(node);
		var height = document.getElementById("page-container").scrollHeight;
		parent.AdjustIframeHeight(height);
		return false;
	}
	function removeTextBox() {
		var form = $('#fields');
		if (textNumber > 1) {
			//form.removeChild(document.getElementById("fields" + textNumber));
			$('#fields .col-sm-7:eq('+(textNumber-1)+')').remove();
			$('#fields .col-sm-5:eq('+(textNumber-1)+')').remove();
			textNumber--;
		}
		var height = document.getElementById("page-container").scrollHeight;
		parent.AdjustIframeHeight(height);
	}
	function addRadio(obj) {
		$(obj).parents('.col-sm-7').next().css('display', 'block');
	}
	function removeRadio(obj) {
		$(obj).parents('.col-sm-7').next().css('display', 'none');
	}
	
	
	/////add  by  fan
	function submitPara(){
		var number = textNumber;
		alert(number);
		var params = {};
		for(var i=1,j=1;i<number;i++,j++){
			 params["requestList["+i+"].key"] = document.getElementById("Subject"+j).value;
			 var type= document.getElementById("XSubject"+j).value;
			 params["requestList["+i+"].type"] = type;
			 if(type=="填空"){
			 	params["requestList["+i+"].value"] = null;
			 }else{ 
			 	params["requestList["+i+"].value"] = document.getElementById("choices"+j).value;
			 }
			 
		}
	}
		
	
</script>
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
