'use strict';

// rewrite list_archives();
// mod from .\node_modules\hexo\lib\plugins\helper\list_archives.js
function listArchivesHelper(options = {}) {
  /* jshint validthis: true */
  const { config } = this;
  const archiveDir = config.archive_dir;
  const archivePerPage = config.archive_generator && config.archive_generator.per_page;
  const { timezone } = config;
  const lang = this.page.lang || this.page.language || config.language;
  let { format } = options;
  const type = options.type || 'monthly';
  const { style = 'list', transform, separator = ', ' } = options;
  const showCount = options.hasOwnProperty('show_count') ? options.show_count : true;
  const className = options.class || 'archive';
  const order = options.order || -1;
  let result = '';
  const self = this;

  if (!format) {
    format = type === 'monthly' ? 'MMMM YYYY' : 'YYYY';
  }

  const posts = style === 'page' ? this.page.posts.sort('date', order) : this.site.posts.sort('date', order);
  if (!posts.length) return result;

  const data = [];
  let length = 0;

  posts.forEach(post => {
    // Clone the date object to avoid pollution
    let date = post.date.clone();

    if (timezone) date = date.tz(timezone);
    if (lang) date = date.locale(lang);

    const year = date.year();
    const month = date.month() + 1;
    const name = date.format(format);
    const lastData = data[length - 1];

    if (!lastData || lastData.name !== name) {
      length = data.push({
        name,
        year,
        month,
        posts: [post],
        count: 1
      });
    } else {
      lastData.count++;
      lastData.posts.push(post);
    }
  });
  const link = item => {
    let url = `${archiveDir}/${item.year}/`;

    if (type === 'monthly') {
      if (item.month < 10) url += '0';
      url += `${item.month}/`;
    }

    return this.url_for_lang(url);
  };

  var len;

  if (style === 'list') {
    result += `<div class="${className}">`;

    for (let i = 0, len = data.length; i < len; i++) {
      const item = data[i];

      result += `<a class="${className}-item" href="${link(item)}">`;
      result += transform ? transform(item.name) : item.name;


      if (showCount) {
        result += `<span class="badge">${item.count}</span>`;
      }

      result += '</a>';
    }

    result += '</div>';
  }
  else if (style === 'group') {
    const plimit = options.hasOwnProperty('post_limit') ? options.post_limit : 10;
    result += '<div class="panel">\n';
    for (let i = 0, len = data.length; i < len; i++) {
      const item = data[i];

      result += `<div class="panel-heading${className}">\n`;

      result += `<h3 class="panel-title"><a class="${className}-link" href="${link(item)}">`;
      result += transform ? transform(item.name) : item.name;
      result += '</a><span class="caret"></span></h3>';

      if (showCount) {
        result += `<span class="badge">${item.count}</span>`;
      }
      result += '</div>\n';
      result += `<div class="panel-body">\n`;

      for (let j = 0; j < plimit && j < item.posts.length; j++) {
        const post2 = item.post[j];
        result += `<p><a href="${self.url_for_lang(post2.path)}">${post2.title}</a></p>`;
      }
      result += '</div>\n';
    }
    result += '</div>\n';
  }
  else if (style === 'page') {
    const plimit = options.hasOwnProperty('post_limit') ? options.post_limit : (archivePerPage || 10);
    result += `<section class="${className}-wrap">\n`;
    for (let i = 0, len = data.length; i < len; i++) {
      const item = data[i];

      result += `<div class="${className}-heading">\n`;

      result += `<h1><a class="${className}-heading-link" href="${link(item)}">`;
      result += transform ? transform(item.name) : item.name;
      result += '</a>';

      if (showCount) {
        result += `<span class="badge">${item.count}</span>`;
      }

      result += '</h1><hr></div>\n';

      result += `<div class="${className}-body">\n`;
      for (let j = 0; j < plimit && j < item.posts.length; j++) {
        const post2 = item.posts[j];
        result += `<article class="${className}-article archive-type-${post2.layout}">\n`;
        result += `<header class="${className}-article-header">\n`;
        result += `<h3><a href="${self.url_for_lang(post2.path)}">${post2.title} <small>${post2.date.format('YYYY-MM-DD')}</small></a></h3>\n`;
        result += '</header>\n';
        result += '</article>\n';
      }
      result += '</div>\n';
    }
    result += '</section>\n';
  }
  else {
    for (let i = 0, len = data.length; i < len; i++) {
      const item = data[i];

      if (i) result += separator;

      result += `<a class="${className}-item" href="#{link(item)}">`;
      result += transform ? transform(item.name) : item.name;

      if (showCount) {
        result += `<span class="badge">${item.count}</span>`;
      }

      result += '</a>';
    }
  }

  return result;
}

hexo.extend.helper.register('nova_list_archives', listArchivesHelper);
hexo.extend.helper.register('nova_archives', listArchivesHelper);