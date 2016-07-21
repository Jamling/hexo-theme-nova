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
    padding-left: 0.5em;
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
<div class="container-fluid">
<div class="row">
  <div class="{{theme.layout.p.sidebar}}" role="navigation" style="padding-left:10px;">
    {{ partial('sidebar', {}) }}
  </div>
  <div class="{{theme.layout.p.main}}" id="article-container">
    <div class="release-timeline">
      {% for p in gh_releases() %}
      <div class="release" >
        <div class="release-meta hidden-xs">
          <ul class="tag-references">
            <li>
                <span aria-hidden="true" class="icon nova-tag"></span>
                <span class="css-truncate-target"><a href="{{p.html_url}}" class="css-truncate">{{p.tag_name}}</a></span>
            </li>
            <li>
              <span class="icon nova-clock">{{gh_time(p.published_at)}}</span>
            </li>
          </ul>
        </div><!-- /.meta -->

        <div class="release-body">
        <div class="release-header">
          <h1 class="release-title" id="{{p.tag_name}}">
            <a href="#{{p.tag_name}}"></a>
            <a href="{{p.html_url}}"  title="{{p.tag_name}}">{{p.tag_name}}</a>
            {%- if p.name %}
            <small>({{p.name}})</small>
            {%- endif %}
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
        <div class="downloads">
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
              {%- endfor %}
              <li>
                <a href="https://github.com/{{gh.user}}/{{gh.repo}}/archive/{{p.tag_name}}.zip" rel="nofollow">
                  <svg aria-hidden="true" class="octicon octicon-file-zip text-muted" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M8.5 1H1C0.45 1 0 1.45 0 2v12c0 0.55 0.45 1 1 1h10c0.55 0 1-0.45 1-1V4.5L8.5 1z m2.5 13H1V2h3v1h1v-1h3l3 3v9zM5 4v-1h1v1h-1z m-1 0h1v1h-1v-1z m1 2v-1h1v1h-1z m-1 0h1v1h-1v-1z m1 2v-1h1v1h-1z m-1 1.28c-0.59 0.34-1 0.98-1 1.72v1h4v-1c0-1.11-0.89-2-2-2v-1h-1v1.28z m2 0.72v1H4v-1h2z"></path></svg>
                  <strong>Source code</strong> (zip)
                </a>
              </li>
          </ul>
        </div>
        </div><!-- /.release-body -->
      </div>
      {%- endfor %}
    </div><!--  end time line -->
    
    <div class="release-timeline">
        <div class="release-meta hidden-xs"></div>
        <div class="release-body">
          {{ partial('../partial/share_jiathis_footer') }}
          <nav>{{ nova_paginator2() }}</nav>
          {{ partial('../partial/donate') }}
          {{ partial('../partial/comment') }}
        </div>
    </div>
  </div>
  <!-- aside -->
  <div class="{{theme.layout.p.toc}}">
    {%- set html = gh_release_toc(gh_releases(), {class: 'nav toc-ul'}) %}
    {{ partial('../partial/toc', {content: html}) }}
  </div>
</div>
</div>
