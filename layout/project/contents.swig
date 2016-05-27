<div class="container-fluid">
<div class="row">
  <div class="col-sx-2 col-sm-2 col-md-2 col-lg-2" role="navigation">
    {{ partial('sidebar', {}) }}
  </div>
  <div class="col-sx-12 col-sm-8 col-md-8 col-lg-8 article-container" id="article-container">
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
      <nav>{{ nova_paginator2() }}</nav>
      {{ partial('../partial/donate') }}
      {{ partial('../partial/comment') }}
    </div>
  </div>
  <!-- aside -->
  <div id="article-toc" role="complementary" class="col-sx-2 col-sm-2 col-md-2 col-lg-2">
  {%- if page_toc() %}
    <aside id="navbar-toc">
      <nav id="toc" class="hidden-print hidden-xs hidden-sm well" data-spy="affix">
        <h4 class="toc-title"><a role="button" data-toggle="collapse" href="#toc-body" aria-expanded="true">
          {{ __('page.contents') }}
        </a></h4>
        {{ nova_toc(page.content, {class:'nav toc-ul', deep: 6, expand:6}) }}
        <footer class="toc-footer">
          <a role="button" href="#" id="article-toc-top">{{ __('page.back_to_top') }}</a>
        </footer>
      </nav>
    </aside>
      <script>
      $('body').scrollspy({ target: '#navbar-toc' });
      </script>
  {%- endif %}
  </div>
</div>
</div>
