{%- if theme.analytics.enable %}
{{ partial('analytics_'  + theme.analytics.using) }}
{%- endif %}