$(document).ready(function() {

  // Select all elements with red leaves
  // queries = document.querySelectorAll('[data-id="red"]');

  $('.commentBox').addClass('hidden'); // hides all the comment boxes

  $('button.addComment').on("click", function (e) {
    e.preventDefault();
    $(this).addClass('hidden'); // hides the add comment button
    $(this).children().addClass('show-form'); // brings add comment form up


  });

});