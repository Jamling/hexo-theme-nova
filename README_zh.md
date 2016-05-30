
## 简介 ##

nova是使用swig模板引擎编写的[hexo](https://hexo.io)主题，旨在方便快速地创建为github项目创建一个简单的静态网站，如[Github-Pages]。

本主题主要使用以下三种布局来展现页面：

 1. `post` 用于博客文章
 2. `project` 用于github项目页面
 3. `page` 用于其它页面，如关于我

本主题还使用了一些插件作为辅助函数。如TOC目录生成，项目侧边导航栏等。详情请访问[我的主页](http://ieclipse.cn) (http://ieclipse.cn)。

## 依赖
请参考 [插件](#Plugins)

```npm
npm install hexo-generate-github --save
npm install hexo-generate-i18n --save
```
<var>hexo-generator-github</var>不是必需的，如果sources中没有`project`布局页面，则可以不安装此插件。

## 配置
首先，请在站点<var>_config.yml</var> 配置文件中设置 `theme: nova` 来使用nova主题。

### js_css
配置全局css样式及js脚本，示例：
```yaml
js_css:
- url: css/nova.css
- url: js/script.js
```
### menu
配置站点菜单栏，示例：
```yaml
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
**the <var>name</var> 将会被国际化输出**

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

## 辅助函数

请参考[nova helpers](https://ieclipse.cn/p/hexo-theme-nova/helpers.html)

## 布局 ##
请参考[nova layouts](https://ieclipse.cn/p/hexo-theme-nova/layouts.html)

## 插件

- [hexo-generator-github] 用于辅助生成github项目相关的页面。
- [hexo-generator-i18n] 用于辅助生成多语言站点页页。


[hexo-generator-github]: https://github.com/Jamling/hexo-generator-github/
[hexo-generator-i18n]: https://github.com/Jamling/hexo-generator-i18/
