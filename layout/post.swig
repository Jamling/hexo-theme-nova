<div class="container container-fluid">
<div class="row">
  <div class="col s12 m8 l9">
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
  <div class="col hide-on-small-only m4 l3">
    <aside>
      {%- if page_toc() %}
      {{ partial('./partial/toc', {style: 'col m4 l3'}) }}
      {%- endif %}
    </aside>
  </div>
</div>
</main>