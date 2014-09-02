$(document).on("ready page:change", function() {
  var $container = $('#books-container');

  $container.imagesLoaded(function(){
    initMasonry();
    triggerScrollIfNoScrollbar();
  });

  $container.infinitescroll({
      loading: {
        // finishedMsg: "<em>Congratulations, you've reached the end of the internet.</em>",
        msgText: "Loading more books...",
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
        resetMasonry($newElems);
        triggerScrollIfNoScrollbar();
      });
    }
  );

  function initMasonry() {
    $container.masonry({
      itemSelector: '.book',
    });
  }

  function resetMasonry(newElems) {
    $container.masonry('appended', newElems, true);
  }

  function isScrollbar() {
    return $("body").height() > $(window).height();
  }

  function triggerScrollIfNoScrollbar() {
    if (!isScrollbar()) {
      $container.infinitescroll('scroll');
    }
  }
});


