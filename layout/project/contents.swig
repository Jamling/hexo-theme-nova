<div class="container-fluid">
<div class="row">
  <div class="{{theme.layout.p.sidebar}}" role="navigation">
    {{ partial('sidebar', {}) }}
  </div>
  <div class="{{theme.layout.p.main}}">
    {{ partial('../page/article') }}
  </div>
  <!-- aside -->
  <div class="{{theme.layout.p.toc}}">
  {%- if page_toc() %}
  {{ partial('../partial/toc', {style: 'col m4 l3'}) }}
  {%- endif %}
  </div>
</div>
</div>
