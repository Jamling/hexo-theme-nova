{%- if page.type === 'categories' %}
{{ partial('page/categories', {}) }}
{%- elseif page.type === 'donates' %}
{{ partial('page/donates', {}) }}
{%- else %}
<div class="container container-fluid">
  <div class="row">
    <div class="{{theme.layout.page.main}}">
      {{ partial('./page/article') }}
    </div>
    <div class="{{theme.layout.page.toc}}">
      {{ partial('./partial/toc') }}
    </div>
  </div><!--  end row -->
</div>
{%- endif %}
