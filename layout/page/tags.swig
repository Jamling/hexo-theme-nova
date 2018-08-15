
<div class="container container-fluid">
<div class="row">
  <div class="{{theme.layout.index.main}}">
    {%- block page-main %}
    {{list_tags()}}
    {%- endblock %}
  </div> <!-- end main column  -->
  <!-- aside -->
  <div class="{{theme.layout.index.widgets}}">
    <aside>
    {%- block page-widget %}
    {{ partial('post/widgets') }}
    {%- endblock %}
    </aside>
  </div> <!-- end aside column  -->
</div> <!-- end row -->
</div> <!-- end container -->
