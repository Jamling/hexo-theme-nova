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
  <!-- CSS and JS-->
  {{ head_jscss() }}
  <!-- RSS -->
  {{ feed_tag('atom.xml') }}
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
    {# partial('partial/share_jiathis') #}
    <!--  baidu search  -->
    <script type="text/javascript">(function(){document.write(unescape('%3Cdiv id="bdcs"%3E%3C/div%3E'));var bdcs = document.createElement('script');bdcs.type = 'text/javascript';bdcs.async = true;bdcs.src = 'http://znsv.baidu.com/customer_search/api/js?sid=14175568865013380132' + '&plate_url=' + encodeURIComponent(window.location.href) + '&t=' + Math.ceil(new Date()/3600000);var s = document.getElementsByTagName('script')[0];s.parentNode.insertBefore(bdcs, s);})();</script>
    
</body>
</html>