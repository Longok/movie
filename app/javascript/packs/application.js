// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You"re encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it"ll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

require("jquery")
// = require cloudinary
Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener("turbolinks:load", function() {
  $("form .choose-seat").click(function() {
    // $(".choose-seat").removeClass("active");
    $("#booking_seat_id").val($(this).data("id"));
    // $(this).addClass("active");
    $(this).toggleClass("active");

    $(".show-seat").empty();
    $(".show-seat").append( $(this).val($(this).data("id")).text());
    
  });
});

// Scroll screen
jQuery(window).on('scroll', function() {
  if(jQuery(window).scrollTop() > 50) {
      jQuery('.header-active').css('background-color', '#0a1e5e');
  } else {
     jQuery('.header-active').css('background-color', 'transparent');
  }
});

// Toggle navbar mobie
document.addEventListener("turbolinks:load", function() {
  const menuBtn = document.querySelector('#menu-btn');  
  menuBtn.addEventListener('click', function(){
    $(".navbar").toggleClass("active");
  });
});