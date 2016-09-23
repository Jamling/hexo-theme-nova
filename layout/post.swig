
<div class="container container-fluid">
<div class="row">
  <div class="{{theme.layout.index.main}}">
    {%- block page-main %}
    {%- if is_home() %}
    {{ partial('post/index') }}
    {%- elseif is_archive() || is_category() || is_tag() %}
    {{ partial('post/archive') }}
    {%- elseif is_post() %}
    {{ partial('post/article', {layout_type: 'post'}) }}
    {%- endif %}
    {%- endblock %}
  </div> <!-- end main column  -->
  <!-- aside -->
  <div class="{{theme.layout.index.widgets}}">
    <aside>
      {%- block page-widget %}
      {%- if page_toc() %}
      {{ partial('./partial/toc', {style: theme.layout.index.widgets}) }}
      {%- endif %}
      {%- endblock %}
    </aside>
  </div> <!-- end aside column  -->
</div> <!-- end row -->
</div> <!-- end container -->
