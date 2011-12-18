$.fn.spin = function(path) {
  path = path || "spinner.gif";
  return this.each(function() {
      var element = $(this);
      element.after('<img src="/images/'+path+'" class="spinner"/>'); 
  });
};
$.fn.stopSpin = function() { 
  return this.each(function() {
    var element = $(this);
    element.next().remove();
  });
};


