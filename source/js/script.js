(function($) {
  
  // scroll-spy
  $('body').scrollspy({ target: '#navbar-toc' });
  $('#toc').css('min-width', $('#navbar-toc').css('width'));
  
  // Article
  $('.article').each(function(i) {
    // image
    $(this).find('img').each(function() {
      if ($(this).parent().hasClass('fancybox-button')) return;
      var alt = this.alt;
      if (alt) $(this).after('<span class="funcybox-caption">' + alt + '</span>');

      $(this).wrap('<a href="' + this.src + '" title="' + alt + '" class="fancybox-button"></a>');
    });

    $(this).find('.fancybox-button').each(function(j) {
      $(this).attr('rel', 'fancybox-button');
    });

    // table
    $(this).find('table').each(function() {
      if (!$(this).hasClass('table-bordered')) {
        $(this).addClass('table');
        $(this).addClass('table-bordered');
      }
    });
  });

  if ($.fancybox) {
    $('.fancybox-button').fancybox({
      helpers : {
        title : {
          type : 'over'
        },
        buttons : {},
        overlay : {
          css : {
            'background' : 'rgba(58, 42, 45, 0.5)'
          }
        }
      },
      afterShow : function() {
        /* Add watermark */
        $('<div class="watermark"></div>').bind("contextmenu", function(e) {
          return false; /* Disables right click */
        }).prependTo($.fancybox.inner);

        $(".fancybox-title").wrapInner('<div />').show();

        $(".fancybox-wrap").hover(function() {
          $(".fancybox-title").show();
        }, function() {
          $(".fancybox-title").hide();
        });
      }
    });
  }

  $.fn.chk_userlanguage = function() {
    /* check if <style=display:none;> not set to that element */
    // if (!this.is(":hidden")) { this.hide(); };
    /* get browser default lang */
    if (navigator.userLanguage) {
      baseLang = navigator.userLanguage.substring(0, 2).toLowerCase();
    }
    else {
      baseLang = navigator.language.substring(0, 2).toLowerCase();
    }
    console.log(baseLang);//zh
  };
})(jQuery);