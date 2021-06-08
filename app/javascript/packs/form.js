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