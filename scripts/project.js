'use strict';

var pathFn = require('path');
var _ = require('lodash');
var url = require('url');
var util = require('util');
var nunjucks = require('nunjucks');
// npm install urllib-sync
var request = require('urllib-sync').request;
// see https://github.com/node-modules/urllib

function SyncGithubAPI(opts){
  this.host = "https://api.github.com/";
  // this.token = this.theme.gh.token;
  // this.user = this.theme.gh.user;
  this.opts = opts || {
    dataType: 'json',
    timeout: 15000,
    data: {
      
    }
  }

}


SyncGithubAPI.prototype.reqSync = function(path, options){
    var o = options || {};
    var url = this.host  + path;
    console.log("gh api:" + url)
    var res = request(url, _.extend(this.opts, o));
    util.inspect(request)
    if (res.err) {
      console.error(res.err);
      return;
    }// console.log(res.headers);
    var limit = 0;
    if (res.headers['x-ratelimit-limit']){
      limit = res.headers['x-ratelimit-limit'];
    }
    var remain = 0;
    if (res.headers['x-ratelimit-remaining']){
      remain = res.headers['x-ratelimit-remaining'];
    }
    var reset = '';
    if (res.headers['x-ratelimit-reset']){
      reset = new Date(res.headers['x-ratelimit-reset'] * 1000);
    }
    
    console.log('rate limit:%d,remaining:%d,reset:%s', limit, remain, reset);
    if (!res.statusCode == 200){
      console.error(res);
      return res.message;
    }
    return res.data;
}
SyncGithubAPI.prototype.setToken = function(token){
  // token error will response 401
  //this.opts.data.access_token = token;
}

var gh = new SyncGithubAPI();

hexo.extend.helper.register('gh_opts', function(options){
  var gh = this.page.gh;
  if (!gh.user){
    gh.user = this.theme.gh.user;
  }
  var pIndex = 1;
  if (this.page.lang !== this.default_lang()){
    pIndex++;
  }
    var o = options || {};
    var path_index = o.hasOwnProperty('index') ? o.index : pIndex;
    if (!_.isNumber(path_index)){
      path_index = pIndex;
    }
    var paths = this.page.path.split('/');
    var name = paths[path_index];
    var file = paths[paths.length - 1];  
    if (!gh.repo){
      gh.repo = name;
    }
    /*
    if (!gh.file){
      gh.file = file;
    }
    */
    
  console.log(gh);
  return gh;
  
});

hexo.extend.helper.register('gh_time', function(str, format){
  if (!str){
    return 'invalid date';
  }
  return str.replace(/T.+/,'');
  //var d = new Date(str.replace(/T/, ' ').replace(/Z/, ''));
  //return this.date(d, format);
});

hexo.extend.helper.register('gh_file_size', function(bytes){
  if (bytes >= (1<<20)){
    var f = (bytes/ (1<<20)).toFixed(2);
    return f + " M";
  }
  if (bytes >= (1<<10)){
    var f = (bytes/ (1<<10)).toFixed(2);
    return f + " K";
  }
  return bytes + " B";
});

hexo.extend.helper.register('gh_repos', function(options){
  var o = options || {};
  var user = o.hasOwnProperty('user') ? o.user : this.theme.gh.user;
  var _self = this;
  
  if (!user){
    return 'no github user assigned, please check your theme gh.user configuration';
  }
  
  function filter_repo(repo){
    var config_repos = _self.theme.gh.repos;
    if (config_repos && util.isArray(config_repos)){
      return config_repos.indexOf(repo.name) < 0; // not exist
    }
    return false;
  }

  var ret = [];
	var url = util.format('users/%s/repos', user);
  
  gh.setToken(this.theme.gh.token);
  var repos = gh.reqSync(url);
  console.log('%s has %d repos', user, repos.length);
        repos.forEach(function(repo){
          if (!filter_repo(repo))
          { 
            ret.push(repo);
          }
        });
  return ret;
});

hexo.extend.helper.register('gh_repo', function(options){
  var o = options || {}
  var user = o.hasOwnProperty('user') ? o.user : this.theme.gh.user;
  var name = o.hasOwnProperty('repo') ? o.repo : null;
  if (name === undefined) {
    return null;
  }
  
  var url = util.format('repos/%s/%s', user, name);
  
  gh.setToken(this.theme.gh.token);
  var repo = gh.reqSync(url);
  return repo;
});

hexo.extend.helper.register('gh_repo_contents', function(options){
  var o = options || {}
  var user = o.hasOwnProperty('user') ? o.user : this.theme.gh.user;
  var name = o.hasOwnProperty('repo') ? o.repo : null;
  var path = o.hasOwnProperty('path') ? o.path : 'README.md';
  var ref = o.hasOwnProperty('ref') ? o.ref : 'master';
  
  if (name === undefined) {
    return '';
  }
  
  gh.setToken(this.theme.gh.token);
  var url = util.format('repos/%s/%s/contents/%s', user, name, path);
  var repo = gh.reqSync(url, {data:{'ref': ref}});
  if (repo.content){
    var md = new Buffer(repo.content, repo.encoding).toString();
    return this.markdown(md);
  }
  return '';
});

hexo.extend.helper.register('md_test', function(){
  var ret = this.markdown('# title1\n ** strong');
  console.log(ret);
  return ret;
});

hexo.extend.tag.register('gh_tag_contents', function(args, context){
  var user = args.shift();
  var name = args.shift();
  var path = args.shift();
  var ref = args.length>0 ? args.shift() : 'master';
  var gh = new SyncGithubAPI();
  var url = util.format('repos/%s/%s/contents/%s', user, name, path);
  //gh.setToken(this.theme.gh.token);
  var repo = gh.reqSync(url, {data:{'ref': ref}});
  if (repo.content){
    return new Buffer(repo.content, repo.encoding);
  }
  return '';
  
});
hexo.extend.helper.register('gh_repo_releases', function(options){
  var o = options || {}
  var user = o.hasOwnProperty('user') ? o.user : this.page.gh.user;
  var name = o.hasOwnProperty('repo') ? o.name : this.page.gh.repo;
  
  if (name === undefined) {
    return '';
  }
  
  gh.setToken(this.theme.gh.token);
  var url = util.format('repos/%s/%s/releases', user, name);
  var repo = gh.reqSync(url);
  
  return repo;
});

// deprecated
hexo.extend.helper.register('p_nav_i18n', function(key){
  var last = key.split('.').pop();
  var i18n = this.__('project.' + last);
  if (last !== i18n){
    return i18n;
  }
  return this.__(key);
});

// 
hexo.extend.helper.register('gh_raw_link', function(options){
  var o = options || {}
  var user = o.hasOwnProperty('user') ? o.user : this.theme.gh.user;
  var name = o.hasOwnProperty('repo') ? o.repo : null;
  var path = o.hasOwnProperty('path') ? o.path : "README.md";
  var ref = o.hasOwnProperty('ref') ? o.ref : 'master';
  return util.format('https://github.com/%s/%s/edit/%s/%s', user, name, ref, path);
});

// project layout left nav tree
hexo.extend.helper.register('p_nav', function(options){
  var o = options || {};
  var parent_color = o.hasOwnProperty('parent_color') ? o.parent_color : null;
  var child_color = o.hasOwnProperty('child_color') ? o.child_color : null;
  
  var _self = this;
  
  var paths = this.page.path.split('/');
  var name = this.page.gh? this.page.gh.repo : paths[paths.length - 2];
  var file = paths[paths.length - 1];
  var p = this.site.data.projects[name];
  
  function Node(){ // bootstrap-treeview refer to: http://www.htmleaf.com/jQuery/Menu-Navigation/201502141379.html
    var node = {
      text: "",
      //icon: "glyphicon glyphicon-stop",
      //selectedIcon: "glyphicon glyphicon-stop",
      color: child_color,
      //backColor: "#FFFFFF",
      href: "#",
      selectable: false,
      state: {
        // checked: true,
        disabled: false,
        expanded: false,
        selected: false
      },
      //tags: ['available'],
      //nodes: []
    }
    return node;
  }
  
  function JqNode(){
    var node = {
      
    }
    return node;
  }
  
  function i18n(key){
    var last = key.split('.').pop();
    var i18n = _self.__('project.' + last);
    if (last !== i18n){
      return i18n;
    }
    return _self.__(key);
  }
  
  var data = [];
  var mis = [];
  
  function iterate(item, pnode){
    _.each(item, function(value, key){
      var n = new Node();
      n.text = i18n(key);
      if (_.isString(value)){
        n.selectable = false;
        n.href = value;
        if (file === value) {
          n.state.selected = true;
          //n.state.expanded = true;
          //n.state.disabled = true;
          n.selectable = false;
        }
        mis.push(value);
      } else {
        n.color = parent_color;
        n.text = '<b>' + n.text + '</b>';
        iterate(value, n);
      }
      if (_.isArray(pnode)){
        pnode.push(n);
      } else {
        if (typeof pnode.nodes === 'undefined') {
          pnode.nodes = [];
        }
        pnode.nodes.push(n);
      }
    });
  }
  
  iterate(p, data);
  var i = mis.indexOf(file);
  if (i>0){
    this.page.prev = mis[i-1];
    this.page.prev_link = mis[i-1];
  }
  if (i<mis.length-1){
    this.page.next = mis[i+1];
    this.page.next_link = mis[i+1];
  }
  return JSON.stringify(data);
});