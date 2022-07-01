// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You"re encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it"ll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

require("jquery")

Rails.start()
Turbolinks.start()
ActiveStorage.start()

$(document).ready(function() {

  $("form .choose-seat").click(function() {
    $(".choose-seat").removeClass("active");
    $("#booking_seat_id").val($(this).data("id"));
    $(this).addClass("active");

    $(".show-seat").empty();
    $(".show-seat").append( $(this).val($(this).data("id")).text());
    
  });
});

$(document).ready(function() {
  $('.slider').carousel({
    interval: 10000
  });
});