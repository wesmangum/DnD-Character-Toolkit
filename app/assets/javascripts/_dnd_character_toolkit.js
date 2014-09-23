(function  () {

  $(".edit_character select").on("change", updateSkills);

  function updateSkills () {
    var values = $(".edit_character option:selected").map(function  () {
      if (this.value != "") {
        return parseInt(this.value);
      };
    });

    var total = 0;
    for (var i = 0; i < values.length; i++) {
      total += values[i]
    };

    var points = $(".total-points").text().split(": ");
    points = parseInt(points[1]);

    $(".points-left").empty().append("Points Left: " + (points - total).toString());

    if (points < total) {
      $(".points-left").css({"color": "red"});
    } else {
      $(".points-left").css({"color": "black"});
    };
  };
})();
