# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
`
window.onload = load();

function load(){
if(get_anchor()){
document.getElementById(get_anchor()).className = "active";
document.getElementById(get_anchor() + "_section").style.display = "block";
}

}

function get_anchor(){
var url = window.location.href.split('#');
if(url.length > 1) return url[url.length-1]
else return false;
}
`