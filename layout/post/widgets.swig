{%- for widget in theme.post_widgets %}
{{ partial('widget_' + widget) }}
{%- endfor %}
{%- if theme.post_widgets%}
{%- endif %}
