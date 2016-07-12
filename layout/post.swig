
<div class="container container-fluid">
<div class="row">
  <div class="{{theme.layout.index.main}}">
    {% if is_home() %}
    {{ partial('post/index') }}
    {% elseif is_archive() || is_category() || is_tag() %}
    {{ partial('post/archive') }}
    {% elseif is_post() %}
    {% set show_toc = theme.toc.post && page.toc %}
    {{ partial('post/article', {post: page}) }}
    {% endif %}
  </div>
  <!-- aside -->
  <div class="{{theme.layout.index.widgets}}">
    <aside>
      {%- if page_toc() %}
      {{ partial('./partial/toc', {style: theme.layout.index.widgets}) }}
      {%- endif %}
    </aside>
  </div>
</div>
</div>