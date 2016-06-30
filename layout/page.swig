{% if page.type === 'categories' %}
{{ partial('page/categories', {}) }}
{% elseif page.type === 'donates' %}
{{ partial('page/donates', {}) }}
{% else %}
<div class="container container-fluid">
  <div class="row">
    <div id="content-inner" class="col-sx-12 col-sm-8 col-md-9 col-lg-9 col s12 m8 l9">
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
      {%- if page.prev||page.next %}
	<nav class="nonebar noborder">{{ nova_paginator2() }}</nav>
  {%- endif %}
	{{ partial('./partial/donate') }}
	{{ partial('./partial/comment') }}
      </div>
    </div>
    
        <div class="col-sx-6 col-sm-4 col-md-3 col-lg-3 col hidden-xs m4 l3">
          <aside>
          {{ partial('./partial/toc', {style: 'col m4 l3'}) }}
          </aside>
        </div>
    </div>
  </div>
</div>
{% endif %}
