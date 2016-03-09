(function() {
  var toggle = function(el, className) {
    if (el.classList) {
      el.classList.toggle(className);
    } else {
      var classes = el.className.split(' ');
      var existingIndex = classes.indexOf(className);

      if (existingIndex >= 0)
        classes.splice(existingIndex, 1);
      else
        classes.push(className);

      el.className = classes.join(' ');
    }
  }

  var boxes = document.querySelectorAll('.project-box');
  for (i = 0; i < boxes.length; i++) {
    var box = boxes[i];
    box.addEventListener('click', function() { toggle(box, 'toggled'); });
  }
})()