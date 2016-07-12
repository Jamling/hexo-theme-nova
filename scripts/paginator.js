'use strict';

function paginatorHelper(options){
  options = options || {};

  var current = options.current || this.page.current || 0;
  var total = options.total || this.page.total || 1;
  var endSize = options.hasOwnProperty('end_size') ? +options.end_size : 1;
  var midSize = options.hasOwnProperty('mid_size') ? +options.mid_size : 2;
  var space = options.hasOwnProperty('space') ? options.space : '&hellip;';
  var base = options.base || this.page.base || '';
  var format = options.format || this.config.pagination_dir + '/%d/';
  var prevText = options.prev_text || 'Prev';
  var nextText = options.next_text || 'Next';
  var prevNext = options.hasOwnProperty('prev_next') ? options.prev_next : true;
  var transform = options.transform;
  var self = this;
  var result = '';
  var i;
  
  var ps = this.config.per_page > 0 ? this.config.per_page : 1;
  var style = options.hasOwnProperty('style') ? options.style : 0;
  var className = options.hasOwnProperty('class') ? options.class : 'pagination';

  if (!current) return '';
  if (!(this.page.next || this.page.prev)) {
    return result;
  }
  result += "<ul class=" + className + ">";
  
  if (prevNext && current > 1){
    result += '<li><a href="' + link(current-1) + '" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>';
  } else {
    result += '<li class="disabled"><a href="#'+ '" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>';
  }
  
  

  var currentPage = '<li class="active"><span class="sronly">' +
    (transform ? transform(current) : current) +
    '</span>';

  function link(i){
    return self.url_for_lang(i === 1 ? base : base + format.replace('%d', i));
  }

  function pageLink(i){
    
    return '<li><a href="' + link(i) + '">' +
      (transform ? transform(i) : i) +
      '</a></li>';
  }

  // Display the link to the previous page
  if (prevNext && current > 1){
    //result += '<a class="extend prev" rel="prev" href="' + link(current - 1) + '">' + prevText + '</a>';
  }

  if (options.show_all){
    // Display pages on the left side of the current page
    for (i = 1; i < current; i++){
      result += pageLink(i);
    }

    // Display the current page
    result += currentPage;

    // Display pages on the right side of the current page
    for (i = current + 1; i <= total; i++){
      result += pageLink(i);
    }
  }
  else {
    // It's too complicated. May need refactor.
    var leftEnd = current <= endSize ? current - 1 : endSize;
    var rightEnd = total - current <= endSize ? current + 1 : total - endSize + 1;
    var leftMid = current - midSize <= endSize ? current - midSize + endSize : current - midSize;
    var rightMid = current + midSize + endSize > total ? current + midSize - endSize : current + midSize;
    var spaceHtml = '<li><span class="space">' + space + '</span></li>';

    // Display pages on the left edge
    for (i = 1; i <= leftEnd; i++){
      result += pageLink(i);
    }

    // Display spaces between edges and middle pages
    if (space && current - endSize - midSize > 1){
      result += spaceHtml;
    }

    // Display left middle pages
    if (leftMid > leftEnd){
      for (i = leftMid; i < current; i++){
        result += pageLink(i);
      }
    }

    // Display the current page
    result += currentPage;

    // Display right middle pages
    if (rightMid < rightEnd){
      for (i = current + 1; i <= rightMid; i++){
        result += pageLink(i);
      }
    }

    // Display spaces between edges and middle pages
    if (space && total - endSize - midSize > current){
      result += spaceHtml;
    }

    // Dispaly pages on the right edge
    for (i = rightEnd; i <= total; i++){
      result += pageLink(i);
    }
  }

  // Display the link to the next page
  if (prevNext && current < total){
    result += '<li><a href="' + link(current + 1) + '" aria-label="Next" rel="next">' + '&raquo;' + '</a></li>';
  } else {
    result += '<li class="disabled"><a href=#' + '" aria-label="Next" rel="next">' + '&raquo;' + '</a></li>';
  }
  result += "</ul>";

  return result;
}

hexo.extend.helper.register('nova_paginator', paginatorHelper);
// 
hexo.extend.helper.register('nova_paginator2', function(options){
  options = options || {};
  var showName = options.hasOwnProperty('show_name') ? options.show_name : false;
  var page = this.page;
  var ret = '';
  if (page.prev || page.next){
    ret += '<ul class="pager">';
    if (page.prev){
      var n = showName ? page.prev.title : this.__('page.prev');
      page.prev_link = page.prev.path ? page.prev.path : page.prev_link;
      ret += '<li class="previous"><a href="' + this.url_for_lang(page.prev_link) + '"><span aria-hidden="true">&larr;</span><span class="hidden-xs">' + n + '</span></a></li>';
    }
    if (page.next){
      var n = showName ? page.next.title : this.__('page.next');
      page.next_link = page.next.path ? page.next.path : page.next_link;
      ret += '<li class="next"><a href="' + this.url_for_lang(page.next_link) + '"><span aria-hidden="true">&rarr;</span><span class="hidden-xs">' + n + '</span></a></li>';
    }
    ret += '</ul>';
  }
  return ret;
});
