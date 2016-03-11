(function() {
  var menuButton = document.querySelector('.navbar-toggle');
  menuButton.addEventListener('click', function() {
    var nav = document.querySelector('.navbar-collapse');
    var classes = 'navbar-collapse collapse';

    if (nav.getAttribute('class') === 'navbar-collapse collapse') {
      classes = 'navbar-collapse';
    }

    nav.setAttribute('class', classes);
  });
})()