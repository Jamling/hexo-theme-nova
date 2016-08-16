{%- set og_type = 'website' %}
{%- if is_post() %} {% set og_type = 'article' %} {%- endif %}

  <meta name="og:type" content="{{ og_type }}">
  <meta name="og:site_name" content="{{ site_name() }}">
  <meta name="og:image" content="{{ config.url + '/image/logo.png' }}">
  <meta name="og:title" content="{{ page_title(page, true) }}">
  <meta name="og:url" content="{{ page.permalink || config.url + url_for(page.path) }}">
  <meta name="og:description" content="{{ head_description() }}">

  <meta name="twitter:card" content="summary">
  <meta name="twitter:site" content="{{ site_name() }}">
  <meta name="twitter:image" content="{{ config.url + '/image/logo.png' }}">
  <meta name="twitter:title" content="{{ page_title(page, true) }}">
  <meta name="twitter:creator" content="@JamlingLi">
  <meta name="twitter:description" content="{{ head_description() }}">
