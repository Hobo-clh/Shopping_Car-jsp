<%@page import="sun.security.krb5.internal.crypto.crc32"%>
<%@page import="com.clh.dao.CartDAO"%>
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
			.xiangqing{
			font-size:30px;
			position:absolute;
			top:8%;
			left:35%;
			}
			.cart{
			font-weight:bold;
			} 
			#cartInfor{
			position:absolute;
			left:20%;
			top:15%;
			text-align:center;
			border:10px;
			width:auto;
			height:auto;
			padding:20px;
			background: rgba(255, 255, 255, 0.2);
			}
			#cartInfor tr td{
			width:100px;
			}
			.delbutton{
			  display: inline-block;
			  border-radius: 4px;
			  background-color: #f0b762;
			  border: none;
			  color: #FFFFFF;
			  text-align: center;
			  font-size: 10px;
			  padding: 2px;
 		 	  width: 50px;
			  transition: all 0.5s;
			  cursor: pointer;
			  margin: 5px;
			}
			
			.jiesuan {
			  display: inline-block;
			  border-radius: 4px;
			  background-color: #f4511e;
			  border: none;
			  color: #FFFFFF;
			  text-align: center;
			  font-size: 15px;
			  padding: 12px;
 		 	  width: 125px;
			  transition: all 0.5s;
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
	
	CartDAO dao = new CartDAO();
	CarDAO dao1 = new CarDAO();
	List<Cart> carts=null;
	carts=dao.findCarts(user.getUsername());
	%>
	<script>
        onload=function(){
        	if(<%=flag%>==1){
       
        		document.getElementById("dl").innerText="欢迎您：<%=user.getUsername()%>";
        		document.getElementById("zc").innerHTML="<a href='LogoutServlet' target='_blank' >注销</a>";
        	}else{
        		document.getElementById("dl").innerText="登录";
        		document.getElementById("zc").innerHTML="<a href='./register.html' target='_blank' >注册</a>";
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
					<div class="gouwuche fr"><a href="gouwuche.jsp">购物车</a></div>
					<div class="fr">
						<ul>
							<li><a href="./login.html" target="_blank"><span id="dl"></span></a></li>
							<li>|</li>
							<li id="zc"><a href="./register.html" target="_blank" ></a></li>
							<li>|</li>
							<li><a href="">消息通知</a></li>
						</ul>
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
		</header>
	<!-- 商品 -->
	
	<div class="cart" >
		<span class="xiangqing">购物车详情如下：</span>
		
		
		<table id="cartInfor">
			<tr>
			<td>图片</td><td>产品编号</td><td>汽车名</td><td>价格(w)</td><td>数量</td><td></td>
			</tr>
				<%int i=1;
				if(carts.isEmpty()){%>
					<tr ><td colspan="4"><span style="font-size:50px;padding:30px">购物车为空</span></td></tr>
				<%}else{
					//遍历购物车列表
					for(Cart cr:carts){
					Car cc= dao1.oneCar("'"+cr.getCno()+"'");
					%>
					<form action="DelCartServlet" method="post">
							<tr>
								<td><img src=<%=cc.getImg()%> style="width:150px"></td>
								<td><%=cc.getCno() %></td>
								<td><%=cc.getCname() %></td>
								<td><span id="wudi<%=i%>"></span></td>			
								<td><%=cr.getNum() %></td>
								<td><input type="hidden" name="cno" value="<%=cc.getCno()%>">
								<input type="hidden" name="username" value="<%=cr.getUsername()%>">
								<input type="submit" class="delbutton" value="删除" id="del">
								</td>
							</tr>		
								<script type="text/javascript"> <!-- 计算价格-->
										var zongjia = document.getElementById("wudi<%=i%>");
										zongjia.innerText=<%=cc.getPrice()*cr.getNum()%>
								</script>	
					</form>	
					<%i++;
					}
				}%>
				<tr>
			<td colspan="4"><div style="font-size:30px;">总价格(w):<span id="price" style="color:red;"></span></div></td>
			<td colspan="2"><input type="button" class="jiesuan" value="结算"></td>
			</tr>
		</table>
			<script type="text/javascript"> /*计算总价格  */
				var price=document.getElementById("price");
				<%if(carts.isEmpty()){%>
					price.innerText="0"
				<%}else{
					double s=0;
					for(Cart cr:carts){
						Car cc= dao1.oneCar("'"+cr.getCno()+"'");
						s=s+cc.getPrice()*cr.getNum();
					}%>
					price.innerText=<%=s%>;
				<%}%>
			</script>
	</div>

		
	</body>
</html>