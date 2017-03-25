{%- for widget in theme.post_widgets %}
{{ partial('widget_' + widget) }}
{%- endfor %}
{%- if theme.post_widgets%}
<script type="text/javascript" charset="utf-8" src="https://changyan.itc.cn/js/lib/jquery.js"></script>
<script type="text/javascript" charset="utf-8" src="https://changyan.sohu.com/js/changyan.labs.https.js?appid={{theme.comments.changyan.appid}}"></script>
{%- endif %}
