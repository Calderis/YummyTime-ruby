# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
`
window.onload = load();

function load(){
if(get_anchor()){
switch_to(get_anchor());
}

}

function get_anchor(){
var url = window.location.href.split('#');
if(url.length > 1) return url[url.length-1]
else return false;
}

function switch_to(anchor){
elemA = document.getElementById(anchor)
elemB = document.getElementById(anchor + "_section")
if(elemA) elemA.className = "active";
if(elemB) elemB.style.display = "block";
}
`