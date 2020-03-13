<%@page import="com.clh.util.CarComparator"%>
<%@page import="com.clh.bean.*,
java.util.List,
com.clh.dao.CarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <meta name="author" content="order by dede58.com"/>
			<title>小米汽车商城</title>
		<script type="text/javascript" src="./js/index.js"></script>
		<link rel="stylesheet" type="text/css" href="./css/style.css">
		<link rel="stylesheet" type="text/css" href="./css/myself.css">
		<style>
			 body{
				background: rgb(159, 195, 204);
			 }
			 .chaxun{
			 display: inline-block;
			  border-radius: 2px;
			  background-color: #f0b762;
			  border: none;
			  color: #FFFFFF;
			  text-align: center;
			  font-size: 14px;
			  padding: 2px;
 		 	  width: 70px;
			  cursor: pointer;
			  margin: 5px;
			 } 
		</style>
		</head>
	<body>
<%	//获取sessio用户名
	User user=new User();
	user.setUsername((String)session.getAttribute("username"));
	int flag=0;
	String u=null;
	if(user.getUsername()!=null){
		flag=1;
	}
	//展示车子
	CarDAO dao = new CarDAO();
	List<Car> cars=null;
	String daohang=request.getParameter("daohang");
	if(daohang==null){
		cars =dao.getAllProductCar();
		cars.sort(new CarComparator());
	}else{
		cars=dao.list(daohang);
		//可以在Cars里写一个比较器来比较大小
		cars.sort(new CarComparator());
	}
	
	%>
	<script>
        onload=function(){
        	if(<%=flag%>==1){
        		document.getElementById("dl").innerText="欢迎您：<%=user.getUsername()%>";
        		document.getElementById("zc").innerHTML="<a href='LogoutServlet' target='_blank' >注销</a>";
        		document.getElementById("gouwuche").innerHTML="<a href='cart.jsp'>购物车</a>"
        		document.getElementById("sousuo").innerHTML="<input type='submit' class='sousuo' value='搜索' id='find' />"
       			document.getElementById("xiangxi").innerHTML="<input type='submit' class='chaxun' value='详细查询'>"
        	}else{
        		document.getElementById("dl").innerText="登录";
        		document.getElementById("zc").innerHTML="<a href='./register.html' target='_blank' >注册</a>";
        		document.getElementById("sousuo").innerHTML="<input type='button' class='sousuo' value='搜索' id='find' />"
       			document.getElementById("xiangxi").innerHTML="<input type='button' class='chaxun' value='详细查询' id='chaxunSpan'>"
       			document.getElementById("gouwuche").innerHTML="<a href='javascript:void(0)'>购物车</a>"
        		document.getElementById("gouwucheDiv").onclick=function(){
        			alert("请登录后再使用购物车功能！")
        		}
        		document.getElementById("sousuo").onclick=function(){
        			alert("请登录后再使用购物车功能！")
        		}
        		document.getElementById("gouwucheDiv").onclick=function(){
        			alert("请登录后再使用购物车功能！")
        		}
        		document.getElementById("chaxunSpan").onclick=function(){
        			alert("请登录后再使用详细查找功能！")
        		}
        	}

		
			document.getElementById("find").onclick=function(){
				var textfind=document.getElementById("textfind");
				textfind.value=textfind.value.trim();
				if(textfind.value.length==0){
					alert("搜索不能为空！！")
					return false;
				}
			}
			var chaopao=document.getElementById("chaojipaoche");
			chaopao.onclick=function(){
				chaopao.value="跑车";
				alert(chaopao.value);
			} 		
        }	
    </script>

	<!-- start header -->
		<header>
			<div class="top center">
				<div class="left fl">
					<ul>
						<li><a href="index.jsp" target="_blank"><span style="font-size:20px">首页</span></a></li>
					
				
					</ul>
				</div>
				<div class="right fr">
					<div class="gouwuche fr" id="gouwucheDiv"><span id="gouwuche"></span></div>
					<div class="fr">
						<ul>
							<li><a href="./login.html" target="_blank"><span id="dl"></span></a></li>
							<li>|</li>
							<li id="zc"><a href="./register.html" target="_blank" ></a></li>

						</ul>
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
		</header>
	<!--end header -->

<!-- 列表导航 -->
		<div id="menu">
		<form action="FindServlet" method="GET"> 
		<ul>
			<li><a href="javascript:void(0)" class="drop"><h2>分类：</h2></a></li>
			<li><a href="http://localhost:8080/Shopping/index.jsp?daohang=SUV" class="drop">SUV</a></li>
			<li><a href="http://localhost:8080/Shopping/index.jsp?daohang=跑车" class="nodrop" id="chaopao" >跑车</a></li>
			<li><a href="http://localhost:8080/Shopping/index.jsp?daohang=保时捷" class="nodrop">保时捷</a></li>
			<li><a href="http://localhost:8080/Shopping/index.jsp?daohang=宝马" class="nodrop">宝马</a></li>
			<li><a href="http://localhost:8080/Shopping/index.jsp" class="nodrop">全部</a></li>
			<!-- <li><a href="http://localhost:8080/Shopping/FindServlet?carInf=" class="nodrop">销量排行</a></li> -->
		</ul>
		</form>
		</div>
<!-- start banner_x -->
		<div class="banner_x center">
			
			<div class="search fr">
				<form action="infCars.jsp" method="get">
					<div class="text fl">
						<input type="text" class="shuru" name="carInf" placeholder="搜索汽车信息" id="textfind"/>
					</div>
					<div class="submit fl">
						<span id="sousuo"></span>  <!--js插入搜索按钮  -->
					</div>
					<div class="clear"></div>
				</form>
				<div class="clear"></div>
			</div>
		</div>

<!-- end banner_x -->

	<!-- start banner_y -->
	
	
	<div>	
			<form action="infCars.jsp" method="GET">
				<table style="position: absolute;left:19%; top: 20%;width: auto;height: auto;padding:20px;background: rgba(255, 255, 255, 0.2)">
				<div>
					<tr>
						<td>
							<div style="color: red;margin-bottom:10px"><h2>全部车辆：</h2></div>
						</td>
							
								<td>
										<select name="carInf"> 
												<option value =""  >全部</option>
												<option value ="宝马"  >宝马</option>
												<option value ="奔驰">奔驰</option>
												<option value ="保时捷">保时捷</option>
												<option value ="奥迪">奥迪</option>
												<option value ="法拉利">法拉利</option>
												<option value ="兰博基尼">兰博基尼</option>									
										</select>
										&nbsp;&nbsp;<select name="carInf2"> 
												<option value ="">全部</option>
												<option value ="跑车">超级跑车</option>
												<option value ="大型轿车">大型轿车</option>
												<option value ="皮卡">皮卡</option>
												<option value ="SUV">SUV</option>									
										</select>								
								</td>
								<td><span id="xiangxi"></span></td>
							
					</tr>

					<div style="text-align:center">
					<%int i=0;%>
					<%for(Car c : cars){
						i++;
						if(i%5==1){
							out.print("<tr style='text-align:center'><td ><a href='http://localhost:8080/Shopping/information.jsp?carInf="+c.getCno()+"'><img src="+c.getImg()+" width='200px'/><br><span class='cname'>"+c.getCname()+" "+"</span>"+
								"&nbsp&nbsp<span style='color:red'>"+c.getPrice()+"</span></a></td>");
						}
						else if(i%5==0){
							out.print("<td><a href='http://localhost:8080/Shopping/information.jsp?carInf="+c.getCno()+"'><img src="+c.getImg()+" width='200px'/><br><span class='cname'>"+c.getCname()+" "+"</span>"+
								"&nbsp&nbsp<span style='color:red'>"+c.getPrice()+"</span></a></td><tr>");
						}else{
							out.print("<td><a href='http://localhost:8080/Shopping/information.jsp?carInf="+c.getCno()+"'><img src="+c.getImg()+" width='200px'/><br><span class='cname'>"+c.getCname()+" "+"</span>"+
									"&nbsp&nbsp<span style='color:red'>"+c.getPrice()+"</span></a></td>");
						}
												
					}  
					%>
					</div>
				
				</div>
				</table>
			</form>
		</div>

		
	<!-- end banner -->


	<!-- start danpin -->
		
		
		
	</body>
</html>