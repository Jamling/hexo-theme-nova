{% if page.gh %}
  {% set gh = gh_opts() %}
  {% if gh.type === 'get_contents' %} 
    {% set page.content = gh_contents(gh) %}
    {{ partial('project/contents', {} )}}
  {% elseif gh.type === 'get_repos' %}
    {{ partial('project/projects', {} )}}
  {% elseif gh.type === 'get_releases' %}
    {{ partial('project/releases', {} )}}
  {% endif %}
{% else %}
  {{ partial('project/contents', {} )}}
{% endif %}