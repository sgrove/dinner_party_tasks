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

  $("ul li input[type='checkbox']").click(function() {
    var $checkbox = $(this);
    var checkbox_id = $(this).attr("id");
    var $li = $(this).parent("li");
    var task_id = checkbox_id.substring(checkbox_id.indexOf('_') + 1);


    $.ajax({
      type: "POST",
      url: "/tasks/finish",
      data: "id=" + task_id,
      async: true,
      error: function() {
        alert("FAIL");
      },
      success: function(response_data) {
        $li.addClass('finished');
        $checkbox.attr("disabled", true)
      }
    });
  })


  $("a.describe").click(function() {
    var $link = $(this);
    var li_id = $link.parent("li").attr("id");
    var task_id = li_id.substring(li_id.indexOf("_") + 1)

    window.open("tasks/" + task_id + "/description", "description", "width=350,height=250");

  });
});