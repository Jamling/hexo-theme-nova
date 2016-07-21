<article class="article page" itemscope itemtype="http://schema.org/Article">
  <header class="article-header">
    <h1 class="article-title" itemprop="name">
      {{ page.title }}
      {%- if page.gh %}
      <a href="{{ gh_edit(page.gh) }}" class="article-edit-link" title="{{ __('page.improve') }}"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
      {%- endif %}
    </h1>
  </header>
  <div class="article-content" itemprop="articleBody">
  {% block content %}
    {{ page.content }}
  {% endblock %}
  </div>
  <footer class="article-footer">
    <time class="article-footer-updated" datetime="{{ date_xml(page.updated) }}" itemprop="dateModified">
    {{__('page.last_updated', date(page.updated)) }}
    </time>
    {{ partial('../partial/share_jiathis_footer') }}
  </footer>
</article>
<div>
  <nav>{{ nova_paginator2() }}</nav>
  {{ partial('../partial/donate') }}
  {{ partial('../partial/comment') }}
</div>
