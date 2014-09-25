(function  () {

  $(".classes select").on("change", updateClasses);
  $(".races select").on("change", updateRaces);
  $(".skills select").on("change", updateSkills);

  function updateClasses () {
    var class_id = $(".classes option:selected").val();
    var character_id = $(".character_id input").val();

    if (class_id) {
      $.ajax({
        url: "/characters/"+character_id+"/classes/"+class_id,
        type: 'get',
        dataType: 'html',
        success:(function(html) {
                  $(".description").fadeOut(400, function() {
                    $(".description").empty().append("<div class='divider'></div>").append(html).hide().fadeIn(400);
                  });
                })
      });
    };
  }

  function updateRaces () {
    var race_id = $(".races option:selected").val();
    var character_id = $(".character_id input").val();

    if (race_id) {
      $.ajax({
        url: "/characters/"+character_id+"/races/"+race_id,
        type: 'get',
        dataType: 'html',
        success:(function(html) {
                  $(".description").fadeOut(400, function() {
                    $(".description").empty().append("<div class='divider'></div>").append(html).hide().fadeIn(400);
                  });
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
