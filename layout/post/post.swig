<article class="article post" itemscope itemtype="http://schema.org/Article">
  <header class="article-header">
    {% if is_post() %}
      <h1 class="article-title" itemprop="name">{{ post.title }}</h1>
    {% else %}
      <h1>
        <a href="{{ url_for(post.path) }}" class="article-title" itemprop="name">{{ post.title }}</a>
      </h1>
    {% endif %}
    <a href="{{ url_for(post.path) }}" class="article-date">{{ time_tag(post.date) }}</a>
  </header>
  <div class="article-content" itemprop="articleBody" id="post-content">
    {{ post.content }}
  </div>
  <footer class="article-footer">
    <!--<time class="article-footer-updated" datetime="{{ date_xml(page.updated) }}" itemprop="dateModified">{{ __('page.last_updated', date(page.updated)) }}</time>-->
  </footer>
</article>
<div>
  <nav>{{ nova_paginator2({show_name: true}) }}</nav>
  {{ partial('../partial/donate') }}
  {{ partial('../partial/comment') }}
</div>
