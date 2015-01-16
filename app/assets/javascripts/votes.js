$(document).ready(function() {
  // Select all elements with red leaves
  // queries = document.querySelectorAll('[data-id="red"]');

  // Clicking Up Arrow

  $('.vote-arrow-up').on("click", function (e) {
    e.preventDefault();
    $(this).addClass('clicked'); // hides the add comment button
    //$(this).children().addClass('show-form'); // brings add comment form up
  });

  $('.vote-arrow-down').on("click", function (e) {
    e.preventDefault();
    $(this).addClass('clicked'); // hides the add comment button
    //$(this).children().addClass('show-form'); // brings add comment form up
  });



  // // HANDLING RESPONSES

  // $('.commentBox').addClass('hidden'); // hides all the comment boxes on page load

  // $('button.addComment').on("click", function (e) {
  //   //e.preventDefault();
  //   $(this).addClass('hidden'); // hides the add comment button
  //   $(this).children().addClass('show-form'); // brings add comment form up
  // });

  // // HANDLING VOTING

  // $(function () {
  //   $('#leftmenu').hide();
  //   $('button[name="Menuhide"]').on('click', function () {
  //     $('#leftmenu').hide("slide", 1000, function () {
  //       $('#leftbutton').show("slide", 1000); }); });
  //   $('button[name="menushow"]').on('click', function () {
  //     $('#leftbutton').hide("slide", 1000, function () {
  //       $('#leftmenu').show("slide", 1000);
  //     });
  //   });
  // });

});