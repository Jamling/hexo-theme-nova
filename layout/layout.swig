<!DOCTYPE html>
<html lang="{{ page.lang }}" prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# object: http://ogp.me/ns/object# article: http://ogp.me/ns/article# profile: http://ogp.me/ns/profile#">
<head>
  <meta charset="utf-8">
  <title>{{ head_title() }}</title>
  <meta http-equiv="X-UA-Compatible" content="IE=Edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="keywords" content="{{ head_keywords() }}">
  <meta name="description" content="{{ head_description() }}">
  {{ partial('partial/og') }}
  <!-- Canonical links -->
  <link rel="canonical" href="{{ url }}">
  <!-- Alternative links -->
  <!-- CSS and JS-->
  {{ head_jscss({js: true})}}
  <!-- RSS -->
  {{ feed_tag('atom.xml') }}
  <link rel="shortcut icon" href="/image/favicon.ico" type="image/x-icon" />
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
    <script>
    var hljs_labels = {
        left: "{{__('hljs.left')}}",
        right: "{{__('hljs.right')}}",
        copy: "{{__('hljs.copy')}}"
    }
    </script>
    {{ js('js/hljs.js') }}
    {{ js('js/script.js')}}
    {{ partial('partial/analytics') }}
    {{ partial('partial/lc') }}
</body>
</html>
