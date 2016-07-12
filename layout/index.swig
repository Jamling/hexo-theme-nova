<div class="container container-fluid">
  <div class="row">
  <div class="{{theme.layout.index.main}}">
    {% if is_home() %}
    {{ partial('post/index') }}
    {% elseif is_archive() || is_category() || is_tag() %}
    {{ partial('post/archive') }}
    {% elseif is_post() %}
    {% set show_toc = theme.toc.post || page.toc %}
    {{ partial('post/post', {post: page}) }}
    {% endif %}
  </div>
  <!-- aside -->
  <div class="{{theme.layout.index.widgets}}">
    <aside>
      {%- if show_toc %}
      <!-- toc -->
      {% else %}
      {% for widget in theme.post_widgets %}
      {{ partial('post/widget_' + widget) }}
      {% endfor %}
      {%- endif %}
    </aside>
  </div>
</div>
</div>