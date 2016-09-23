{%- extends 'post.swig' %}
{%- block page-widget %}
{%- for widget in theme.post_widgets %}
{{ partial('post/widget_' + widget) }}
{%- endfor %}
{%- endblock %}
