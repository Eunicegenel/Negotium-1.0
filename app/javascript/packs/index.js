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

function refresh() {
  if (document.getElementById("show").getAttribute("check") === "0") {
    document.getElementById("show").style.opacity = "0";
    if (document.getElementsByClassName("logtxt")[0] === undefined){
      document.getElementById("logs").style.opacity = "0";
      document.getElementById("logs").style.height = "5vh";
    } else {
      setTimeout(function(){ document.getElementById("logs").style.opacity = "0"; 
      setTimeout(function(){ document.getElementById("logs").style.height = "5vh"; }, 500);}, 3000); 
    }
  } else {
    setTimeout(function(){ document.getElementById("show").style.opacity = "1"; }, 50);
    if (document.getElementsByClassName("logtxt")[0] === undefined){
      document.getElementById("logs").style.opacity = "0";
      document.getElementById("logs").style.height = "5vh";
    } else {
      setTimeout(function(){ document.getElementById("logs").style.opacity = "0"; 
      setTimeout(function(){ document.getElementById("logs").style.height = "5vh"; }, 500);}, 3000);
    }
  }
}

function close_modal() {
  document.getElementById("modal_bg").style.opacity = "0";
  setTimeout(function(){ document.getElementById("modal_bg").style.display = "none"; }, 500);
}

document.getElementById("modal_bg").addEventListener("click", function() {
  close_modal();
});

window.onload = function() {
  refresh();
};

if (window.performance) {
  console.info("window.performance works fine on this browser");
}
console.info(performance.navigation.type);
if (performance.navigation.type == performance.navigation.TYPE_RELOAD) {
  console.info( "This page is reloaded" );
  refresh();
} else {
  location.reload(); 
  console.info( "This page is not reloaded");
}

