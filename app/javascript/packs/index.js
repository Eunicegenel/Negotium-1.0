document.addEventListener('mousemove', function(e){
  this.querySelectorAll('.layer').forEach(el=>{
    const score = parseInt(el.getAttribute('pos'));
    const x = (window.innerWidth - e.pageX * score) / 100;
    const y = (window.innerWidth - e.pageY * score) / 100;

    el.style.transform = `
          translateX(${x}px)
          translateY(${y}px)
    `;
  })
});	

document.getElementById("notif").addEventListener("click", function() {
  if (document.getElementById("notif").value === "0"){
    document.getElementById("notif").src = "/assets/bell_1.png";
    document.getElementById("notif").title = "Show All Tasks";
    document.getElementById("notif").value = "1";
    document.getElementById("urgent_area").style.height = "85vh";
    document.getElementById("upcoming_area").style.opacity = "0";
  } else {
    document.getElementById("notif").src = "/assets/bell.png";
    document.getElementById("notif").title = "Show Urgent Tasks";
    document.getElementById("notif").value = "0";
    document.getElementById("urgent_area").style.height = "38vh";
    document.getElementById("upcoming_area").style.opacity = "1";
  }
}); 

window.onload = function() {
  if (document.getElementsByClassName("logtxt")[0] === undefined){
    document.getElementById("logs").style.opacity = "0";
    document.getElementById("logs").style.height = "5vh";
  } else {
    setTimeout(function(){ document.getElementById("logs").style.opacity = "0"; 
    setTimeout(function(){ document.getElementById("logs").style.height = "5vh"; }, 500);}, 3000);
  }

};