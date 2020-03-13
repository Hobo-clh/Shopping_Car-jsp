	
function sousuo() {
	
	document.getElementById("find").onclick=function(){
		var textfind=document.getElementById("textfind");
		textfind.value=textfind.value.trim();
		if(textfind.value.length==0){
			alert("搜索不能为空！！")
			return false;
		}
	}
}
function paoche() {
	var chaopao=document.getElementById("chaojipaoche");
	chaopao.onclick=function(){
		chaopao.value="跑车";
		alert(chaopao.value);
	}
}
