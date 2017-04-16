$(document).ready(function() {
// Adding the form to the page
  $('a#addComment').on("click", function (e) {
    e.preventDefault();
    //$(this).hide(); // this would be used to hide the Add button, but it's outside the new.erb

    $.get('comments/new', function(form){
        $('.container').append(form);
      });

  });

});