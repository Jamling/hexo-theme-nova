
<div itemscope="itemscope" itemtype="http://schema.org/Blog" style="display: none;">
    <meta content="{{__(site.name) }}" itemprop="name"/>
</div>
<main>
        {%- for post in page.posts %} {%- set u = page_new(post) %}
          <div class="card hoverable" itemprop="blogPost" itemscope="itemscope" itemtype="http://schema.org/BlogPosting">
            <div class="card-content">
              <h3 class="card-title {%- if u  %} new{%- endif %}" itemprop="name headline"><a href="{{ url_for_lang(post.path) }}" class="article-title" {%- if u %} title="{{__('page.last_updated', date(post.updated)) }}" {%- endif %}>{{ post.title }}</a></h3>
              <div class="divider"></div>
              <div class="section post-header clearfix">
                <!-- sub element must be span -->
                <span class="post-date"><time class="icon nova-calendar" itemprop="datePublished" datetime="{{ date_xml(post.date) }}">{{ time_tag(post.date) }}</time></span>
                {{ post_cates(post) }}
                {{ post_tags(post) }}
              </div>
              <div class="divider"></div>
              <div class="excerpt" itemprop="description articleBody">
              {{ page_excerpt(post) }}
              </div>
            </div>
            <div class="divider"></div>
            {{partial('index_action_ds')}}
            <meta content="{{ post.permalink }}" itemprop="url">
            <meta content="{{ date_xml(post.updated) }}" itemprop="dateModified">
          </div>
        {%- endfor %}
</main>
    <nav> {{ nova_paginator({total:page.total, class:'pagination'}) }} </nav>

    {{partial('index_share_jiathis')}}

    {{partial('index_script_changyan')}}
    {{partial('index_script_lc')}}
  {%- if theme.comments.using === 'duoshuo' %}
    <!--多说js加载开始，一个页面只需要加载一次 -->
    <script type="text/javascript">
    var duoshuoQuery = {short_name:"{{theme.comments.duoshuo.short_name}}"};
    (function() {
        var ds = document.createElement('script');
        ds.type = 'text/javascript';ds.async = true;
        ds.src = 'http://static.duoshuo.com/embed.js';
        ds.charset = 'UTF-8';
        (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(ds);
    })();
    </script>
    <!--多说js加载结束，一个页面只需要加载一次 -->
  {%- elseif theme.comments.using === 'changyan' %}

  {%- endif %}
