<!DOCTYPE html>
<html lang="{{ page.lang }}">
{{ partial('partial/head') }}
<body>
  <!-- header -->
  {{ partial('partial/header') }}
  {{ body }}
  <div class="divider"></div>
  <div class="container">
    <p class="text-center">
    {{ partial('partial/footer') }}
    </p>
  </div>
    {{ partial('partial/top') }}
    {{ partial('partial/baidu_analytics') }}
    {{ partial('partial/jiathis_share') }}
    {{ js('js/script.js')}}
</body>
</html>