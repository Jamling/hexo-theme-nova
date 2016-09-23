{% block content %}
  {{ page.content }}
{% endblock %}

<div class="container page-footer">
  <div style="margin: 1em 0">
  {{ partial('../partial/share_jiathis_footer') }}
  </div>
  <div class="divider"></div>
  {{ partial('../partial/donate') }}
  {{ partial('../partial/comment') }}
</div>
