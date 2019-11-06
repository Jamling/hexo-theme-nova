(function ($) {
  // mobile 
  $('.navbar-toggle').sidr({
    name: 'sidr-main',
    source: '#bs-example-navbar-collapse-1'
  });
  $('body').click(function () {
    $.sidr('close', 'sidr-main');
  });

  $(".navbar-fixed-top").autoHidingNavbar({
    // see next for specifications
  });
  // scroll-spy
  if ($('#navbar-toc').get(0)) {
    $('body').scrollspy({ target: '#navbar-toc' });
    $('#toc').css('min-width', $('#navbar-toc').css('width'));
  }

  // index card thumbnails 
  $('.index-card .card-content .excerpt-box .excerpt').each(function (i) {
    var content = $(this).parent();
    // image
    $(this).find('img').each(function () {
      if (!$(this).prev().hasClass('.excerpt-img')) {
        $(this).addClass('excerpt-img');
        content.prepend($(this).remove());
      } else {
        $(this).remove();
      }
    });
  });

  // Article
  $('.article').each(function (i) {
    // image
    $(this).find('img').each(function () {
      if ($(this).parent().hasClass('fancybox-button')) return;
      if ($(this).parent().get(0).nodeName.toLowerCase() === 'a') {
        var href = $(this).attr('src');
        if (href && (href.indexOf('https://img.shields.io/') === 0 || href.indexOf('https://travis-ci.org') === 0)) {
          var br = $(this).parent().next();
          if ($(br).is('br')) {
            $(br).remove();
          }
        }
        return;
      }
      var alt = this.alt;
      if (alt) $(this).after('<span class="funcybox-caption">' + alt + '</span>');

      $(this).wrap('<a href="' + this.src + '" title="' + alt + '" class="fancybox-button"></a>');

    });

    $(this).find('.fancybox-button').each(function (j) {
      $(this).attr('rel', 'fancybox-button');
    });

    // table
    $(this).find('table').each(function () {
      if (!$(this).hasClass('table-bordered')) {
        $(this).addClass('table');
        $(this).addClass('table-bordered');
      }
    });
  });

  if ($.fancybox) {
    $('.fancybox-button').fancybox({
      helpers: {
        title: {
          type: 'over'
        },
        buttons: {},
        overlay: {
          css: {
            'background': 'rgba(58, 42, 45, 0.5)'
          }
        }
      },
      afterShow: function () {
        /* Add watermark */
        $('<div class="watermark"></div>').bind("contextmenu", function (e) {
          return false; /* Disables right click */
        }).prependTo($.fancybox.inner);

        $(".fancybox-title").wrapInner('<div />').show();

        $(".fancybox-wrap").hover(function () {
          $(".fancybox-title").show();
        }, function () {
          $(".fancybox-title").hide();
        });
      }
    });
  }

  $.fn.chk_userlanguage = function () {
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
