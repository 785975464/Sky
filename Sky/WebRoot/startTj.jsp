<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
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
	background-color: #dfdfdf;
	background-image: url(http://www.easytj.com/img/bg_noise.jpg);
}

.input-group {
	margin-top: 3px;
	margin-bottom: 3px;
}

.tans-bg {
	background-color: rgba(255, 255, 255, 0.9);
}

.custinput {
	display: inline-block;
	height: 34px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857143;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 4px;
	float: left;
}

.custa {
	display: inline-block;
	height: 34px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857143;
	background-image: none;
	border-radius: 4px;
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
<body>
	<div id="page-container">
		<div class="panel">
			<div class="ptitle">
				问卷详情
				<button
					style="position:absolute;right:20px;top:2px;background-color: #3CBE86;color: #fff;"
					class="btn btn-sm" onClick="history.back(-1)">
					返回
				</button>
			</div>
			<div class="panel-body">
				<s:iterator value="list">
					<div class="form-group col-sm-8 col-sm-offset-2 question">
						<label><s:property value="keysequence" />. <s:property
								value="sheetkey" /> </label>
						<div class="hidden"></div>
						<s:if test="%{keytype == 1}">
							<%
								String choicevalue = (String) request
												.getAttribute("choicevalue");
										choicevalue = choicevalue.replaceAll(",", "，");
										String[] strings = choicevalue.split("，");
										for (int i = 0; i < strings.length; i++) {
											out.println("<div class='radio'>");
											out.println("<label><input type='radio' name='que"
													+ request.getAttribute("keysequence")
													+ "' value='" + strings[i] + "'>" + strings[i]
													+ "</label>");
											out.println("</div>");
										}
							%>
						</s:if>
						<s:elseif test="%{keytype == 2}">
							<%
								String choicevalue = (String) request
												.getAttribute("choicevalue");
										choicevalue = choicevalue.replaceAll(",", "，");
										String[] strings = choicevalue.split("，");
										for (int i = 0; i < strings.length; i++) {
											out.println("<div class='checkbox'>");
											out.println("<label><input type='checkbox' name='que"
													+ request.getAttribute("keysequence")
													+ "' value='" + strings[i] + "'>" + strings[i]
													+ "</label>");
											out.println("</div>");
										}
							%>
						</s:elseif>
						<s:elseif test="%{keytype == 3}">
							<div class="form-group">
								<input type="text" class="form-control"
									name="que<s:property value="keysequence"/>" value="" />
							</div>
						</s:elseif>
					</div>
				</s:iterator>
			</div>
			<!-- 
			<div class="panel-body">
				<form role="form" id="myForm" name="myForm" class="form-horizontal"
					action="http://www.easytj.com/index.php/tongji/storetj"
					method="post">
					<fieldset>
						<input style="display:none;" type="text" class="form-control"
							id="tjid" name="tjid" value="r8NVI5LQeB">
						<div class="form-group">
							<label for="IDCard" class="col-sm-3 control-label">的是德国</label>
							<div class="col-sm-8">
								<input type="text" class="form-control col-sm-6" id="txt0"
									name="txt0" placeholder="" value="">
							</div>
						</div>
						<div class="form-group">
							<label for="IDCard" class="col-sm-3 control-label">放松放松</label>
							<div class="col-sm-8">
								<input type="text" class="form-control col-sm-6" id="txt1"
									name="txt1" placeholder="" value="">
							</div>
						</div>
					</fieldset>
				</form>
			</div>
			
			<div class="panel-footer">
				<button class="btn btn-primary col-md-offset-7" type="button"
					onclick="checkAllBoxName()">提交表格</button>
				<button class="btn btn-default " type="reset">清空输入</button>
			</div>
			 -->
		</div>
	</div>
	<script type="text/javascript">
		function getAnswers() {
			var arr = new Array();
			var obj = $('.question');
			for ( var i = 0; i < obj.length; i++) {
				var cb = $(obj[i]).find('input');
				var ans = "";
				if (cb.length > 1) {
					for ( var j = 0; j < cb.length; j++) {
						if (cb[j].checked) {
							if (ans != "")
								ans += ",";
							ans += $(cb[j]).val();
						}
					}
				} else {
					ans = $(cb[0]).val();
				}
				arr[i] = ans;
				//alert("ans of " + i + " is " + ans);
				//window.location.href="error.jsp";
			}
			window.location.href = "AddRecord";
		}
	</script>
</body>
</html>