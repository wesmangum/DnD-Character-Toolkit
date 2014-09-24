(function  () {

  $(".races select").on("change", updateRaces);
  $(".skills select").on("change", updateSkills);

  function updateRaces () {
    var race_id = $(".races option:selected").val();
    var character_id = $(".character_id input").val();

    $(".description").empty();

    if (race_id) {
      $.ajax({
        url: "/characters/"+character_id+"/races/"+race_id,
        type: 'get',
        dataType: 'html',
        success:(function(html) {
                  $(".description").append(html);
                })
      });
    };
  }

  function updateSkills () {
    var values = $(".skills option:selected").map(function  () {
      if (this.value != "") {
        return parseInt(this.value);
      };
    });

    var selected = 0;
    for (var i = 0; i < values.length; i++) {
      selected += values[i]
    };

    var points = $(".total-points").text().split(": ");
    points = parseInt(points[1]);

    $(".points-left").empty().append("Points Left: " + (points - selected).toString());

    if (points < selected) {
      $(".points-left").css({"color": "red"});
    } else {
      $(".points-left").css({"color": "black"});
    };
  };
})();
