
<div class="container-fluid">
<style type="text/css">
.release::before {
    display: table;
    content: "";
}
.release::after {
    display: table;
    clear: both;
    content: "";
}

.release-meta {
    float: left;
    width: 20%;
    padding: 20px 20px;
    text-align: right;
    vertical-align: top;
}
.release .tag-references > li {
    display: block;
    margin: 0 0 5px;
}
.octicon {
    display: inline-block;
    vertical-align: text-top;
    fill: currentColor;
}

.release-body {
    float: left;
    width: 80%;
    padding: 0px 20px;
    border-left: 2px solid #eee;
}
.release-authorship {
    margin-top: 5px;
    margin-bottom: 20px;
    font-size: 14px;
    color: #767676;
}
.avatar {
    display: inline-block;
    overflow: hidden;
    line-height: 1;
    vertical-align: middle;
    border-radius: 3px;
}
.release-authorship a {
    font-weight: bold;
    color: #666;
}
.markdown-body::before {
    display: table;
    content: "";
}
.markdown-body::after {
    display: table;
    clear: both;
    content: "";
}
.release-downloads {
    margin-top: 10px;
    font-size: 14px;
    border-top: 1px solid #eee;
}
.release-downloads li {
    display: block;
    padding-top: 8px;
    padding-bottom: 8px;
    border-bottom: 1px solid #eee;
}
.right, .float-right {
    float: right !important;
}
</style>
<div class="row">
  <div class="col-sx-2 col-sm-2 col-md-2 col-lg-2" role="navigation" style="padding-left:10px;">
    {{ partial('sidebar', {}) }}
  </div>
  <div class="col-sx-12 col-sm-8 col-md-8 col-lg-8 article-container" id="article-container" data-spy="scroll" data-target="#toc" style="height:100%">
    <div class="release-timeline">
    {% for p in gh_repo_releases() %}
      <div class="release label-latest">
        <div class="release-meta">
          <ul class="tag-references">
            <li>
              <a href="{{p.html_url}}" class="css-truncate">
                <svg aria-hidden="true" class="octicon octicon-tag" height="16" version="1.1" viewBox="0 0 14 16" width="14"><path d="M6.73 2.73c-0.47-0.47-1.11-0.73-1.77-0.73H2.5C1.13 2 0 3.13 0 4.5v2.47c0 0.66 0.27 1.3 0.73 1.77l6.06 6.06c0.39 0.39 1.02 0.39 1.41 0l4.59-4.59c0.39-0.39 0.39-1.02 0-1.41L6.73 2.73zM1.38 8.09c-0.31-0.3-0.47-0.7-0.47-1.13V4.5c0-0.88 0.72-1.59 1.59-1.59h2.47c0.42 0 0.83 0.16 1.13 0.47l6.14 6.13-4.73 4.73L1.38 8.09z m0.63-4.09h2v2H2V4z"></path></svg>
                <span class="css-truncate-target">{{p.tag_name}}</span>
              </a>
            </li>
            <!--
            <li>
              <a href="/Jamling/Android-ORM/commit/7754491c069cbb7362173659c24278d589fad8a5">
                <svg aria-hidden="true" class="octicon octicon-git-commit" height="16" version="1.1" viewBox="0 0 14 16" width="14"><path d="M10.86 7c-0.45-1.72-2-3-3.86-3s-3.41 1.28-3.86 3H0v2h3.14c0.45 1.72 2 3 3.86 3s3.41-1.28 3.86-3h3.14V7H10.86zM7 10.2c-1.22 0-2.2-0.98-2.2-2.2s0.98-2.2 2.2-2.2 2.2 0.98 2.2 2.2-0.98 2.2-2.2 2.2z"></path></svg>
                7754491
              </a>
            </li>-->
            <li>
	      <svg aria-hidden="true" x="0px" y="0px" viewBox="0 0 41.301 41.301" width="16" height="16" style="enable-background:new 0 0 41.301 41.301;">
	<path d="M20.642,0c5.698,0,10.857,2.317,14.602,6.047c3.73,3.746,6.047,8.905,6.047,14.603
	c0,5.698-2.317,10.857-6.047,14.603c-3.746,3.73-8.904,6.047-14.602,6.047S9.786,38.983,6.056,35.253
	C2.31,31.507,0.008,26.349,0.008,20.65c0-5.698,2.301-10.857,6.047-14.603C9.786,2.317,14.944,0,20.642,0L20.642,0z M31.166,19.523
	c0.619,0,1.111,0.508,1.111,1.127c0,0.619-0.492,1.127-1.111,1.127H20.674h-0.032c-0.413,0-0.778-0.238-0.968-0.571l-0.016-0.016
	l0,0l-0.016-0.032l0,0v-0.016l0,0l-0.016-0.032l0,0l-0.016-0.032l0,0v-0.016l0,0l-0.016-0.032l0,0l-0.016-0.016l0,0v-0.032l0,0
	l-0.016-0.032l0,0v-0.016l0,0l-0.016-0.032l0,0v-0.032l0,0v-0.016v-0.016l-0.016-0.016l0,0v-0.032l0,0v-0.032l0,0V20.73l0,0v-0.016
	l0,0v-0.032l0,0V20.65l0,0V7.206c0-0.619,0.492-1.111,1.111-1.111c0.619,0,1.127,0.492,1.127,1.111v12.317H31.166z M33.657,7.635
	c-3.333-3.333-7.936-5.381-13.015-5.381S10.96,4.301,7.627,7.635C4.31,10.968,2.246,15.571,2.246,20.65
	c0,5.079,2.063,9.682,5.381,13.016c3.333,3.333,7.936,5.381,13.015,5.381s9.682-2.048,13.015-5.381
	c3.333-3.333,5.397-7.936,5.397-13.016C39.054,15.571,36.991,10.968,33.657,7.635L33.657,7.635z"/>
	      </svg>
              <span>{{gh_time(p.published_at)}}</span>
            </li>
          </ul>
        </div><!-- /.meta -->

  <div class="release-body commit open">
    <div class="release-header">
      <h1 class="release-title">
        <a href="#">{{p.name}}</a>
        <a name="{{p.tag_name}}"></a>
      </h1>
      <p class="release-authorship">
        <img alt="@{{p.author.login}}" class="avatar" src="https://avatars2.githubusercontent.com/u/{{p.author.id}}?v=3&amp;s=40" height="20" width="20">
        <a href="{{p.author.html_url}}">{{p.author.login}}</a>
        released this
          <relative-time datetime="{{p.publish_at}}">on {{gh_time(p.published_at)}}</relative-time>
      </p>
    </div>

      <div class="markdown-body">
         {{markdown(p.body)}}
      </div>

      <h2 class="release-downloads-header">Downloads</h2>
      <ul class="release-downloads">
          {% for d in p.assets %}
          <li>
            <a href="{{d.browser_download_url}}" rel="nofollow">
              <small class="text-muted right">{{gh_file_size(d.size)}}</small>
              <svg aria-hidden="true" class="octicon octicon-package text-muted" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path d="M0 4.27v7.47c0 0.45 0.3 0.84 0.75 0.97l6.5 1.73c0.16 0.05 0.34 0.05 0.5 0l6.5-1.73c0.45-0.13 0.75-0.52 0.75-0.97V4.27c0-0.45-0.3-0.84-0.75-0.97L7.75 1.56c-0.16-0.03-0.34-0.03-0.5 0L0.75 3.3c-0.45 0.13-0.75 0.52-0.75 0.97z m7 9.09L1 11.77V5l6 1.61v6.75zM1 4l2.5-0.67 6.5 1.73-2.5 0.67L1 4z m13 7.77L8 13.36V6.61l2-0.55v2.44l2-0.53V5.53l2-0.53v6.77zM12 4.53L5.5 2.8l2-0.53 6.5 1.73-2 0.53z"></path></svg>
              <strong>{{d.name}}</strong> ({{d.download_count}} downloads)
            </a>
          </li>
          <li>
            <a href="https://github.com/{{gh.user}}/{{gh.repo}}/archive/{{p.tag_name}}.zip" rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-file-zip text-muted" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M8.5 1H1C0.45 1 0 1.45 0 2v12c0 0.55 0.45 1 1 1h10c0.55 0 1-0.45 1-1V4.5L8.5 1z m2.5 13H1V2h3v1h1v-1h3l3 3v9zM5 4v-1h1v1h-1z m-1 0h1v1h-1v-1z m1 2v-1h1v1h-1z m-1 0h1v1h-1v-1z m1 2v-1h1v1h-1z m-1 1.28c-0.59 0.34-1 0.98-1 1.72v1h4v-1c0-1.11-0.89-2-2-2v-1h-1v1.28z m2 0.72v1H4v-1h2z"></path></svg>
              <strong>Source code</strong> (zip)
            </a>
          </li>
          {%- endfor %}
      </ul>

  </div><!-- /.release-body -->
  {%- endfor %}
</div><!-- /.release -->
</div>
    <div>
      <nav>{{ nova_paginator2() }}</nav>
      {{ partial('../partial/donate') }}
      {{ partial('../partial/comment') }}
    </div>
  </div>
  <!-- aside -->
  <div id="article-toc" role="complementary" class="col-sx-2 col-sm-2 col-md-2 col-lg-2">
    <aside> 
      <nav id="toc" class="hidden-print hidden-xs hidden-sm well" data-spy="affix">
        <h4 class="toc-title"><a role="button" data-toggle="collapse" href="#toc-body" aria-expanded="true">
          {{ __('page.contents') }}
        </a></h4>
        {# nova_toc(page.content, {class:'nav toc-ul', deep: 6, expand:6}) #}
        <ul class="nav toc-ul">
        {%- for p in gh_repo_releases() %}
          <li><a href="#{{p.tag_name}}">{{p.name}}</a></li>
        {%- endfor %}
        </ul>
        <footer class="toc-footer">
          <a role="button" href="#" id="article-toc-top">{{ __('page.back_to_top') }}</a>
        </footer>
      </nav>
    </aside>
  </div>
</div>
</div>
