$(function() {

$(".status").on("click", function() {
  var $btn = $(this).find('.btn');
  if ($btn.text() == "offline") {
    $btn.text("online");
    $btn.removeClass("btn-danger").addClass("btn-success");
    var state = {user: {status: "active"}}
  } else {
    $btn.text("offline");
    $btn.removeClass("btn-success").addClass("btn-danger");
    var state = {user: {status: "nil"}}
  }

  $.ajax({
    url: "/status",
    type: "PUT",
    data: state,
    success: function(res) {
      var returned = res.status
      $("#state").text(returned);
    },
    error: function() {
      console.log("error");
    }
  })


})

});