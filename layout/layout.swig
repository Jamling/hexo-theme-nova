<!DOCTYPE html>
<html lang="{{ page.lang }}">
{{ partial('partial/head') }}
<body>
  <!-- header -->
  {{ partial('partial/header') }}
  {{ body }}
  <hr style="color:#f00;">
  <div class="container">
    <p class="text-center">
    {{ partial('partial/footer') }}
    </p>
  </div>
    {{ partial('partial/baidu_analytics') }}
    {{ partial('partial/baidu_share') }}
<script type="text/javascript">(function(){document.write(unescape('%3Cdiv id="bdcs"%3E%3C/div%3E'));var bdcs = document.createElement('script');bdcs.type = 'text/javascript';bdcs.async = true;bdcs.src = 'http://znsv.baidu.com/customer_search/api/js?sid=14175568865013380132' + '&plate_url=' + encodeURIComponent(window.location.href) + '&t=' + Math.ceil(new Date()/3600000);var s = document.getElementsByTagName('script')[0];s.parentNode.insertBefore(bdcs, s);})();</script>
</body>
</html>