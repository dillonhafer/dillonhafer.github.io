(function() {
  var menuButton = document.querySelector('.navbar-toggle');
  menuButton.addEventListener('click', function() {
    var nav = document.querySelector('.navbar-collapse');
    if (nav.getAttribute('class') === 'navbar-collapse collapse') {
      nav.setAttribute('class', 'navbar-collapse');
    } else {
      nav.setAttribute('class', 'navbar-collapse collapse');
    }
  });
})()