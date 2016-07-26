'use strict';

hexo.extend.helper.register('nova_list_archives', listArchivesHelper);

hexo.extend.helper.register('nova_archives', function(options){
  options = options || {};

  var config = this.config;
  var archiveDir = config.archive_dir;
  var timezone = config.timezone;
  var lang = this.page.lang || this.page.language || config.language;
  var format = options.format;
  var type = options.type || 'monthly';
  var style = options.hasOwnProperty('style') ? options.style : 'list';
  var showCount = options.hasOwnProperty('show_count') ? options.show_count : true;
  var transform = options.transform;
  var separator = options.hasOwnProperty('separator') ? options.separator : ', ';
  var className = options.class || 'archive';
  var order = options.order || -1;
  var result = '';
  var self = this;

  if (!format){
    format = type === 'monthly' ? 'MMMM YYYY' : 'YYYY';
  }

  var posts = [];
  if (this.page.base === (archiveDir + '/')) 
    posts = this.page.posts.sort('date', order);
  else
    posts = this.page.posts.sort('date', order);
  if (!posts.length) return result;

  var data = [];
  var length = 0;
  
  posts.forEach(function(post){
    // Clone the date object to avoid pollution
    var date = post.date.clone();

    if (timezone) date = date.tz(timezone);
    if (lang) date = date.locale(lang);

    var year = date.year();
    var month = date.month() + 1;
    var name = date.format(format);
    var lastData = data[length - 1];

    if (!lastData || lastData.name !== name){
      length = data.push({
        name: name,
        year: year,
        month: month,
        posts: [post],
        count: 1
      });
    } else {
      lastData.count++;
      lastData.posts.push(post);
    }
  });
  
  function link(item){
    var url = archiveDir + '/' + item.year + '/';

    if (type === 'monthly'){
      if (item.month < 10) url += '0';
      url += item.month + '/';
    }

    return self.url_for_lang(url);
  }

  var item, i, len;
  var plimit = options.hasOwnProperty('post_limit') ? options.post_limit : 10;
    result += '<section class="' + className + '-wrap">';
    for (i = 0, len = data.length; i < len; i++){
      item = data[i];

      result += '<div class="' + className + '-heading">';

      result += '<h1><a class="' + className + '-heading-link" href="' + link(item) + '">';
      result += transform ? transform(item.name) : item.name;
      result += '</a>';

      if (showCount){
        result += '<span class="badge">' + item.count + '</span>';
      }
      
      result += '</h1><hr></div>';
      
      result += '<div class="' + className + '-body">';
      var posts = item.posts;
      var j = 0;
      for (j = 0; j < plimit && j < posts.length; j++){
        result += '<article class="' + className + '-article archive-type-' + posts[j].layout + '">';
        result += '<header class="' + className + '-article-header">';
        result += '<h3><a href="' + self.url_for_lang(posts[j].path) + '">' + posts[j].title + ' <small>' + posts[j].date.format('YYYY-MM-DD') + '</small></a></h3>';
        result += '</header>';
        result += '</article>';
      }
      result += '</div>';
    }
    result += '</section>';
  return result;
});

// rewrite list_archives();
// mod from .\node_modules\hexo\lib\plugins\helper\list_archives.js
function listArchivesHelper(options){
  /* jshint validthis: true */
  options = options || {};

  var config = this.config;
  var archiveDir = config.archive_dir;
  var timezone = config.timezone;
  var lang = this.page.lang || this.page.language || config.language;
  var format = options.format;
  var type = options.type || 'monthly';
  var style = options.hasOwnProperty('style') ? options.style : 'list';
  var showCount = options.hasOwnProperty('show_count') ? options.show_count : true;
  var transform = options.transform;
  var separator = options.hasOwnProperty('separator') ? options.separator : ', ';
  var className = options.class || 'archive';
  var order = options.order || -1;
  var result = '';
  var self = this;

  if (!format){
    format = type === 'monthly' ? 'MMMM YYYY' : 'YYYY';
  }

  var posts = this.site.posts.sort('date', order);
  if (!posts.length) return result;

  var data = [];
  var length = 0;

  posts.forEach(function(post){
    // Clone the date object to avoid pollution
    var date = post.date.clone();

    if (timezone) date = date.tz(timezone);
    if (lang) date = date.locale(lang);

    var year = date.year();
    var month = date.month() + 1;
    var name = date.format(format);
    var lastData = data[length - 1];

    if (!lastData || lastData.name !== name){
      length = data.push({
        name: name,
        year: year,
        month: month,
        posts: [post],
        count: 1
      });
    } else {
      lastData.count++;
      lastData.posts.push(post);
    }
  });
  function link(item){
    var url = archiveDir + '/' + item.year + '/';

    if (type === 'monthly'){
      if (item.month < 10) url += '0';
      url += item.month + '/';
    }

    return self.url_for_lang(url);
  }

  var item, i, len;

  if (style === 'list'){
    result += '<div class="' + className + '">';

    for (i = 0, len = data.length; i < len; i++){
      item = data[i];

      result += '<a class="' + className + '-item" href="' + link(item) + '">';
      result += transform ? transform(item.name) : item.name;
      

      if (showCount){
        result += '<span class="badge">' + item.count + '</span>';
      }

      result += '</a>';
    }

    result += '</div>';
  }
  else if (style === 'group') {
    
    var plimit = options.hasOwnProperty('post_limit') ? options.post_limit : 10;
    result += '<div class="panel">';
    for (i = 0, len = data.length; i < len; i++){
      item = data[i];

      result += '<div class="panel-heading ' + className + '">';

      result += '<h3 class="panel-title"><a class="' + className + '-link" href="' + link(item) + '">';
      result += transform ? transform(item.name) : item.name;
      result += '</a><span class="caret"></span></h3>';

      if (showCount){
        result += '<span class="badge">' + item.count + '</span>';
      }
      
      result += '<div class="panel-body">';
      var posts = item.posts;
      var j = 0;
      for (j = 0; j < plimit && j < posts.length; j++){
        result += '<p><a href="' + self.url_for_lang(posts[j].path) + '">' + posts[j].title + '</a></p>';
      }
      result += '</div>';

      result += '</div>';
    }
    result += '</div>';
  }
  else {
    for (i = 0, len = data.length; i < len; i++){
      item = data[i];

      if (i) result += separator;

      result += '<a class="' + className + '-item" href="' + link(item) + '">';
      result += transform ? transform(item.name) : item.name;

      if (showCount){
        result += '<span class="badge">' + item.count + '</span>';
      }

      result += '</a>';
    }
  }

  return result;
}
