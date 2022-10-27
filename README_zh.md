[![Build Status](https://travis-ci.org/Jamling/hexo-theme-nova.svg?branch=master)](https://travis-ci.org/Jamling/hexo-theme-nova)
[![GitHub release](https://img.shields.io/github/release/jamling/hexo-theme-nova.svg)](https://github.com/Jamling/hexo-theme-nova/releases/latest)


## 简介 ##

nova是使用swig模板引擎编写的[hexo]主题，旨在方便快速地为github项目创建一个简单的静态网站，如[Github-Pages]。

本主题主要使用以下三种布局来展现页面：

 1. `post` 用于博客文章
 2. `project` 用于github项目页面
 3. `page` 用于其它页面，如关于我

本主题还使用了一些插件作为辅助函数。如TOC目录生成，项目侧边导航栏等。详情请访问[我的主页] (https://www.ieclipse.cn)。

另有一些好玩的东东，请访问[主题特色功能]查看.

## 预览截屏

![screenshot](https://dingdi.ieclipse.cn/hexo-theme-nova/screenshots/bootstrap.png)

## 特性

- Bootstrap 响应式设计，支持移动端浏览
- 生成唯一的页面ID, 无需担心站点切换
- 多种第三方评论组件，支持disqus, valine, ~~duoshuo~~, ~~gentie~~, ~~changyan~~, ~~uayn~~ 等
- 支持博客文章加密（无法通过查看源代码解密），须通过输入正确的密码访问
- 支持文章阅读数
- 支持捐赠
- 含前端代码高亮及复制功能
- 支持微数据(micro-data)，提供更好的SEO
- 支持国际化（一次生成多个语言站点内容）
- 支持思维导图，个人简历

## 变更 

### V0.3.0
- 停止百度站内搜索及url链接提交，请使用`hexo-generator-search`及`hexo-submit-urls-to-search-engine`或其它相似插件代替 
- 更新leancloud文章计数功能，兼容Valine文章计数（不推荐，Valine 1.4之后不开放源码，无法修改bug）本主题文章计数功能更准确，更友好。
  
  迁移指南，登录LeanCloud控制台，修改Counter计数表，pageId修改为xid，views修改为time。
### V0.2.0 (重大更新)

- 删除已停止服务的友加分享，换上了share.js
- 删除material颜色样式 (极大地减少了css文件体积)
- 将畅言评论换成了valine，（因为畅言去广告要收费，而且畅言的评论不好导出）
- 将代码复制zero clipboard组件换成clipboard.js（因为flash陆续不被各大浏览器厂商所支持）
- 重新组织了nova css，使用内联样式风格，可读性得到了增强
- 通过W3C校验

## 安装
Cd到博客/站点根目录，然后检出代码
```bash
$ git clone git@github.com:Jamling/hexo-theme-nova.git themes/nova
```
最后在站点<var>_config.yml</var> 配置文件中设置 `theme: nova` 来使用nova主题。

## 依赖
本主题使用了一些第三方的插件，在使用之前，请在博客站点根目录下安装这些插件

```powershell
npm install hexo-renderer-sass --save
npm install hexo-generator-i18n --save

npm install hexo-generator-github --save
npm install hexo-filter-highlight --save

npm install cheerio --save // hexo >= 5.0
npm install hexo-renderer-swig --save // hexo >= 5.0

```

示例依赖（博客根目录）
```
  "dependencies": {
    "cheerio": "^1.0.0-rc.12", // toc目录需要使用
    "hexo": "^6.3.0", // 可用hexo最新版本
    "hexo-addlink": "^1.0.4",
    "hexo-algolia": "^1.3.2",
    "hexo-deployer-git": "^2.1.0",
    "hexo-filter-highlight": "1.0.0", // 代码高亮
    "hexo-fs": "^2.0.1",
    "hexo-generator-archive": "^1.0.0",
    "hexo-generator-category": "^1.0.0",
    "hexo-generator-feed": "^2.2.0",
    "hexo-generator-github": "^1.0.1", // 同步github项目或页面插件
    "hexo-generator-i18n": "^0.0.7", // 多语言
    "hexo-generator-index2": "^0.2.0", // 首页过滤
    "hexo-generator-search": "^2.4.3",
    "hexo-generator-tag": "^1.0.0",
    "hexo-renderer-marked": "^6.0.0", // markdown渲染
    "hexo-renderer-sass": "^0.4.0", // css
    "hexo-renderer-stylus": "^1.1.0",
    "hexo-renderer-swig": "^2.0.0", // 渲染引擎
    "hexo-server": "^1.0.0",
    "hexo-submit-urls-to-search-engine": "^2.1.0" // 提交链接到搜索引擎
  }
```

- <var>hexo-generator-github</var>不是必需的，如果sources中没有`project`布局页面，则可以不安装此插件。
- <var>hexo-filter-highlight</var>不是必需的，如果不想用本主题代码高亮方案，则可以不安装此插件。

## 常见问题
### 找不到cheerio 
`Error: Cannot find module '../../../node_modules/cheerio'`

从hexo 5.0之后，lodash与cheerio已从依赖中移除，请在博客根目录安装`cheerio`插件

### 首页空白
首页内容为一堆 {{xxxx}}
从hexo 5.0?，默认的渲染引擎从`swig`换成了`nunjucks`，请在博客根目录安装`hexo-renderer-swig`插件

### 捐献，文章阅读，访客数，公告等无法使用
请配置leancloud，数据库设计可参考[leancloud_schemal.zip](./leancloud_schemal.zip)

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

## 联系我们

请在QQ中搜索hexo-theme-nova群（群号：756721335）以获取支持
![qq group](http://hexo.ieclipse.cn/hexo-theme-nova/qq_group.jpg)

[hexo]: https://hexo.io
[我的主页]: https://www.ieclipse.cn
[主题特色功能]: https://www.ieclipse.cn/en/demo/
[Github-Pages]: https://www.ieclipse.cn
[lodash]: https://github.com/lodash/lodash
[cheerio]: https://github.com/cheeriojs/cheerio
[hexo-renderer-sass]: https://github.com/knksmith57/hexo-renderer-sass
[hexo-generator-github]: https://github.com/Jamling/hexo-generator-github/
[hexo-generator-i18n]: https://github.com/Jamling/hexo-generator-i18n/
[hexo-filter-highlight]: https://github.com/Jamling/hexo-filter-highlight/
