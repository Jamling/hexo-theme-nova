<div id="navbar-toc">
      <nav id="toc" class="hidden-print hidden-xs hidden-sm" data-spy="affix">
        <div class="toc-title"><a role="button" data-toggle="collapse" href="#toc-body" aria-expanded="true">
          {{ __('page.contents') }}
        </a></div>
        <div id="toc-body" class="in">
        {%- if content %}
        {{ content }}
        {%- else %}
        {{ nova_toc(page.content, {class:'nav toc-ul', deep: 6, expand:6}) }}
        {%- endif %}
        </div>
      </nav>
</div>
