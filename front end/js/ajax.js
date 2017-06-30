'use strict'


var baseUrl = "http://localhost:53602/api/";

function getRequest(url, callback) {
    var request = new XMLHttpRequest();
    request.open("GET", url, true);
    request.onreadystatechange = () => {
        if (request.readyState == 4 && request.status >= 200 && request.status < 300) {
            let result = JSON.parse(request.responseText);
            callback(result);
        }
    };
    request.send();
}

function postRequest(url, body, callback) {
    var request = new XMLHttpRequest();
    request.open("POST", url, true);
    request.setRequestHeader("Content-type", "application/json");
    request.onreadystatechange = () => {
        if (request.readyState == 4 && request.status >= 200 && request.status < 300) {
            let result = JSON.parse(request.responseText);
            callback(result);
        }
    };
    request.send(JSON.stringify(body));
}