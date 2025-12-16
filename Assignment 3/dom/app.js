console.log("Hello world");

let element =document.getElementById("btn");
element.style.color="red";

const changeButton= document.getElementById("btn");

const title= document.getElementById("title");
changeButton.addEventListener("click",function(){
    title.textContent="Namste";
});
const changeText1=document.getElementById("name");
const changeText=document.getElementById("btn2");
changeText.addEventListener("click",function(){
   changeText1 .textContent="Login";
});