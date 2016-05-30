
## Introduction ##

The nova is a [hexo](https://hexo.io) theme using swig template aimed to build your github project site conveniently.

The theme provided three layouts to demonstrate the page.

 1. `post` for blog
 2. `project` for github project
 3. `page` for other pages

Nova also provided lots of helper scripts as plugins to co-work with the theme, e.g. donate, toc, project side bar. 

Welcome to visit [My blog](http://ieclipse.cn) (http://ieclipse.cn) to see the demo.

## Dependencies
See [Plugins](#Plugins)

```npm
npm install lodash --save
npm install cheerio --save
npm install hexo-generate-github --save
npm install hexo-generate-i18n --save
```
<var>hexo-generator-github</var> is unnecessary if no `project` layout page in your sources.

## Config
First, change site <var>_config.yml</var> set `theme: nova` to use the theme

### js_css
Add global js and css sample:
```yml
js_css:
- url: css/nova.css
- url: js/script.js
```
### menu
Configurate the site menus
```yml
menu:
- name: home
  url: /
- name: project
  url: /p/
- name: category
  url: /categories/
- name: archive
  url: /archives/
- name: about
  url: /about/
- name: donate
  url: /donate/
```
**the <var>name</var> will be translated.**

### post widgets
```yaml
# post widgets. see layout/post/widget_xxx.swig
post_widgets:
  - search
  - category
  - tag
  - archive
  - recent

post_widgets_show_count: true
post_widgets_recent_count: 5
```

### archive
```yaml
# archive
archive:
  type: yearly #yearly|monthly(defaut) see list_archives options
  order: -1 # 1(asc)|-1(desc) defaut desc
  format: YYYY
  show_count: false # true|false, defaut true
  amount: 5 # amount in post widgets
```

### toc
```yaml
# toc
toc:
  post: true
  project: true
  page: true
```
## Layouts ##
Please see [nova layouts](https://ieclipse.cn/en/p/hexo-theme-nova/layouts.html)

## Helpers

Please see [nova helpers](https://ieclipse.cn/en/p/hexo-theme-nova/helpers.html)

## Plugins

- [lodash] 
- [cheerio] 
- [hexo-generator-github] helps to generator project pages.
- [hexo-generator-i18n] helps to generate multi-language sites.


[hexo-generator-github]: https://github.com/Jamling/hexo-generator-github/
[hexo-generator-i18n]: https://github.com/Jamling/hexo-generator-i18n/

