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
    $("li.inactive").droppable();
});