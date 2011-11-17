// This script file adds placeholder compatibility for browsers that don't support it

// Function to test for HTML5 placeholder support
// Thanks to http://stackoverflow.com/questions/3937818/jquery-how-to-test-is-the-browser-supports-the-native-placeholder-attribute and http://diveinto.html5doctor.com/detect.html#input-placeholder
jQuery.support.placeholder = (function(){
    var input_text = document.createElement('input');
    return 'placeholder' in input_text;
})();

// This function adds placeholder text to browsers that don't support the HTML5 attribute
// Thanks to http://webdesignerwall.com/tutorials/cross-browser-html5-placeholder-text
$(document).ready(function(){

  if(!jQuery.support.placeholder){

    // Remove placeholder text when textbox comes into focus
    $('[placeholder]').focus(function(){
      var input = $(this);
      if(input.val() == input.attr('placeholder')){
        input.val('');
        input.removeClass('placeholder');
      }

    // Add placeholder text when textbox blurs if it doesn't have a value
    }).blur(function(){
      var input = $(this);
      if(input.val() == '' || input.val() == input.attr('placeholder')){
        input.addClass('placeholder');
        input.val(input.attr('placeholder'));
      }

    // Initialize the text box by blurring it
    }).blur();

    // Prepares input text for submission
    $('[placeholder]').parents('form').submit(function(){
      $(this).find('[placeholder]').each(function(){
        var input = $(this);
        if(input.val() == input.attr('placeholder')){
          input.val('');
        }
      });
    });
  } 
});
