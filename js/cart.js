function addcart(){
    var num = document.getElementById("qty").value;
    var id = document.getElementById("itemid").value;
    var url = 'addcart.jsp?id='+id+'&num='+num;
    var request=request_creat('GET',url)
    request.onreadystatechange = function () {
    if (request.readyState === 4) { 
        if (request.status === 200) {
            var meg = document.getElementById("success");
            meg.innerHTML="Quantity:        "+request.responseText;
            location.replace(location.href);
        } else {
            return 0;
        }
    } else {   } }
    request.send();
}

function quick_addcart(){
    var num = document.getElementById("qty").value;
    var id = document.getElementById("itemid").value;
    var url = 'addcart.jsp?id='+id+'&num='+num;
    var request=request_creat('GET',url)
    request.onreadystatechange = function () {
    if (request.readyState === 4) { 
        if (request.status === 200) {
            var meg = document.getElementById("success");
            meg.innerHTML="Quantity:        "+request.responseText;
        } else {
            return 0;
        }
    } else {   } }
    request.send();
}

function addcart_id(id){
    var url = 'addcart.jsp?id='+id+'&num=1';
    var request=request_creat('GET',url)
    request.onreadystatechange = function () {
    if (request.readyState === 4) { 
        if (request.status === 200) {
            location.replace(location.href);
        } else {
            return 0;
        }
    } else {   } }
    request.send();
}

function delcart(id){
    var url = 'delcart.jsp?id='+id;
    var request=request_creat('GET',url)
    request.onreadystatechange = function () {
    if (request.readyState === 4) { 
        if (request.status === 200) {
            location.replace(location.href);
        } else {
            return 0;
        }
    } else {   } }
    request.send();
}

function change_list_grid(){
    if(location.href.indexOf("list") >-1)
        location.replace(location.href.replace(/list/, "grid"));
    else
        location.replace(location.href.replace(/grid/, "list"));

}

function request_creat(method,url){
    var request;
    if (window.XMLHttpRequest) {
        request = new XMLHttpRequest();
    } else {
        request = new ActiveXObject('Microsoft.XMLHTTP');
    }
    if(method=="POST"){
    request.open("POST",url,true);
    }
    if(method=="GET"){
    request.open("GET",url);
    }
    return request;
}
