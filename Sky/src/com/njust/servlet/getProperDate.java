package com.njust.servlet;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class getProperDate {
	public static String makeProperDate(String date) {
		//先检查是否包含字母，是的话返回错误信息
		String regex=".*[a-zA-Z]+.*";
		
		
		String birthday = date;
		Calendar time = Calendar.getInstance();
//		try{
//			double tempdate = Double.parseDouble(date);
//			if(tempdate<100){
//				birthday = Math.floor(tempdate)+"";
//			}
//		}
//		catch(Exception e){
//			System.out.println("用户年龄无法转成double型！");
//		}
		
		try{

			Matcher m=Pattern.compile(regex).matcher(date);
			if(m.matches()){			//case0，生日包括字母
				date="/";
				return date;
			}
			
			if(birthday.length()<=3 && birthday.length()>0 ){		//case1，生日长度小于等于3
				if(birthday.contains("/")){							//case1.1，生日中含有/符号
					date="/";
					System.out.println("用户年龄包含/，的学生年龄错误！");
				}
				else if (Integer.parseInt(birthday)<150 && Integer.parseInt(birthday)>=0 ){		//case1.2，输入数字类型（0~150），比如24，转换成当年的1992-01-01
						int tempage = time.get(Calendar.YEAR) - Integer.parseInt(birthday);
						date = tempage+"-01-01";
					}
				else{												//case1.3，其他情况则置为“/”
					date="/";
				}
			}
			else if(birthday.length()<=5){							//case2，生日长度等于4或5，常规输入，①92-5（92-05）；②19925
				if(birthday.contains("/") || birthday.contains("-") || birthday.contains(".")){		//case2.1，常规输入，92-5（92/5，92.05），或者05-5，全部转换为“-”符号
					birthday=birthday.replace("/", "-");
					birthday=birthday.replace(".", "-");
					if( !birthday.endsWith("-") && !birthday.startsWith("-")){
						String[] temparray = birthday.split("-");
						if(temparray.length==2 && temparray[0].length()==2 && temparray[1].length()<=2){	//只允许存在92-1（92-01，92-10，09-10，09-01）这种形式，而不能9-12
							int birthyear = Integer.parseInt(temparray[0]);
							int birthmon = Integer.parseInt(temparray[1]);
							if(birthmon>=1 && birthmon<=12){	//月份输入合法
								if(birthyear<=time.get(Calendar.YEAR)-2000 && birthyear>=0){			//case2.2，介于0~16，默认为本世纪
									if(birthyear<10 && birthyear>=0 ){								//小于10，一位数
										if(birthmon<10){
											date = "200"+birthyear+"-0"+birthmon+"-01";
										}
										else{
											date = "200"+birthyear+"-"+birthmon+"-01";
										}
									}
									else{ //if(birthyear>=10){		//大于等于10，两位数
										if(birthmon<10){
											date = "20"+birthyear+"-0"+birthmon+"-01";
										}
										else{
											date = "20"+birthyear+"-"+birthmon+"-01";
										}
									}
								}
								else if(birthyear>time.get(Calendar.YEAR)-2000 && birthyear<=99){		//case2.3，介于16~99，默认为上世纪
									//date = "19"+birthyear+"-0"+birthmon+"-01";
									if(birthmon<10){
										date = "19"+birthyear+"-0"+birthmon+"-01";
									}
									else{
										date = "19"+birthyear+"-"+birthmon+"-01";
									}
								}
								else{		//case2.4，年份不合法，出现负数
									date="/";
								}
							}
							else{													//case2.5，月份输入不合法
								date="/";
							}
						}
						else{						//case2.6，含连接符的4、5位数不合法
							date="/";
						}
					}
					else{		//case2.7，连接符位置不合法
						date="/";
					}
				}
				else if(birthday.length()==4){
					if( Integer.parseInt(birthday)>=1900 && Integer.parseInt(birthday)<=time.get(Calendar.YEAR) ){//case2.8，输入4位数合法纯数字
						date = birthday+"-01-01";
					}
					else{ 
						date = "/";		//case2.9，输入4位数不合法数字
					}
				}
				else{// if(birthday.length()==5){		//输入5位数数字
					if( Integer.parseInt(birthday.substring(0, 4))>=1900 && Integer.parseInt(birthday.substring(0, 4))<=time.get(Calendar.YEAR) 
							&& Integer.parseInt(birthday.substring(4))>=0 && Integer.parseInt(birthday.substring(4))<10 ){//case2.10，输入5位数数字，如20051
						date = birthday.substring(0, 4)+"-0"+birthday.substring(4)+"-01";
					}
					else{ 
						date = "/";		//case2.11，输入5位数不合法数字
					}
				}
			}
			else if(birthday.length()<=8){	//case3，生日长度等于6、7或8，常规输入，①1992-5（1992-05）；②1992-1-1；③92-10-10（92-1-1）；④19920101，⑤199201，⑥920101
				if(birthday.contains("/") || birthday.contains("-") || birthday.contains(".")){		//case3.1，常规输入，①1992-5（1992-05）；②1992-1-1；③92-10-10（92-1-1）全部转换为“-”符号
					birthday=birthday.replace("/", "-");
					birthday=birthday.replace(".", "-");
					if( !birthday.endsWith("-") && !birthday.startsWith("-")){
						String[] temparray = birthday.split("-");
						if(temparray.length==2 && temparray[0].length()==4 && temparray[1].length()<=2){	//情况①，只允许存在1992-1（1992-01，1992-10，2009-10,2009-1）这种形式，而不能992-10
							int birthyear = Integer.parseInt(temparray[0]);
							int birthmon = Integer.parseInt(temparray[1]);
							if(birthmon>=1 && birthmon<=12){	//月份输入合法
								if(birthyear<=time.get(Calendar.YEAR) && birthyear>=1900){			//case3.2，介于1900~2016
									if(birthmon<10){
										date = birthyear+"-0"+birthmon+"-01";
									}
									else{
										date = birthyear+"-"+birthmon+"-01";
									}
								}
								else{		//case3.4，年份不合法，小于1900或大于2016
									date="/";
								}
							}
							else{													//case3。4，月份输入不合法
								date="/";
							}
						}
						else if(temparray.length==3){	//情况②、③，只允许存在1992-1-1，或92-01-01（92-1-1）这种形式
							if(temparray[0].length()==4  && temparray[1].length()==1 && temparray[2].length()==1){	//case3.5，情况②1992-1-1
								int birthyear = Integer.parseInt(temparray[0]);
								int birthmon = Integer.parseInt(temparray[1]);
								int birth_d = Integer.parseInt(temparray[2]);
								if( birthyear<=time.get(Calendar.YEAR) && birthyear>=1900 && 
										birthmon>=1 && birthmon<10 && birth_d>=1 && birth_d<10 ){	//case3.6，年月日输入合法，介于1900~2016
									date = birthyear+"-0"+birthmon+"-0"+birth_d;
								}
								else{		//case3.7，年月日输入不合法
									date="/";
								}
							}
							else if(temparray[0].length()==2  && temparray[1].length()<=2 && temparray[2].length()<=2){		//case3。8，情况③92-10-10（92-1-1）
								int birthyear = Integer.parseInt(temparray[0]);
								int birthmon = Integer.parseInt(temparray[1]);
								int birth_d = Integer.parseInt(temparray[2]);
								if(birthyear>time.get(Calendar.YEAR)-2000 && birthyear<=99){		//case3.9，介于16~99，默认为上世纪
									//判断日期是否合法
									if( ((birthmon==1 || birthmon==3 || birthmon==5 || birthmon==7 || birthmon==8 || birthmon==10 || birthmon==12)	//大月
											&& birth_d>0 && birth_d<=31)
											||
										((birthmon==4 || birthmon==6 || birthmon==9 || birthmon==11)	//小月
											&& birth_d>0 && birth_d<=30 )
											||
										(((1900+birthyear)%100==0 && (1900+birthyear)%400==0) || ((1900+birthyear)%100!=0 && (1900+birthyear)%4==0)	//平月
											&& (birthmon==2 && birth_d>0 && birth_d<=28 ))
									){	//判断大、小、平月
										if(birthmon<10){
											if(birth_d<10){
												date = "19"+birthyear+"-0"+birthmon+"-0"+birth_d;
											}
											else{
												date = "19"+birthyear+"-0"+birthmon+"-"+birth_d;
											}
										}
										else{
											if(birth_d<10){
												date = "19"+birthyear+"-"+birthmon+"-0"+birth_d;
											}
											else{
												date = "19"+birthyear+"-"+birthmon+"-"+birth_d;
											}
										}
									}
									else{		//case3。10，日期输入不合法
										date="/";
									}
								}
								else if(birthyear<=time.get(Calendar.YEAR)-2000 && birthyear>=0){		//case3.11，介于0~16，默认为本世纪
									//判断日期是否合法
									if( ((birthmon==1 || birthmon==3 || birthmon==5 || birthmon==7 || birthmon==8 || birthmon==10 || birthmon==12)	//大月
											&& birth_d>0 && birth_d<=31)
											||
										((birthmon==4 || birthmon==6 || birthmon==9 || birthmon==11)	//小月
											&& birth_d>0 && birth_d<=30 )
											||
										(((2000+birthyear)%100==0 && (2000+birthyear)%400==0) || ((2000+birthyear)%100!=0 && (2000+birthyear)%4==0)	//平月
											&& (birthmon==2 && birth_d>0 && birth_d<=28 ))
									){	//判断大、小、平月
										int temp_bd = birthyear+2000;
										if(birthmon<10){
											if(birth_d<10){
												date = temp_bd+"-0"+birthmon+"-0"+birth_d;
											}
											else{
												date = temp_bd+"-0"+birthmon+"-"+birth_d;
											}
										}
										else{
											if(birth_d<10){
												date = temp_bd+"-"+birthmon+"-0"+birth_d;
											}
											else{
												date = temp_bd+"-"+birthmon+"-"+birth_d;
											}
										}
									}
									else{		//case3。12，日期输入不合法
										date="/";
									}
								
								}
								else{													//case3。13，月份输入不合法
									date="/";
								}
									
							}
							else{				//case3.14，三段输入不合法，如992-1-1
								date="/";
							}
						}
						else{						//case3.15，多段位数不合法，如92-1-1-1
							date="/";
						}
					}
					else{		//case3.16，连接符位置不合法
						date="/";
					}
				}
				//case3.17，情况④19920101，⑤199201，在后面补足8位，⑥920101
				else if(birthday.matches("^\\d+$")){	//正则匹配纯数字
					if(birthday.length()==6 && Integer.parseInt(birthday.substring(0, 4))>=1900 && Integer.parseInt(birthday.substring(0, 4))<=time.get(Calendar.YEAR) 
							&& Integer.parseInt(birthday.substring(4))>0 && Integer.parseInt(birthday.substring(4))<=12){	//case3.18，情况⑤199201，在后面补足8位
						birthday+="01";
					}
					else if(birthday.length()==6 && Integer.parseInt(birthday.substring(0, 2))>0 && Integer.parseInt(birthday.substring(0, 2))<=time.get(Calendar.YEAR)-2000 ){
						//case3.19，⑥050101
						birthday="20"+birthday;
					}
					else if(birthday.length()==6 && Integer.parseInt(birthday.substring(0, 2))>time.get(Calendar.YEAR)-2000 && Integer.parseInt(birthday.substring(0, 2))<99 ){
						//case3.20，⑥920101
						birthday="19"+birthday;
					}
					if(birthday.length()==8){
						String temp_birthday = birthday.substring(0, 4)+"-"+birthday.substring(4, 6)+"-"+birthday.substring(6, 8);
						DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
						Date dt = df.parse(temp_birthday);
						date = df.format(dt).toString();
					}
					else{
						date="/";			//case3.21，长度不足8位，比如1992011
					}
				}
				else{
					date="/";			//case3.22，其他的不合法输入，比如1992@1-1
				}
			}
			else if(birthday.length()<=10){	//case4，生日长度等于9或10，常规输入，①1992-01-01（1992-01-1，1992-1-01），②1992-0101
				if(birthday.contains("/") || birthday.contains("-") || birthday.contains(".")){		//case4.1，常规输入①1992-01-01（1992-01-1，1992-1-01），全部转换为“-”符号
					birthday=birthday.replace("/", "-");
					birthday=birthday.replace(".", "-");
					String[] temparray = birthday.split("-");
					if(birthday.length()==9 && temparray.length==2 ){				//case4.2，情况②1992-0101
						birthday=birthday.substring(0, 7)+"-"+birthday.substring(7);
					}
					DateFormat df = new SimpleDateFormat("yyyy-MM-dd");		//转换标准格式日期
					Date dt = df.parse(birthday);
					Date dt_start = df.parse("1900-01-01");
					if(dt.before(new Date()) && dt.after(dt_start)){		//日期范围1900~当前日期
						date = df.format(dt).toString();
					}
					else{
						date="/";
					}
				}
				else{
					date="/";			//case4.2，没有连接符，不符合规范
				}
			}
			else{
				date="/";				//case5，长度大于10的不合法输入
			}
		
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("该名学生年龄错误！");
			date="/";					//case6，其他不合法输入
		}
		return date;
	}
}
