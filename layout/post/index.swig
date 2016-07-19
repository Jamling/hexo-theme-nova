<main>
        {%- for post in page.posts %}
          <div class="card hoverable">
            <div class="card-content">
              <h3 class="card-title"><a href="{{ url_for_lang(post.path) }}" class="article-title">{{ post.title }}</a></h3>
              <div class="divider"></div>
              <div class="section post-header">
                <!-- sub element must be span -->
                <span class="icon nova-calendar">{{ time_tag(post.date) }}</span>
                {{ post_cates(post) }} 
                {{ post_tags(post) }}
              </div>
              <div class="excerpt">
              {{ page_excerpt(post) }}
              </div>
            </div>
            <div class="divider"></div>
            {{partial('index_action_ds')}}
          </div>
        {%- endfor %}


    <nav> {{ nova_paginator({total:page.total, class:'pagination'}) }} </nav>
    {{partial('index_share_jiathis')}}
    {{partial('index_script_ds')}}