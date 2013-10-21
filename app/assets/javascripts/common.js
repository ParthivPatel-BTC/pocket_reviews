$(document).ready(function(){
  $('.removeUrl').bind('click', function () {
      removeUrl(this);
    });

    $("#addNew").click(function() {
      hiddenUrlContainer = $("#hidden").html();
      hiddenUrlContainer = hiddenUrlContainer.replace('replace_me', new Date().getTime()); //Replace name with current timestamp
      hiddenUrlContainer = hiddenUrlContainer.replace('deleteUrl', new Date().getTime());  //Replace name with current timestamp
      var urlContainer = $("#urlContainer").append(hiddenUrlContainer);
      urlContainer.find('.removeUrl').bind('click', function(){
        removeUrl(this);
      });
    });
});

function removeUrl(dom) {
  $(dom).siblings('input:text').remove();  //Remove Text Field
  $(dom).siblings('input:checkbox').attr("checked", 'checked'); //Apply for checked
  $(dom).closest('img').remove(); //Remove x Image
}