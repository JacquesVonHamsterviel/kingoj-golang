

function $(str){
 return document.getElementById(str);
}
function $$(str){
 return document.getElementsByName(str);
}
function $$$(str){
 return document.getElementsByTagName(str);
}
//check browser type: IE ,FireFox...
var isIE = false;
function checkType(){
 if(document.all){
  isIE = true;
 }
}

/*
给String增加trim函数,用法如下:
var str = "  test  ".trim();
这样得到的str的内容就是test
*/
String.prototype.trim=function(){
	return this.replace(/(^\s*)|(\s*$)/g,"");
}
/*
表格排序,参数说明
id : 待排序的表格的名称
type : 排序的类型(num:按数字;str:按字符串)
obj : 排序的列(使用的时候写入this即可)
start : 排序的起始行(主要是去掉无须排序的其它行)
end : table最后无需参与排序的行数
例如:
需要对table1进行排序,由于第一行是表头,所以不参与排序,其余行全部都需要参与排序,所以写法如下,需要增加一个sortType
<td onClick="sortTable('table1','str',this,1,0)" sortType="asc">
*/
function sortTable(id, type, obj, start, end) {
	var tblEl = $(id);
	var i, j;
	var minVal, minIdx;
	var testVal;
	var cmp;
	var col = obj.cellIndex;
	var start = 1;
	var total = new Array();
	var str = new Array();
	var order = obj.sortType;
	var rowCount = tblEl.rows.length; //得到行数
	if (isNaN(rowCount) || rowCount == start) return; //没有纪录就不需要排序了
	for (i = start; i < rowCount - end; i++) {
		total[i - start] = tblEl.rows[i];
		str[i - start] = tblEl.rows[i].cells[col].innerText.trim();
	}

	for (var step = str.length >> 1; step > 0; step >>= 1) {
		for (var i = 0; i < step; ++i) {
			for (var j = i + step; j < str.length; j += step) {
				var k = j;
				var value = str[j];
				var rowValue = total[j];
				while (k >= step && compareValues(str[k - step], value, type, order) > 0) {
					str[k] = str[k - step];
					total[k] = total[k - step];
					k -= step;
				}
				str[k] = value;
				total[k] = rowValue;
			}
		}
	}

	for (i = 0; i < total.length; i++) {
		tblEl.rows[start - 1].insertAdjacentElement("beforeEnd", total[i]);
	}

	if (order == "asc") {
		obj.sortType = "desc";
	} else {
		obj.sortType = "asc";
	}
}

function compareValues(v1, v2, type, order) {
	var f1, f2;

	if (v1 == "" && order == "asc") {
		return 1; //如果内容为空,排序时就放置在最后一行
	}
	if (v2 == "" && order == "asc") {
		return - 1; //如果内容为空,排序时就放置在最后一行
	}

	if (type == "gb") {
		return v1.localeCompare(v2);
	}

	if (type == "num") {
		re = /,/g;
		v1 = v1.replace(re, "");
		v2 = v2.replace(re, "");
		if (isDec(v1)) {
			v1 = parseFloat(v1);
		}

		if (isDec(v2)) {
			v2 = parseFloat(v2);
		}
	}

	if (v1 == v2) {
		return 0;
	}
	if (v1 > v2) {
		if (order == "asc") {
			return 1;
		} else {
			return - 1;

		}
	} else {
		if (order == "asc") {
			return - 1;
		} else {
			return 1;

		}
	}
}


var EACH = function(o,fn){for(var i=1;i<o.length;i++){fn.call(o[i],i,o); if(i==o.length-1) return o}}
var setAttrib = function(){this.init.apply(this,arguments)};
setAttrib.prototype={
	init:function(o){
		EACH($(o.id).rows,function(i,O){
			i%2== +!!o.parity ? this.style.background = o.cor1:'';
			this['color'] = this.style.background;
			this.onmouseover = function(){this.style.background = o.cor2}
			this.onmouseout = function(){this.style.background = this['color']}
			this.onclick = function(){this.style.fontWeight = this.style.fontWeight == 'bold' ? 'normal' : 'bold'}
			})
	}
};
new setAttrib({id:'myTable',cor1:'#DDDDE4',cor2:'#BAD0FC'});

var RS=$('myTable').rows;
for(i=1;i<RS.length;i++){
	var TD=RS[i].getElementsByTagName('td')
	var probid=TD[0].innerText.trim();
	TD[0].innerHTML='<a href=\x22submit/' + probid + '\x22 target=_blank>' + probid + '</a>';
	var probName=TD[1].innerText.trim();
	TD[1].innerHTML='<a href=\x22prob/' + probName + '\x22 target=_blank>☆</a> <a href=\x22prob/' + probName + '/prob.html\x22 target=_blank>' + probName + '</a>';
	var result=TD[2].innerText.trim();
	TD[2].innerHTML='<a href=\x22submit/' + probid+ '/prog.pas\x22 target=_blank>' + result + '</a>';
}



function hiddNotRight(){
	//隐藏错误行
	var RS=$('myTable').rows;
	for(i=1;i<RS.length;i++){
		var result=RS[i].getElementsByTagName('td')[4].innerText.trim();
		if(result!='Accepted')
			RS[i].style.display=($('ch').checked)?'none':'';
	}

}
hiddNotRight();