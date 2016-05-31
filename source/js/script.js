(function($){
  // Caption
  $('.article').each(function(i){
    $(this).find('img').each(function(){
      /*if (!$(this).hasClass('img-responsive')) {
      $(this).addClass('img-responsive')
      }*/
      if ($(this).parent().hasClass('fancybox')) return;

      var alt = this.alt;

      if (alt) $(this).after('<span class="funcybox-caption">' + alt + '</span>');

      $(this).wrap('<a href="' + this.src + '" title="' + alt + '" class="fancybox"></a>');
    });

    $(this).find('.fancybox').each(function(){
      $(this).attr('rel', 'article' + i);
    });
    
    $(this).find('table').each(function(){
      if (!$(this).hasClass('table-bordered')) {
        $(this).addClass('table');
        $(this).addClass('table-bordered');
      }
    });
  });

  if ($.fancybox){
    $('.fancybox').fancybox();
  }

  // highlight
  hljs.initHighlightingOnLoad();
  //hljs.configure
  
  
  $('pre code').each(function(i, block) {
    //hljs.highlightBlock(block);
	var lines = $(this).text().split('\n').length - 1;
    var $numbering = $('<ul/>').addClass('pre-numbering');
    $(this)
      .addClass('has-numbering')
      .parent()
      .append($numbering);
    for(i=1;i<=lines;i++){
      $numbering.append($('<li/>').text(i));
    }
  });
  
  //$('article-container').style.height = $('article-container').height();
  
  $.fn.chk_userlanguage = function() {
    /* check if <style=display:none;> not set to that element */
    // if (!this.is(":hidden")) { this.hide(); };
 
    /* get browser default lang */
    if (navigator.userLanguage) {
        baseLang = navigator.userLanguage.substring(0,2).toLowerCase();
    } else {
        baseLang = navigator.language.substring(0,2).toLowerCase();
    }
     
    /* language match */
    switch(baseLang)
    {
        case "de":
            /* german */
            this.slideDown("slow");
            break;
        case "en":
            /* english */
            break;
        case "ja":
            /* japanese */
            break;
        case "zh":
            /* 中文 */
            break;
        default:
            /* default no match */
    }
  
};  
})(jQuery);