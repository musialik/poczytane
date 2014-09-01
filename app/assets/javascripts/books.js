$(document).on("ready page:change", function(){
  var $container = $('#books-container');
  $container.imagesLoaded(function(){
    $container.masonry({
      itemSelector: '.book',
      //columnWidth: $container.find('.grid-sizer').get(0),
    });
  });
});
