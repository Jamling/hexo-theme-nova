(function($) {

  // highlight
  // hljs.initHighlightingOnLoad();

  if (typeof hljs_labels === 'undefined') {
    hljs_labels = {};
  }
  
  var code_caption_selector = '.code-caption';

  $(code_caption_selector).each(function(i, target) {
    var ds = $(this).data();
    if (ds.hide) {
      $(this).css('display', 'none');
    }
    
    var label = $(this).find(code_caption_selector + '-label');
    $(label).prepend(hljs_labels.left || ds.labels_left);
    $(label).append(hljs_labels.right || ds.labels_right);
    
    var copy = $(this).find(code_caption_selector + '-copy');
    var tip = hljs_labels.copy || $(copy).text();
    $(copy).html('<i class="icon nova-copy"></i>').attr("title", tip);
    
    // if (ds.label_position === 'outer')
    {
      $(this).next('p').remove();
    }
    $(copy).zclip({
      path : 'http://cdn.bootcss.com/zclip/1.1.2/ZeroClipboard.swf',
      copy : function() {
        var code = $(target).next('pre').children('code').get(0);
        return code.innerText;
      }
    });
  });

  $('.article pre code').each(function(i, block) {
    var caption = $(this).parent().prev(code_caption_selector);
    if (typeof caption === 'undefined') {
      return;
    }
    var ds = caption.data();
    if (typeof ds === 'undefined') {
      ds = {trim_indent: 'frontend', line_number : 'frontend'}
    }
    var texts = $(this).text().split('\n');
    if (ds.trim_indent === 'frontend') {
      console.log("trim indent in front-end");
      var tab = texts[0].match(/^\s{0,}/);
      if (tab) {
        var arr = [];
        texts.forEach(function(temp) {
          arr.push(temp.replace(tab, ''));
        });
        $(this).text(arr.join('\n'));
      }
    }

    if (ds.line_number === 'frontend') {
      console.log("show line number in front-end");
      var lines = texts.length - 1;
      var $numbering = $('<ul/>').addClass('pre-numbering');
      $(this).addClass('has-numbering').parent().append($numbering);
      for (i = 1; i <= lines; i++) {
        $numbering.append($('<li/>').text(i));
      }
    }

    hljs.highlightBlock(block);
  });

})(jQuery);