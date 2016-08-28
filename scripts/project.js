'use strict';

var pathFn = require('path');
var _ = require('../../../node_modules/hexo/node_modules/lodash');
var util = require('util');

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
    if (('project.' + last) !== i18n){
      return i18n;
    }
    return _self.__(key);
  }

  var data = [];
  var mis = [];

  function iterate(item, pnode, pk){
    _.each(item, function(value, key){
      var n = new Node();
      n.text = i18n(pk + "." + key);
      if (_.isString(value)){
        n.selectable = false;
        n.href = value;
        if (file === value) {
          n.state.selected = true;
          //n.state.expanded = true;
          //n.state.disabled = true;
          n.selectable = false;
          if (pnode && pnode.state){
            pnode.state.expanded = true;
          }
        }
        mis.push(value);
      } else {
        n.color = parent_color;
        n.text = '<b>' + n.text + '</b>';
        iterate(value, n, pk + '.' + key);
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

  iterate(p, data, name);
  var dir = pathFn.dirname(this.page.path) + '/';
  var i = mis.indexOf(file);
  if (i>0){
    this.page.prev = dir + mis[i-1];
    this.page.prev_link = dir + mis[i-1];
  }
  if (i<mis.length-1){
    this.page.next = dir + mis[i+1];
    this.page.next_link = dir + mis[i+1];
  }
  return JSON.stringify(data);
});

// return github api time
hexo.extend.helper.register('gh_time', function(str, format){
  if (!str){
    return 'invalid date';
  }
  return str.replace(/T.+/,'');
  //var d = new Date(str.replace(/T/, ' ').replace(/Z/, ''));
  //return this.date(d, format);
});

// return github api size in well format
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

hexo.extend.helper.register('gh_release_toc', function(releases, options){
  options = options || {};
  var className = options.hasOwnProperty('class') ? options.class : 'nav';
  var ret = '<ul class="' + className + '">';
  releases.forEach(function(p) {
    ret += '<li><a href="#' + p.tag_name + '">' + p.tag_name + '</a></li>';
  });
  ret += '</ul>';
  return ret;
});
