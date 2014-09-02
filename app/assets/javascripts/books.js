$(document).on("ready page:change", function() {
  var $container = $('#books-container');

  $container.imagesLoaded(function(){
    $container.masonry({
      itemSelector: '.book',
    });
    triggerScrollIfNoScrollbar($container);
  });

  $container.infinitescroll({
      loading: {
        // finishedMsg: "<em>Congratulations, you've reached the end of the internet.</em>",
        // msgText: "<em>Loading the next set of posts...</em>",
        speed: 'fast'
      },
      navSelector  : ".pagination",
      nextSelector : ".pagination .next a:first",
      itemSelector : "#books-container .book",
      bufferPx: 200,
      extraScrollPx: 10,
    }, 
    function(newElements) {
      var $newElems = $(newElements).css({ opacity: 0 });
      $newElems.imagesLoaded(function(){
        $newElems.animate({ opacity: 1 });
        $container.masonry('appended', $newElems, true);
        triggerScrollIfNoScrollbar($container);
      });
    }
  );

  function isScrollbar() {
    return $("body").height() > $(window).height();
  }

  function triggerScrollIfNoScrollbar(container) {
    if (!isScrollbar()) {
      container.infinitescroll('scroll');
    }
  }
});


