
$(document).ready(function() {
  $('.new-idea-form').hide();

  $('#new-idea').click(function() {
    $('.new-idea-form').toggle('slow');
  });
});
