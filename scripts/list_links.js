'use strict';

hexo.extend.helper.register('nova_list_links', listLinksHelper);

function listLinksHelper(links, options) {
  if (!options && (!links || !links.hasOwnProperty('length'))) {
    options = links;
    links = this.theme.post_widgets_links;
  }

  options = options || {};

  var style = options.hasOwnProperty('style') ? options.style : 'list';
  var className = options.class || 'list-group';
  var self = this;
  var result = '';

  var tag = 'a';

  if (style === 'list') {
    tag = 'li';
  }
  else if (style === 'a') {

  }
  links.forEach(function(link) {
    var title = link.title || link.name || '';
    var c = className;
    var hasIcon = !!link.icon;
    if (hasIcon) {
      c += ' has-icon';
    }

    result += '<' + tag + ' class="' + c + '" href="' + link.url + '" title="' + title + '" target="_blank">';
    if (hasIcon) {
      var icon = link.icon;
      if (icon.indexOf('http://') == 0 || icon.indexOf('https://') == 0) {
      }
      else {
        icon = self.url_for(link.icon);
      }
      result += '<img src="' + icon + '" alt="' + title + '">';
    }
    if (link.name) {
      result += link.name;
    }
    result += '</' + tag + '>';
  });

  return result;
}