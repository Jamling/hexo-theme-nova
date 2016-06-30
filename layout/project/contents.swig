<div class="container-fluid">
<div class="row">
  <div class="col s12 m2 l2" role="navigation">
    {{ partial('sidebar', {}) }}
  </div>
  <div class="col s12 m8 l8 article-container" id="article-container">
    <article class="article project" itemscope itemtype="http://schema.org/Article">
      <header class="article-header">
        <h1 class="article-title" itemprop="name">{{ page_title() }}
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
        <time class="article-footer-updated" datetime="{{ date_xml(page.updated) }}" itemprop="dateModified">{{ __('page.last_updated', date(page.updated)) }}</time>
      </footer>
    </article>
    <div>
      <nav class="nonbar noborder">{{ nova_paginator2() }}</nav>
      {{ partial('../partial/donate') }}
      {{ partial('../partial/comment') }}
    </div>
  </div>
  <!-- aside -->
  <div class="col hide-on-small-only m2 l2">
    {{ partial('../partial/toc', {style: 'col m4 l3'}) }}
  </div>
</div>
</div>
