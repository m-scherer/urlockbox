// $( document ).ready(function(){
//   $("body").on("click", ".edit-link", editLink)
// });
//
// function editLink(e) {
//   e.preventDefault();
//
//   var $link = $(this).parents('.link');
//   var linkId = $link.data('link-id');
//   var title = $link.children('li:nth-child(1)');
//   var url = $link.children('li:nth-child(2)');
//
//   $(this).html("Save")
//   title.attr('contenteditable', true)
//   url.attr('contenteditable', true)
//
//   $("body").on("click", ".edit-link", function() {
//     var params = {
//       title: $(this).parents('.link').children('li:nth-child(1)').html(),
//       url: $(this).parents('.link').children('li:nth-child(2)').html()
//     }
//     $.ajax({
//       type: "PATCH",
//       url: "/api/v1/links/" + linkId,
//       data: params,
//     }).then(closeEdit( title, url, $(this) ))
//       .fail(displayFailure);
//   });
// }
//
// function closeEdit(title, url, self) {
//   self.html("Save")
//   title.attr('contenteditable', false)
//   url.attr('contenteditable', false)
// }
//
// function displayFailure(failureData){
//   console.log("FAILED attempt to update Link: " + failureData.responseText);
// }
