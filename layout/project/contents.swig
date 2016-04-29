<div class="container-fluid">
<div class="row">
  <div class="col-sx-2 col-sm-2 col-md-2 col-lg-2" role="navigation" style="padding-left:10px;">
    <aside>
      {% set prj_name = page.canonical_path.split('/')[1] %}
      {# partial('sidebar', {prj:site.data.projects[prj_name], name:prj_name}) #}
      <div id="project_tree"></div>
      {# css('//cdn.bootcss.com/bootstrap-treeview/1.2.0/bootstrap-treeview.min.css') #}
      {{ js('//cdn.bootcss.com/bootstrap-treeview/1.2.0/bootstrap-treeview.min.js')}}
      <script>
      $('#project_tree').treeview({
        enableLinks: true,
        color: '#428bca',
        expandIcon: 'glyphicon glyphicon-chevron-right',
        collapseIcon: 'glyphicon glyphicon-chevron-down',
        //levels: 3,
        //node-icon: '',
        //selectedColor: '#ff0000',
        onNodeSelected: function(event, data) {
          if (data.state.selected){
            return;
          }
        },
        data: {{ p_nav({parent_color:'#337ab7'}) }}
      });
      
      </script>
    </aside>
  </div>
  <div class="col-sx-12 col-sm-8 col-md-8 col-lg-8 article-container" id="article-container" data-spy="scroll" data-target="#toc" style="height:100%">
    <article itemscope itemtype="http://schema.org/Article">
      <header class="article-header">
        <h1 class="article-title" itemprop="name">{{ page.title }}</h1>
          <a href="{{ raw_link(page.source) }}" class="article-edit-link" title="{{ __('page.improve') }}"><i class="fa fa-pencil"></i></a>
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
    <aside> 
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
  </div>
</div>
</div>
