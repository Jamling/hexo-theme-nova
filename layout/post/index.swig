
<div itemscope="itemscope" itemtype="http://schema.org/Blog" style="display: none;">
    <meta content="{{__(site.name) }}" itemprop="name"/>
</div>
<main>
        {%- for post in page.posts %} {%- set u = page_new(post) %}
          <div class="card index-card hoverable animated fadeInUp" itemscope itemtype="http://schema.org/BlogPosting">
            <div class="card-content">
              <h3 class="card-title {%- if u  %} new{%- endif %}"><a itemprop="name headline" href="{{ url_for_lang(post.path) }}" class="article-title" {%- if u %} title="{{__('page.last_updated', date(post.updated)) }}" {%- endif %}>{{ post.title }}</a></h3>
              <div class="divider"></div>
              <div class="section post-header clearfix">
                <!-- sub element must be span -->
                <span class="post-date"><time class="icon nova-calendar" itemprop="datePublished" datetime="{{ date_xml(post.date) }}">{{ time_tag(post.date) }}</time></span>
                {{ post_cates(post) }}
                {{ post_tags(post) }}
              </div>
              <div class="divider"></div>
              <div class="nova-flex excerpt-box">
              
              <div class="excerpt" itemprop="description articleBody">
              {{ page_excerpt(post) }}
              </div>
              </div>
            </div>
            <div class="divider"></div>

            <div class="card-action" data-tkey="{{page_uid(post)}}">
              <a class="icon nova-bubbles action-item" href="{{ url_for_lang(post.path) }}#comment"><span class="count"></span><span class="hidden-xs">{{__('sns.comment')}}</span></a>
              <a class="icon nova-eye action-item" href="{{ url_for_lang(post.path) }}"><span class="count"></span><span class="hidden-xs">{{__('article.views')}}</span></a>
              <a class="icon nova-hand-right action-item" href="{{ url_for_lang(post.path) }}" ><span>{{__('page.more')}}</span></a>
            </div>
            <meta itemprop="url" content="{{ post.permalink }}">
            <meta itemprop="dateModified" content="{{ date_xml(post.updated) }}">
            <span itemprop="author publisher" itemscope="itemscope" itemtype="http://schema.org/Organization">
              <meta content="{{ config.url }}" itemprop="url">
              <meta content="{{__('site.title')}}" itemprop="name">
              <meta content="/image/logo.png" itemprop="logo">
            </span>
          </div>
        {%- endfor %}
</main>
    <nav> {{ nova_paginator({total:page.total, class:'pagination'}) }} </nav>


    {#partial('index_script_changyan')#}
    {#partial('index_script_lc')#}
