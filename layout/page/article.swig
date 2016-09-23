{{ page_encrypt(page, {dom:'.article-content'}) }}
<article class="article {{layout_type}}" itemscope="itemscope" itemtype="http://schema.org/Article">
  <header class="article-header">
    {%- block article-header %}
    <h1 class="article-title" itemprop="name headline">
      {{ page_title() }}
      {%- if page.gh %}
      <a href="{{ gh_edit(page.gh) }}" class="article-edit-link" title="{{ __('page.improve') }}"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
      {%- endif %}
    </h1>
    {%- endblock %}
    <meta content="{{ date_xml(page.date) }}" itemprop="datePublished">
  </header>
  <div class="article-content" itemprop="articleBody">
  {% block content %}
    {{ page.content }}
  {% endblock %}
  </div>

  {{js('/js/decrypt.min.js')}}
  <footer class="article-footer">
    <time class="article-footer-updated" datetime="{{ date_xml(page.updated) }}" itemprop="dateModified">
    {{__('page.last_updated', date(page.updated)) }}
    </time>
    <span itemprop="author publisher" itemscope="itemscope" itemtype="http://schema.org/Organization">
      <meta content="{{ config.url }}" itemprop="url">
      <meta content="{{__('site.title')}}" itemprop="name">
      <meta content="/image/logo.png" itemprop="logo">
    </span>
    {{ partial('../partial/share_jiathis_footer') }}
  </footer>
</article>
{% block page-footer %}
<div class="page-footer">
  <nav>{{ nova_paginator2() }}</nav>
  {{ partial('../partial/donate') }}
  {{ partial('../partial/comment') }}
</div>
{% endblock %}
