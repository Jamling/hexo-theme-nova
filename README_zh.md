[![Build Status](https://travis-ci.org/Jamling/hexo-theme-nova.svg?branch=master)](https://travis-ci.org/Jamling/hexo-theme-nova)
[![node](https://img.shields.io/node/v/hexo-theme-nova.svg)](https://www.npmjs.com/package/hexo-theme-nova)
[![GitHub release](https://img.shields.io/github/release/jamling/hexo-theme-nova.svg)](https://github.com/Jamling/hexo-theme-nova/releases/latest)


## 简介 ##

nova是使用swig模板引擎编写的[hexo](https://hexo.io)主题，旨在方便快速地创建为github项目创建一个简单的静态网站，如[Github-Pages]。

本主题主要使用以下三种布局来展现页面：

 1. `post` 用于博客文章
 2. `project` 用于github项目页面
 3. `page` 用于其它页面，如关于我

本主题还使用了一些插件作为辅助函数。如TOC目录生成，项目侧边导航栏等。详情请访问[我的主页](http://www.ieclipse.cn) (http://www.ieclipse.cn)。

一些好玩的东东[http://www.ieclipse.cn/en/demo/](http://www.ieclipse.cn/en/demo/).

## 预览截屏

![screenshot](https://raw.githubusercontent.com/Jamling/hexo-theme-nova/master/screenshots/bootstrap.png)

## 安装
Cd到博客/站点根目录，然后检出代码
```bash
$ git clone git@github.com:Jamling/hexo-theme-nova.git themes/nova
```
最后在站点<var>_config.yml</var> 配置文件中设置 `theme: nova` 来使用nova主题。

## 依赖
本主题使用了一些第3方的插件，在使用之前，请在博客站点根目录下安装这些插件

```powershell
npm install hexo-renderer-sass --save
npm install hexo-generator-i18n --save

npm install hexo-generator-github --save
npm install hexo-filter-highlight --save
```

- <var>hexo-generator-github</var>不是必需的，如果sources中没有`project`布局页面，则可以不安装此插件。
- <var>hexo-filter-highlight</var>不是必需的，如果不想用本主题代码高亮方案，则可以不安装此插件。

## 主题配置

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
```
**the <var>name</var> 将会被国际化输出**

### post widgets
```yaml
# post widgets. see layout/post/widget_xxx.swig
post_widgets:
#  - search
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

### 打赏
```yaml
donate:
  enable: true # whether enable page donate
```
打赏的二维码图片尺寸建议大于200px，打赏图片名称为：donate_aliplay.png和donate_wechat.png

### 界面网格css
配置html最后呈现界面布局的网格系统样式

```yaml
layout:
  index: # 首页，博客文章页布局同首页.
    main: col-sx-12 col-sm-8 col-md-9 col-lg-9
    widgets: col-sx-12 col-sm-4 col-md-3 col-lg-3 hidden-xs
  page: # 单页布局
    main: col-sx-12 col-sm-8 col-md-9 col-lg-9
    toc: col-sx-12 col-sm-4 col-md-3 col-lg-3 hidden-xs
  p: # 项目文档页
    sidebar: col-sx-12 col-sm-12 col-md-2 col-lg-2
    main: col-sx-12 col-sm-8 col-md-8 col-lg-8
    toc: col-sx-2 col-sm-2 col-md-2 col-lg-2 hidden-xs

```

## 参考
### 布局
请参考[nova layouts](https://ieclipse.cn/p/hexo-theme-nova/layouts.html)

### Front-matter
请参考[nova front-matter](https://ieclipse.cn/p/hexo-theme-nova/front-matter.html)

### 辅助函数
请参考[nova helpers](https://ieclipse.cn/p/hexo-theme-nova/helpers.html)

### 插件

- [hexo-renderer-sass] 用于生成css。
- [hexo-generator-i18n] 用于辅助生成多语言站点页页。
- [hexo-generator-github] 用于辅助生成github项目相关的页面。
- [hexo-filter-highlight] 用于代码高亮

详情请参考[nova plugins](https://ieclipse.cn/p/hexo-theme-nova/plugins.html)

[lodash]: https://github.com/lodash/lodash
[cheerio]: https://github.com/cheeriojs/cheerio
[hexo-renderer-sass]: https://github.com/knksmith57/hexo-renderer-sass
[hexo-generator-github]: https://github.com/Jamling/hexo-generator-github/
[hexo-generator-i18n]: https://github.com/Jamling/hexo-generator-i18n/
[hexo-filter-highlight]: https://github.com/Jamling/hexo-filter-highlight/
