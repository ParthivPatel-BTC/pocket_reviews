$(document).ready(function(){
  $('.removeUrl').bind('click', function () {
      removeUrl(this);
    });

    client_main_url = $('.control-group').html();
    current_time = new Date().getTime();
    $("#client_directory_url").attr("name", "client[client_urls_attributes]["+current_time+"][directory_url]");

    $('#user_first_name').keyup(function(){
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

   $('#client_company_logo').change(function() {
      readURL($(this)[0], '#preview_logo');
   });

  /*$("#load_review").click(function() {
    var id = $('#client_id').val();
    alert(id);
    $.ajax({
        url: "/clients/load_reviews",
        type:"POST",
        data:{client_id: id},
        success:function(data){
            $('#AdsDiv').html(data);
        }
      });
    });
  */

});

function removeUrl(dom) {
  $(dom).siblings('input:text').remove();  //Remove Text Field
  $(dom).siblings('input:checkbox').attr("checked", 'checked'); //Apply for checked
  $(dom).closest('img').remove(); //Remove x Image
}

function readURL(input, previewContainerSelector) {
  if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
          $(previewContainerSelector)
              .attr('src', e.target.result)
              .width(250)
              .height(150);
      };

      reader.readAsDataURL(input.files[0]);
  }
}
