'use strict';

var pathFn = require('path');
var _ = require('../../../node_modules/hexo/node_modules/lodash');
var url = require('url');
var util = require('util');
var crypto = require('crypto');

function md5(text) {
  return crypto.createHash('md5').update(text).digest('hex');
};

hexo.extend.helper.register('i18n', function(key) {
  var ret = this.__(key);
  if (ret === key && key.indexOf('.') > 0) {
    return '';
  }
  return ret;
});

hexo.extend.helper.register('site_name', function() {
  var ret = this.i18n('site.title');
  if (!ret) {
    ret = this.config.title
  }
  return ret;
});

hexo.extend.helper.register('site_description', function() {
  var ret = this.i18n('site.description');
  if (!ret) {
    ret = this.config.description
  }
  return ret;
});

hexo.extend.helper.register('head_title', function() {
  var p = this.page;
  var ret = '';
  var sub = this.page_title(p);

  ret = this.site_name();
  // home page
  if (this.is_home()) {
    return ret;
  }

  if (this.is_archive()) {
    return sub + '|' + ret;
  }

  if (p.layout == 'project') {
    if (!(p.gh && p.gh.type == "get_repos")) {
      var paths = this.page.path.split('/');
      // get repo
      if (p.gh) {
        ret = this.gh_opts().repo;
      }
      else {
        if (paths.length >= 2) {
          ret = paths[paths.length - 2];
        }
      }
      // get path, has bugs
      var f = paths[paths.length - 1];
      var tmp = this.i18n('project.' + f);
      if (tmp !== '') {
        sub = tmp;
      }
    }
    return sub + '|' + ret;
  }

  if (sub) {
    return sub;// + '|' + ret;
  }
  else {
    return ret;
  }
});

// load <head> js and css
hexo.extend.helper.register('head_jscss', function() {
  var jc = this.theme.js_css;
  var _self = this;
  var ret = '';
  _.each(jc, function(item) {
    if (_.endsWith(item.url, 'js')) {
      ret += _self.js(item.url);
    }
    else if (_.endsWith(item.url, 'css')) {
      ret += _self.css(item.url);
    }
    else {
      // do nothing
    }
    ret += '\n';
  });
  return ret;
});

// load <head> keywords
hexo.extend.helper.register('head_keywords', function() {
  var _self = this;
  var p = this.page;
  var ret = '';
  // for post
  // if (this.is_post())

  var kw = [];
  var cats = p.categories;
  var tags = p.tags;
  if (this.is_home()) {
    cats = this.site.categories;
    tags = this.site.tags;
  }

  if (cats) {
    cats.forEach(function(item) {
      kw.push(item.name);
    });
  }
  if (tags) {
    tags.forEach(function(item) {
      if (kw.indexOf(item.name) < 0) kw.push(item.name);
    });
  }

  if (p.title2) {
    kw.push(this.i18n(p.title2))
  }
  else if (p.title) {
    kw.push(p.title);
  }

  return kw.join(',');

  // for page
  // TODO
});

// load <head> description
hexo.extend.helper.register('head_description', function(page) {
  var p = page ? page : this.page;

  var ret = p.description
  if (!ret) ret = this.page_excerpt(p);
  if (!ret) ret = this.site_description();
  if (ret) {
    ret = this.strip_html(ret.replace(/"/g, '&quot;'));
  }
  return ret;
});

// header nav menu
hexo.extend.helper.register('header_menu', function(className) {
  var menu = this.theme.menu;
  var result = '';
  var _self = this;

  _.each(menu, function(m) {
    var name = _self.__('menu.' + m.name);
    if (name === '') {
      name = m.name;
    }
    result += '<li><a href="' + _self.url_for_lang(m.url) + '" class="' + className + '">' + name + '</a></li>';
  });

  return result;
});

// return page title.
hexo.extend.helper.register('page_title', function(page, escape) {
  var p = page;
  if (typeof page === 'boolean' || typeof page === 'undefined') {
    p = this.page;
    escape = page;
  }
  var ret = '';
  if (p.title2) {
    ret = this.i18n(p.title2);
  }
  if (!ret) {
    ret = p.title;
  }
  if (!ret) {
    if (this.is_category()) {
      ret = get_category_title(this, p);
    }
    else if (this.is_tag()) {
      ret = get_tag_title(this, p);
    }
    else if (this.is_archive()) {
      ret = get_archive_title(this, p);
    }
    else if (this.is_home()) {
      ret = this.__('menu.home');
    }
  }

  if (escape) {
    ret = ret.replace(/"/g, '&quot;').replace(/'/g, '&apos;');
  }

  return ret;
});

// insert page path nav bar.
hexo.extend.helper.register('page_path', function(post, options) {
  var o = options || {};
  var _class = o.hasOwnProperty('class') ? o.class : 'category-item';
  var icon = o.hasOwnProperty('icon') ? o.icon : 'glyphicon glyphicon-folder-close';
  var _self = this;
  var ret = '';
  if (this.is_post()) {
    ret += '<span class="' + icon + '" aria-hidden="true"></span>';
    ret += _self.__('page.path') + '';
    // ret += '<ol class="breadcrumb path">';
    ret += '<a class="' + _class + '" href="' + _self.url_for_lang('/') + '">' + this.__('page.blog') + '</a>';
    var cats = post.categories;
    if (cats == null || cats.length == 0) {
      // ret += '</ol>';
      return ret;
    }

    cats.forEach(function(item) {
      ret += '<a class="' + _class + '" href="' + _self.url_for_lang(item.path) + '">' + item.name + '</a>';
    });
    // ret += '</ol>';
  }
  /*
  else if (post.layout == 'project') {
    var m = this.theme.menu[1];
    ret += _self.__('page.path') + '';
    ret += '<ol class="breadcrumb path">';
    ret += '<li><a class="" href="' + _self.url_for_lang(m.url) + '">' + this.__('menu.' + m.name) + '</a></li>';
    var paths = this.page.path.split('/');
    // get repo
    var repo;
    if (this.page.gh) {
      repo = this.gh_opts().repo;
    }
    else {
      if (paths.length >= 2) {
        repo = paths[paths.length - 2];
      }
    }
    ret += '<li><a class="" href="' + _self.url_for_lang(m.url + '/' + repo) + '">' + repo + '</a></li>';
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

// get page excerpt
hexo.extend.helper.register('page_excerpt', function(post) {
  var p = post ? post : this.page;
  var excerpt = p.excerpt;
  if (!excerpt && p.content) {
    var pos = p.content.indexOf('</p>');
    if (pos > 0) {
      excerpt = p.content.substring(0, pos + 4);
    }
  }
  return excerpt;
});

// wether page is new
hexo.extend.helper.register('page_new', function(post) {
  if (_.isUndefined(this.theme.page_new) && this.theme.page_new === true) {
    var p = post ? post : this.page;
    var m = p.updated;
    var d = p.date;
    var c = new Date();
    var diff = Math.floor(m.valueOf() - d.valueOf()) / (24 * 3600 * 1000);
    var diff2 = Math.floor(c.getTime() - m.valueOf()) / (24 * 3600 * 1000);
    // console.log(diff + ' - ' + diff2)
    if (diff > 0.5 && diff2 <= 30) {
      return true;
    }
    return false;
  }
  return false;
});

hexo.extend.helper.register('page_share_jiathis', function(post, webid) {
  var p = post ? post : this.page;
  var webid = webid ? webid : '';
  var link = encodeURI(p.permalink);
  var title = encodeURI(this.page_title(p, true));
  var uid = this.theme.share.jiathis.uid;
  var summary = encodeURI(this.strip_html(this.page_excerpt(p)));
  if (summary && summary.length > 140) {
    summary = summary.substring(0, 100);
  }

  var url = util.format('http://www.jiathis.com/send/?webid=%s&url=%s&title=%s&uid=%s&summary=%s', webid, link, title,
      uid, summary);
  return url;
});
// insert category of post
hexo.extend.helper.register('post_cates', function(post, options) {
  var o = options || {};
  var _class = o.hasOwnProperty('class') ? o.class : 'category-item';
  var icon = o.hasOwnProperty('icon') ? o.icon : 'glyphicon glyphicon-folder-close';
  var cats = post.categories;
  var _self = this;
  var ret = '';
  if (cats == null || cats.length == 0) {
    return ret;
  }
  ret += '<span class="post-category">';
  ret += '<i class="' + icon + '"></i><span class="hidden-xs">' + _self.__('category.label') + '</span>';
  cats.forEach(function(item, i) {
    ret += '<a class="' + _class + '" href="' + _self.url_for_lang(item.path) + '">' + item.name + '</a>';
  });
  ret += '</span>';
  return ret;
});

// insert tag of post
hexo.extend.helper.register('post_tags', function(post, options) {
  var o = options || {};
  var _class = o.hasOwnProperty('class') ? o.class : 'tag-item';
  var icon = o.hasOwnProperty('icon') ? o.icon : 'icon nova-tags';
  var cats = post.tags;
  var _self = this;
  var ret = '';
  if (cats == null || cats.length == 0) {
    return ret;
  }
  ret += '<span class="post-tag">';
  ret += '<i class="' + icon + '"></i><span class="hidden-xs">' + _self.__('tag.label') + '</span>';
  cats.forEach(function(item) {
    ret += '<a class="' + _class + '" href="' + _self.url_for_lang(item.path) + '">' + item.name + '</a>';
  });
  ret += '</span>';
  return ret;
});

// widget category
hexo.extend.helper.register('widget_cates', function(options) {
  var o = options || {}
  var show_count = o.hasOwnProperty('show_count') ? o.show_count : true;
  var cats = this.site.categories;
  var _self = this;
  var ret = '';
  if (cats == null || cats.length == 0) {
    return _self.__('category.empty');
  }
  ret += '<ul class="list-group">';
  cats.forEach(function(item) { // console.log(item)
    ret += '<li class="list-group-item"><a href="' + _self.url_for_lang(item.path) + '">' + item.name + '</a>';
    if (show_count) {
      ret += '<span class="badge">' + item.posts.length + '</span>';
    }
    ret += '</li>';
  });
  ret += '</ul>';
  return ret;
});

// widget tags
hexo.extend.helper.register('widget_tags', function() {
  var cats = this.site.tags;
  var _self = this;
  var ret = '';
  if (cats == null || cats.length == 0) {
    return _self.__('tag.empty');
  }
  ret += '<ul class="list-group">';
  cats.forEach(function(item) {
    ret += '<li class="list-group-item"><a href="' + _self.url_for_lang(item.path) + '">' + item.name + '</a></li>';
  });
  ret += '</ul>';
  return ret;
});
// widget tags data
hexo.extend.helper.register('widget_tags_data', function() {
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
hexo.extend.helper.register('widget_recents', function(posts, options) {
  return this.nova_list_posts(posts, options);
});

// page unique id, used for comments
// options: hash: false, combined: true;
hexo.extend.helper.register('page_uid', function(page, options) {
  var p = page ? page : this.page;
  var path = p.path;
  if (p === this.page) {
    if (this.is_home() || this.is_category() || this.is_tag() || this.is_archive()) {
      path = p.base;
    }
  }
  // path = this.url_for(path); // don't add /

  var o = options || {};
  var hash = o.hasOwnProperty('hash') ? o.hash : this.theme.page_uid.hash;
  var combined = o.hasOwnProperty('combined') ? o.combined : this.theme.page_uid.combined;

  var paths = path.split('/');
  var lang = paths[0];
  var file = paths[paths.length - 1];
  if (combined && this.get_langs().indexOf(lang) >= 0) {
    paths.shift();
    var ret = paths.join('/');
    // if (!_.endsWith(path, '/')) {
    // ret += '/';
    // }
    return hash ? md5(ret) : ret;
  }
  return hash ? md5(path) : path;
});

// return page show toc or not
hexo.extend.helper.register('page_toc', function(options) {
  var p = this.page;
  if (p.layout == 'post') {// p.toc default off;
    return this.is_post() && this.theme.toc.post && p.toc;
  }
  else if (p.layout == 'page') {
    if (!this.theme.toc.page) {
      return false;
    }
    if (typeof (p.toc) == 'undefined') {
      return true;
    }
    return p.toc;
  }
  else if (p.layout == 'project') {
    if (!this.theme.toc.project) {
      return false;
    }
    if (typeof (p.toc) == 'undefined') {
      return true;
    }
    return p.toc;
  }
});

hexo.extend.helper.register('canonical_url', function(lang) {
  var path = this.page.canonical_path;
  if (lang && lang !== this.default_lang()) path = lang + '/' + path;

  return this.config.url + '/' + path;
});

hexo.extend.helper.register('lang_name', function(lang) {
  if (!this.site.data.languages) {
    return lang;
  }
  var data = this.site.data.languages[lang];
  return data.name || data;
});

hexo.extend.helper.register('page_encrypt', function(page, options) {
  function enc(hexo, p) {
    var ext = pathFn.extname(p.source);
    if ('.html' === ext || '.htm' === ext) {
      p.content = escape(p.content);
    }
    else if ('.md' === ext) {
      p.content = escape(hexo.markdown(p.content));
    }
  }
  var p = page ? page : this.page;
  var code = p.password;
  if (typeof(code) === 'undefined' || !code) {
    return '';
  }

  code = code + '';
  var tip = this.__('page.password_tip');
  var emsg = this.__('page.password_error');
  var o = _.extend({v:2, dom:'.article-content', tip: encodeURI(tip), emsg: encodeURI(emsg), src: '/js/encrypt.min.js'}, options);
  if (o.v == 1) {
    var c = String.fromCharCode(code.charCodeAt(0) + code.length);
    for(var i=1; i < code.length; i++) {
      c += String.fromCharCode(code.charCodeAt(i) + code.charCodeAt(i-1));
    }
    o.code = encodeURI(c); // console.log(o);
    enc(this, p);
  } else if (o.v == 2) {
    o.code = encodeURI(md5(code));
    enc(this, p);
  }



  var url = o.src + '?';
  delete o.src;
  var arr = [];
  _.each(o, function(v,k){
    arr.push(k + "=" + v);
  });
  url += arr.join('&');
  url = '<script src="' + url + '"></script>';
  if (o.v == 2) {
    url = '<script src="//cdn.bootcss.com/blueimp-md5/2.7.0/js/md5.min.js"></script>\n' + url;
  }
  return url;
});

// internal method
var archive_connector = '－';
function get_category_title(hexo, page) {
  var dirs = page.base.split('/');
  var ret = hexo.__('category.name');
  for (var i = 1; i < dirs.length; i++) {
    var dir = dirs[i];
    if (dir.length == 0) continue;
    var map = hexo.config.category_map;
    if (map) {
      for ( var key in map) {
        if (map[key] === dir) {
          dir = key;
          break;
        }
      }
    }
    ret += archive_connector + dir;
  }
  return ret;
};

function get_tag_title(hexo, page) {
  var dirs = page.base.split('/');
  var ret = hexo.__('tag.name');
  for (var i = 1; i < dirs.length; i++) {
    var dir = dirs[i];
    if (dir.length == 0) continue;
    var map = hexo.config.tag_map;
    if (map) {
      for ( var key in map) {
        if (map[key] === dir) {
          dir = key;
          break;
        }
      }
    }
    ret += archive_connector + dir;
  }
  return ret;
};

function get_archive_title(hexo, page) {
  var dirs = page.base.split('/');
  var ret = hexo.__('archive.name');
  for (var i = 1; i < dirs.length; i++) {
    var dir = dirs[i];
    if (dir.length == 0) continue;
    ret += archive_connector + dir;
  }
  return ret;
};
