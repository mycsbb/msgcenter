if (typeof String.prototype.trim !== 'function') {
	String.prototype.trim = function() {
		return this.replace(/^\s+|\s+$/g, '');
	};
}
//判断浏览器
function getBStype(jquery) {
	alert(57557);
	if(jquery.browser.msie) { 
		var isIE = !!window.ActiveXObject;  
		var isIE6 = isIE && !window.XMLHttpRequest;  
		var isIE8 = isIE && !!document.documentMode;  
		var isIE7 = isIE && !isIE6 && !isIE8; 
		
		if (isIE6) return "ie6";
		if (isIE7) return "ie7";
		if (isIE8) return "ie8";
	} 
	else if(jquery.browser.safari) 
	{ 
		return "safari";
	} else if(jquery.browser.mozilla) { 
		return "mozilla";
	} else if(jquery.browser.opera) { 
		return "opera";
	} else { 
		return "unknown";
	} 
}

function currentTime() {
	var d = new Date(), str = '';
	str += d.getFullYear() + '年';
	str += d.getMonth() + 1 + '月';
	str += d.getDate() + '日';
	str += " " + d.getHours() + '时';
	str += d.getMinutes() + '分';
	str += d.getSeconds() + '秒';
	
	return str;
}

//显示对象所有属性
function showObject(obj) {
	var str = ""; 
	for (var p in obj) {
		str = str + p + ": " + obj[p] + "\n";
	}
	alert(str);
}

//下面是Map类
Array.prototype.remove = function(s) {   
    for (var i = 0; i < this.length; i++) {   
        if (s == this[i])   
            this.splice(i, 1);   
    }   
};

/**   
 * var m = new Map();  
 * m.put('key','value');  
 * ...  
 * var s = "";  
 * m.each(function(key,value,index){  
 *      s += index+":"+ key+"="+value+"/n";  
 * });  
 * alert(s);  
 */  
function Map() {   
    /** 存放键的数组(遍历用到) */  
    this.keys = new Array();   
    /** 存放数据 */  
    this.data = new Object();   
       
    /**  
     * 放入一个键值对  
     * @param {String} key  
     * @param {Object} value  
     */  
    this.put = function(key, value) {   
        if(this.data[key] == null){   
            this.keys.push(key);   
        }   
        this.data[key] = value;   
    };   
       
    /**  
     * 获取某键对应的值  
     * @param {String} key  
     * @return {Object} value  
     */  
    this.get = function(key) {   
        return this.data[key];   
    };   
       
    /**  
     * 删除一个键值对  
     * @param {String} key  
     */  
    this.remove = function(key) {   
        this.keys.remove(key);   
        this.data[key] = null;   
    };   
       
    /**  
     * 遍历Map,执行处理函数  
     *   
     * @param {Function} 回调函数 function(key,value,index){..}  
     */  
    this.each = function(fn){   
        if(typeof fn != 'function'){   
            return;   
        }   
        var len = this.keys.length;   
        for(var i=0;i<len;i++){   
            var k = this.keys[i];   
            fn(k,this.data[k],i);   
        }   
    };   
    
//    this.clear = function() {
//		for (var i = 0; i < this.keys.length; i++) {
//			this.keys.remove(keys[i]);
//			this.data[key] = null;
//		}
//    };
       
    /**  
     * 获取键值数组(类似Java的entrySet())  
     * @return 键值对象{key,value}的数组  
     */  
    this.entrys = function() {   
        var len = this.keys.length;   
        var entrys = new Array(len);   
        for (var i = 0; i < len; i++) {   
            entrys[i] = {   
                key : this.keys[i],   
                value : this.data[i]   
            };   
        }   
        return entrys;   
    };   
       
    /**  
     * 判断Map是否为空  
     */  
    this.isEmpty = function() {   
        return this.keys.length == 0;   
    };   
       
    /**  
     * 获取键值对数量  
     */  
    this.size = function(){   
        return this.keys.length;   
    };   
       
    /**  
     * 重写toString   
     */  
    this.toString = function(){   
        var s = "{";   
        for(var i=0;i<this.keys.length;i++,s+=','){   
            var k = this.keys[i];   
            s += k+"="+this.data[k];   
        }   
        s+="}";   
        return s;   
    };   
}   
  
  
function testMap(){   
    var m = new Map();   
    m.put('key1','Comtop');   
    m.put('key2','南方电网');   
    m.put('key3','景新花园');   
    //alert("init:"+m);   
       
    m.put('key1','康拓普');   
   // alert("set key1:"+m);   
       
    m.remove("key2");   
   // alert("remove key2: "+m);   
    
    m.clear();
    var s ="";   
    m.each(function(key,value,index){   
        s += index+":"+ key+"="+value+"\n";   
    });   
    alert(s);   
}  

function getElementPosition(obj) {
	var actualLeft = obj.offsetLeft;
	var current = obj.offsetParent;
	while (current != null) {
		actualLeft += current.offsetLeft;
		current = current.offsetParent;
	}

	var actualTop = obj.offsetTop;
	var current = obj.offsetParent;
	while (current != null) {
		actualTop += current.offsetTop;
		current = current.offsetParent;
	}
	var position = {
		left : actualLeft,
		top : actualTop
	};

	return position;
}