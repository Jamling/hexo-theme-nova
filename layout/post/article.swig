<article class="article post" itemscope itemtype="http://schema.org/Article">
  <header class="article-header">
    <div class="page-path"><span class="post-category">{{ page_path(post)}}</span></div>
    <div class="divider"></div>
      {%- if is_post() %}
      <h1 class="article-title" itemprop="name">{{ post.title }}</h1>
      {%- else %}
      <h1>
        <a href="{{ url_for_lang(post.path) }}" class="article-title" itemprop="name">{{ post.title }}</a>
      </h1>
      {%- endif %}
    <div class="post-header clearfix">
      <span class="icon nova-calendar"><span class="hidden-xs">{{__('page.written_on')}}</span>{{ time_tag(post.date) }}</span>
      {{ post_tags(post) }}
      <span class="post-share right">
        <a href="#share" class="icon nova-share"><span class="hidden-xs">{{__('sns.share')}}</span></a>
        <a href="#comment" class="icon nova-bubbles"><span class="hidden-xs">{{__('sns.comment')}}</span></a>
        <a href="#like" class="icon nova-heart2-full"><span class="hidden-xs">{{__('sns.like')}}</span></a>
      </span>
    </div>
    <div class="divider"></div>
  </header>
  <div class="article-content" itemprop="articleBody" id="post-content">
    {{ post.content }}
  </div>
  <footer class="article-footer">
    <time class="article-footer-updated" datetime="{{ date_xml(page.updated) }}" itemprop="dateModified">
        {{__('page.last_updated', '') }} <span class="{%- if date(post.date) != date(post.updated) %}red{%- endif %}">{{date(page.updated)}}</span>
    </time>
    {{ partial('../partial/share_jiathis_footer') }}
  </footer>
</article>
<div>
  <nav>{{ nova_paginator2({show_name: true}) }}</nav>
  {{ partial('../partial/donate') }}
  {{ partial('../partial/comment') }}
</div>
