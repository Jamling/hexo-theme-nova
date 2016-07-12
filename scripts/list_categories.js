'use strict';
// mode from hexo list categories
function listCategoriesHelper(categories, options) {
  if (!options && (!categories || !categories.hasOwnProperty('length'))) {
    options = categories;
    categories = this.site.categories;
  }

  if (!categories || !categories.length) return '';
  options = options || {};

  var style = options.hasOwnProperty('style') ? options.style : 'list';
  var showCount = options.hasOwnProperty('show_count') ? options.show_count : true;
  var className = options.class || 'category';
  var depth = options.depth ? parseInt(options.depth, 10) : 0;
  var orderby = options.orderby || 'name';
  var order = options.order || 1;
  var transform = options.transform;
  var separator = options.hasOwnProperty('separator') ? options.separator : ', ';
  var showCurrent = options.show_current || false;
  var childrenIndicator = options.hasOwnProperty('children_indicator') ? options.children_indicator : false;
  var result = '';
  var self = this;

  function prepareQuery(parent) {
    var query = {};

    if (parent) {
      query.parent = parent;
    } else {
      query.parent = {$exists: false};
    }

    return categories.find(query).sort(orderby, order).filter(function(cat) {
      return cat.length;
    });
  }

  function hierarchicalList(level, parent) {
    var result = '';

    prepareQuery(parent).forEach(function(cat, i) {
      var child;
      if (!depth || level + 1 < depth) {
        child = hierarchicalList(level + 1, cat._id);
      }

      var isCurrent = false;
      if (showCurrent && self.page) {
        for (var j = 0; j < cat.length; j++) {
          var post = cat.posts.data[j];
          if (post && post._id === self.page._id) {
            isCurrent = true;
            break;
          }
        }

        // special case: category page
        if (!isCurrent && self.page.base) {
          if (self.page.base.indexOf(cat.path) === 0) {
            isCurrent = true;
          }
        }
      }

      var additionalClassName = '';
      if (child && childrenIndicator) {
        additionalClassName = ' ' + childrenIndicator;
      }

      result += '<li class="' + className + '-item' + additionalClassName + '">';

      result += '<a class="' + className + '-link' + (isCurrent ? ' active' : '') + '" href="' + self.url_for_lang(cat.path) + '">';
      result += transform ? transform(cat.name) : cat.name;
      result += '</a>';

      if (showCount) {
        result += '<span class="badge">' + cat.length + '</span>';
      }

      if (child) {
        result += '<ul class="' + className + additionalClassName + '">' + child + '</ul>';
      }

      result += '</li>';
    });

    return result;
  }

  function flatList(level, parent) {
    var result = '';

    prepareQuery(parent).forEach(function(cat, i) {
      if (i || level) result += separator;

      result += '<a class="' + className + '-link" href="' + self.url_for_lang(cat.path) + '">';
      result += transform ? transform(cat.name) : cat.name;

      if (showCount) {
        result += '<span class="' + className + '-count">' + cat.length + '</span>';
      }

      result += '</a>';

      if (!depth || level + 1 < depth) {
        result += flatList(level + 1, cat._id);
      }
    });

    return result;
  }

  /*
  if (style === 'list') {
    result += '<ul class="' + className + '-list">' + hierarchicalList(0) + '</ul>';
  } else {
    result += flatList(0);
  }
  */
  result += '<ul class="' + className + '">' + hierarchicalList(0) + '</ul>';

  return result;
}

//module.exports = listCategoriesHelper;
hexo.extend.helper.register('nova_list_categories', listCategoriesHelper);

function listCategoriesHelper2(categories, options) {
  if (!options && (!categories || !categories.hasOwnProperty('length'))) {
    options = categories;
    categories = this.site.categories;
  }

  if (!categories || !categories.length) return '';
  options = options || {};
  
  var separator = options.hasOwnProperty('separator') ? options.separator : ', ';
  var className = options.class || 'category';
  var transform = options.transform;
  
  var self = this;
  
  function Node(){
    var node = {
      id: '',
      topic: ''
      // children:[]
    }
    return node;
  }
  
  var root = Node();
  root.id = 'root';
  root.topic = this.__('site.title');
  root.children = [];
  
  function prepareQuery(parent) {
    var query = {};

    if (parent) {
      query.parent = parent;
    } else {
      query.parent = {$exists: false};
    }

    return categories.find(query).sort('name', 1).filter(function(cat) {
      return cat.length;
    });
  }
  
  function flatList(level, parent) {
    var result = '';

    prepareQuery(parent).forEach(function(cat, i) {
      if (i) result += separator;
      var a = '';
      a += '<a class="' + className + '-link" href="' + self.url_for_lang(cat.path) + '">';
      a += cat.name;
      a += '</a>';
      
      var node = '{id:"' + cat._id + '",topic:\'' + a + '\'';
      if (level == 0 && i % 2 == 0){
        node += ', direction:"left"';
      } else {
        node += ', direction:"right"';
      }

      // if (!depth || level + 1 < depth)
      {
        var child = flatList(level + 1, cat._id);
        if (child){
          node += ',"children":[' + child + ']}';
        } else {
          node += '}';
        }        
      }
      result += node;
    });

    return result;
  }
  
  var ret = '{id:"root", topic:"' + self.__('site.title') + '", children:[' + flatList(0) + ']}';
  return ret;
};
hexo.extend.helper.register('nova_mind_categories', listCategoriesHelper2);
