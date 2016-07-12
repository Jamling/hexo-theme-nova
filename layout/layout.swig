<!DOCTYPE html>
<html lang="{{ page.lang }}">
<head>
  <meta charset="utf-8">
  <title>{{ head_title() }}</title>
  <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="keywords" content="{{ head_keywords() }}">
  <meta name="description" content="{{ head_description() }}"> 
  <!-- Canonical links -->
  <link rel="canonical" href="{{ url }}">
  <!-- Alternative links -->
  {# if page.layout == 'page' or page.layout == 'index' #}
  {%- for lang in site.data.languages %}
  <link rel="alternative" hreflang="{{ loop.key }}" href="{{ canonical_url(loop.key) }}">
  {%- endfor %}
  {# endif #}
  <!-- CSS -->
  <!-- build:css build/css/navy.css -->
  {#{ css('css/navy')--> }#}
  <!-- endbuild -->
  {{ head_jscss() }}
  
  <!-- RSS -->
  {{ feed_tag('atom.xml') }}
  <script>
    //$.material.init();
  </script>
</head>
<body>
  <!-- header -->
  {{ partial('partial/header') }}
  <!-- main -->
  {{ body }}
  <!-- footer -->
  {{ partial('partial/footer') }}
  <!-- fixed action bar -->
  {{ partial('partial/fab') }}
  <!-- after footer, some 3rd script place here -->
    {{ js('js/script.js')}}
    {{ partial('partial/baidu_analytics') }}
    {{ partial('partial/jiathis_share') }}
</body>
</html>