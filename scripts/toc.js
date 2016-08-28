'use strict';

var cheerio = require('../../../node_modules/hexo/node_modules/cheerio');
/*
 * Mod from hexo/lib/plugins/helper/toc.js
 * valid options: {class:'nav', deep: 3, expand: 6}
 *
*/

function tocHelper(str, options) {
  options = options || {};

  var $ = cheerio.load(str);
  var headings = $('h1, h2, h3, h4, h5, h6');

  if (!headings.length) return '';

  var className = options.class || 'nav';
  var expand = options.hasOwnProperty('expand') ? options.expand : 6;
  var result = '';
  var lastNumber = [0, 0, 0, 0, 0, 0];
  var firstLevel = 0;
  var lastLevel = 0;
  var i = 0;
  var deep = options.hasOwnProperty('deep') ? options.deep : 3;

  function MyNode(level, id, label){
    this.label = label;
    this.l = level;
    this.id = id;
    this.parent = undefined;
    this.sub = [];
    this.add = function(ch){
      this.sub.push(ch);
      ch.parent = this;
    }
    return this;
  }
  var items = [];
  var min = 6;
  headings.each(function() {
    var level = this.name[1];
    var id = $(this).attr('id');
    var text = $(this).text();
    items.push(new MyNode(level,id,text));
    if (min > level) {
      min = level;
    }
  });
  // console.log(items);

  var root = new MyNode(min-1);
  var last = root;
  var parent = root;

  items.forEach(function(item){//console.log('--------------'); console.log(item.l+ "." + last.id); console.log(last.l + "." + last.id); console.log(parent.l + "." + parent.id);
    if (item.l == last.l){// console.log("eq");
      parent.add(item);
    }
    else if (item.l > last.l){//console.log("sub");//sub
		last.add(item);
		parent = last;
	}
    else if (item.l < last.l){//console.log("super");//super
		while(parent) {
		  if (parent.l < item.l){
			parent.add(item);
			break;
		  }
		  parent = parent.parent;
		}
        // last = root;
	  /*
      for(var j= last.l;j<item.l - 1;j++){
        var n = new MyNode(j+1);
        last.add(n);
        last = n;
      }
      last.add(item);*/
    }
    last = item;
  });
  // console.log(root);
  function node(item){
    if (item.l - root.l > deep) {
      return;
    }
    var ex = item.l - root.l < expand;
    var hasChild = item.sub.length>0;
    var vi = item.id === undefined;
    result += '<li>';
    if (vi) result += '<a>' + item.label + '</a>';
    else result += '<a href="#' + item.id + '">' + item.label + '</a>';
    if (hasChild){
      result += '<ul class="' + className + '">';
      item.sub.forEach(function(sub){
        node(sub);
      });
      result += '</ul>';
    }
    result += '</li>';
  }
  result += '<ul class="' + className + '">';
  root.sub.forEach(function(sub){
    node(sub);
  });
  result += '</ul>';
  return result;
}

hexo.extend.helper.register('nova_toc', tocHelper);
