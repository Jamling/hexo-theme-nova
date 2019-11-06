{% block content %}
  {{ page.content }}
{% endblock %}

<div class="container page-footer">
  <div style="margin: 1em 0">
  {%- if theme.share.footer.enable %}
  {{ partial('../partial/' + theme.share.footer.layout)}}
  {%- endif %}
  </div>
  <div class="divider"></div>
  {{ partial('../partial/donate') }}
  {{ partial('../partial/comment') }}
</div>
