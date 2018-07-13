//如何表达加法
//动态增加元素

for (var i = 0 ; i < 10; i++) {
    var myP = document.createElement("p");
    myP.style.fontSize = parseInt(i*5)+parseInt(10)+"px";
    myP.innerHTML = "第" + i + "次helloworld";
    document.body.appendChild(myP);
}

