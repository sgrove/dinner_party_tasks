$(function() {

  $("li").draggable({
    axis: 'y',
    revert: function(droppable) {
      if (!droppable && this.hasClass("inactive")) {
        $("#error").text("Oops -- you can't drop an inactive task onto another task.");
        $("#error").show();
        return true;
      }
      return false;
    }
  });
  $("li.inactive").droppable({
    drop: function(event, ui) {

      var draggable = ui.draggable.remove();
      if ($(this).children("ul").length == 0) {
        $(this).append("<ul></ul>");
      }
      $(this).children("ul").append(draggable);
      draggable.css("top", "");
    }
  });
});