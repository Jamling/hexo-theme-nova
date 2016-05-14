{% if page.type === 'categories' %}
{{ partial('page/categories', {}) }}
{% elseif page.type === 'donates' %}
{{ partial('page/donates', {}) }}
{% else %}
<div class="container container-fluid">
  <div class="row">
    <div id="content-inner" class="col-sx-12 col-sm-8 col-md-9 col-lg-9">
      <article class="article page" itemscope itemtype="http://schema.org/Article">
              <header class="article-header">
                <h1 class="article-title" itemprop="name">{{ page.title }}</h1>
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
	{{ partial('./partial/donate') }}
	{{ partial('./partial/comment') }}
      </div>
    </div>
    
        <div class="col-sx-6 col-sm-4 col-md-3 col-lg-3">
          <aside id="article-toc" role="navigation">
            {%- if page_toc() %}
            <nav id="toc" class="hidden-print hidden-xs hidden-sm well" data-spy="affix">
              <h4 class="toc-title"><a role="button" data-toggle="collapse" href="#toc-body" aria-expanded="true">
                {{ __('page.contents') }}
              </a></h4>
              <div id="toc-body">
              {{ nova_toc(page.content, {class:'nav toc-ul', deep: 6, expand:6}) }}
              </div>
              <footer class="toc-footer">
                <a role="button" href="#" id="article-toc-top">{{ __('page.back_to_top') }}</a>
              </footer>
            </nav>
            <script>
            $('body').scrollspy({ target: '#article-toc' });
            </script>
            {%- endif %}
          </aside>
        </div>
    </div>
  </div>
</div>
{% endif %}
