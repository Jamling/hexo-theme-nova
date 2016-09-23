<a name="comment"></a>
{%- if theme.comments.enable %}
{{ partial('comment_' + theme.comments.using)}}
{%- endif %}
