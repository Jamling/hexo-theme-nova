
<div class="container container-fluid">
  <div class="col-sx-12 col-sm-8 col-md-9 col-lg-9">
    {% if is_home() %}
    {{ partial('post/index') }}
    {% elseif is_archive() || is_category() || is_tag() %}
    {{ partial('post/archive') }}
    {% elseif is_post() %}
    {% set show_toc = theme.toc.post && page.toc %}
    {{ partial('post/post', {post: page}) }}
    {% endif %}
  </div>
  <!-- aside -->
  <div class="col-sx-6 col-sm-4 col-md-3 col-lg-3">
    <aside>
      {%- if show_toc %}
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
      {% else %}
      {% for widget in theme.post_widgets %}
      {# partial('post/widget_' + widget) #}
      {% endfor %}
      {%- endif %}
    </aside>
  </div>
</div>