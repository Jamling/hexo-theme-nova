{%- if page.type %}
{{ partial('page/' + page.type, {}) }}
{%- else %}
<div class="container container-fluid">
  <div class="row">
    <div class="{{theme.layout.page.main}}">
      {{ partial('./page/article', {layout_type: 'page'}) }}
    </div><!-- end main column -->
    <div class="{{theme.layout.page.toc}}">
      {{ partial('./partial/toc') }}
    </div><!-- end aside -->
  </div><!--  end row -->
</div>
{%- endif %}
