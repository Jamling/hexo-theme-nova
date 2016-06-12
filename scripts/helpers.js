'use strict';

var pathFn = require('path');
var _ = require('lodash');
var url = require('url');

hexo.extend.helper.register('i18n', function(key){
    return this.__(key);
});

hexo.extend.helper.register('head_title', function(){
  var p = this.page;
  var ret = '';
  var sub = '';
  if (p.title2) {
    sub = this.i18n(p.title2);
  }
  else if (p.title){
    sub = p.title;
  }
  ret = this.i18n('site.title');
  if (!ret){
    ret = this.config.title
  }
  if (p.layout == 'project') {
    if (!(p.gh && p.gh.type == "get_repos")){
      var paths = this.page.path.split('/');
      // get repo
      if (p.gh){
        ret = this.gh_opts().repo;
      } else {
        if (paths.length >= 2){
          ret = paths[paths.length - 2];
        }
      }
      // get path, has bugs
      var f = paths[paths.length - 1];
      var tmp = this.i18n('project.' + f);
      if (tmp !== 'project.' + f) {
        sub = tmp;
      }
    }
  }
  if (sub){
    return sub + '|' + ret;
  } else {
    return ret;
  }
});

// load <head> js and css
hexo.extend.helper.register('head_jscss', function(){
  var jc = this.theme.js_css;
  var _self = this;
  var ret = '';
  _.each(jc, function(item){
    if (_.endsWith(item.url, 'js')){
      ret += _self.js(item.url);
    } else if (_.endsWith(item.url, 'css')){
      ret += _self.css(item.url);
    } else {
      // do nothing
    }
  });
  return ret;
});

// load <head> keywords
hexo.extend.helper.register('head_keywords', function(){
  var _self = this;
  var ret = '';
  // for post
  // if (this.is_post())
  
    var kw = [];
    var cats = this.page.categories;
    if (cats) {
      cats.forEach(function(item){
        kw.push(item.name);
      });
    }
    var tags = this.page.tags;
    if (tags) {
      tags.forEach(function(item){
        kw.push(item.name);
      });
    }
    
    if (this.page.title2){
      kw.push(this.i18n(this.page.title2))
    }
    if (this.page.title){
      kw.push(this.page.title);
    }
    
    return kw.join(',');
  
  // for page
  // TODO
});

// load <head> description
hexo.extend.helper.register('head_description', function(){
  var ret = '';
  var kw = [];
  kw.push(this.i18n('site.description'));
  kw.push(this.config.description);
  return ret;
});


// header nav menu
hexo.extend.helper.register('header_menu', function(className){
  var menu = this.theme.menu;
  var result = '';
  var _self = this;

  _.each(menu, function(m){
    result += '<li><a href="' + _self.url_for_lang(m.url) + '" class="' + className + '">' + _self.__('menu.' + m.name) + '</a></li>';
  });
  
  return result;
});

// return page title.
hexo.extend.helper.register('page_title', function(){
  var p = this.page;
  var ret = '';
  if (p.title2) {
    ret = this.i18n(p.title2);
  }
  else if (p.title){
    ret = p.title;
  }
  return ret;
});

// insert page path nav bar.
hexo.extend.helper.register('page_path', function(post){
  var _self = this;
  var ret = '';
  if (this.is_post()) {
    // ret += '<span class="glyphicon glyphicon-folder-close" aria-hidden="true"></span>&nbsp;';
    ret += _self.__('page.path') + '';
    ret += '<ol class="breadcrumb path">';
    ret += '<li><a class="" href="' + _self.url_for_lang('/') + '">' + this.__('page.blog') + '</a></li>';
    var cats = post.categories;
    if (cats == null || cats.length == 0) {
      ret += '</ol>';
      return ret;
    }
    
    cats.forEach(function(item){
      ret += '<li><a class="" href="' + _self.url_for_lang(item.path) + '">' + item.name + '</a></li>';
    });
    ret += '</ol>';
  }
  /*
  else if(post.layout == 'project') {
    var m = this.theme.menu[1];
    ret += _self.__('page.path') + '';
    ret += '<ol class="breadcrumb path">';
    ret += '<li><a class="" href="' + _self.url_for_lang(m.url) + '">' + this.__('menu.' + m.name) + '</a></li>';
    var paths = this.page.path.split('/');
    // get repo
    var repo;
    if (this.page.gh){
      repo = this.gh_opts().repo;
    } else {
      if (paths.length >= 2){
        repo = paths[paths.length - 2];
      }
    }
    ret += '<li><a class="" href="' + _self.url_for_lang(m.url+'/' + repo) + '">' + repo + '</a></li>';
    // get path
    var f = paths[paths.length - 1];
    var tmp = this.__('project.' + f);
    if (tmp == 'project.' + f) {
      tmp = this.page.title2 ? this.__(this.page.title2) : this.page.title;
    }
    ret += '<li>' + tmp + '</li>';
    ret += '</ol>';
  }*/
  
  return ret;
});

// insert category of post
hexo.extend.helper.register('post_cates', function(post){
  var cats = post.categories;
  var _self = this;
  var ret = '';
  if (cats == null || cats.length == 0) {
      return ret;
  }
  ret += '<span class="glyphicon glyphicon-folder-close" aria-hidden="true"></span>&nbsp;' + _self.__('category.label') + '';
  ret += '<ol class="breadcrumb category">';
  cats.forEach(function(item){
    ret += '<li><a class="" href="' + _self.url_for_lang(item.path) + '">' + item.name + '</a></li>';
  });
  ret += '</ol>';
  return ret;
});

// insert tag of post
hexo.extend.helper.register('post_tags', function(post){
  var cats = post.tags;
  var _self = this;
  var ret = '';
  if (cats == null || cats.length == 0) {
      return ret;
  }
  ret += '<span class="glyphicon glyphicon-tags" aria-hidden="true"></span>&nbsp;' + _self.__('tag.label');
  ret += '<ol class="breadcrumb tag">';
  cats.forEach(function(item){
    ret += '<li><a class="" href="' + _self.url_for_lang(item.path) + '">#' + item.name + '</a></li>';
  });
  ret += '</ol>';
  return ret;
});

// widget category
hexo.extend.helper.register('widget_cates', function(options){
  var o = options || {}
  var show_count = o.hasOwnProperty('show_count') ? o.show_count : true;
  var cats = this.site.categories;
  var _self = this;
  var ret = '';
  if (cats == null || cats.length == 0) {
      return _self.__('category.empty');
  }
  ret += '<ul class="list-group">';
  cats.forEach(function(item){ //console.log(item)
    ret += '<li class="list-group-item"><a href="' + _self.url_for_lang(item.path) + '">' + item.name + '</a>';
    if (show_count){
      ret += '<span class="badge">' + item.posts.length + '</span>';
    }
    ret += '</li>';
  });
  ret += '</ul>';
  return ret;
});

// widget tags
hexo.extend.helper.register('widget_tags', function(){
  var cats = this.site.tags;
  var _self = this;
  var ret = '';
  if (cats == null || cats.length == 0) {
      return _self.__('tag.empty');
  }
  ret += '<ul class="list-group">';
  cats.forEach(function(item){
    ret += '<li class="list-group-item"><a href="' + _self.url_for_lang(item.path) + '">' + item.name + '</a></li>';
  });
  ret += '</ul>';
  return ret;
});
// widget tags data
hexo.extend.helper.register('widget_tags_data', function(){
  var cats = this.site.tags || [];
  var tags = [];
  var _self = this;
  cats.schema.virtual('path').get(function() {
    var tagDir = _self.config.tag_dir;
    if (tagDir[tagDir.length - 1] !== '/') tagDir += '/';

    return _self.url_for_lang(tagDir + this.slug + '/');
  });
  return cats;
});

// widget recent_post
hexo.extend.helper.register('widget_recents', function(posts, options){
  return this.nova_list_posts(posts, options);
});

// page unique id, used for comments
hexo.extend.helper.register('page_uid', function(options){
  if (this.is_post()) {
    return this.page.path;
  }
  var paths = this.page.path.split('/');
  var lang = paths[0];
  if (this.config.language.indexOf(lang) >= 0) {
    paths.shift();
    var ret = paths.join('/');
    if (_.endsWith(this.page.path, '/')) {
      ret += '/';
    }
    return ret;
  }
  return this.page.path;
});

// return page show toc or not
hexo.extend.helper.register('page_toc', function(options){
  var p = this.page;
  if (p.layout == 'post'){// p.toc default off;
    return this.is_post() && this.theme.toc.post && p.toc;
  }
  else if (p.layout == 'page'){
    if (!this.theme.toc.page){
      return false; 
    }
    if (typeof(p.toc) == 'undefined'){
      return true;
    }
    return p.toc;
  }
  else if (p.layout == 'project'){
    if (!this.theme.toc.project){
      return false;
    }
    if (typeof(p.toc) == 'undefined'){
      return true;
    }
    return p.toc;
  }
});

/* use hexo-generator-i18n url_for_lang
hexo.extend.helper.register('url_for_lang', function(path, language){
  var lang = language ? language : this.page.lang;
  var url = this.url_for(path);

  if (lang !== this.default_lang() && url[0] === '/') url = '/' + lang + url;

  return url;
});
*/

hexo.extend.helper.register('canonical_url', function(lang){
  var path = this.page.canonical_path;
  if (lang && lang !== this.default_lang()) path = lang + '/' + path;

  return this.config.url + '/' + path;
});

hexo.extend.helper.register('lang_name', function(lang){
  var data = this.site.data.languages[lang];
  return data.name || data;
});
