<div itemscope="itemscope" itemtype="http://schema.org/Blog" style="display: none;">
    <meta content="{{__(site.name) }}" itemprop="name"/>
</div>
<main>
        {%- for post in page.posts %}
          <div class="card hoverable" itemprop="blogPost" itemscope="itemscope" itemtype="http://schema.org/BlogPosting">
            <div class="card-content">
              <h3 class="card-title" itemprop="name headline"><a href="{{ url_for_lang(post.path) }}" class="article-title">{{ post.title }}</a></h3>
              <div class="divider"></div>
              <div class="section post-header">
                <!-- sub element must be span -->
                <span class="icon nova-calendar" itemprop="datePublished">
                  <time class="{%- if date(post.date) != date(post.updated) %}red{%- endif %}" datetime="{{ date_xml(post.date) }}">{{ time_tag(post.date) }}
                  </time>
                </span>
                {{ post_cates(post) }} 
                {{ post_tags(post) }}
              </div>
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


    <nav> {{ nova_paginator({total:page.total, class:'pagination'}) }} </nav>
    {{partial('index_share_jiathis')}}
    {{partial('index_script_ds')}}
    {{partial('index_script_lc')}}