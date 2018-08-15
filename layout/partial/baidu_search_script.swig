<!-- 新建的搜索框代码，建立使用你自己的代码替换-->
{%- if theme.search.baidu.verified %}
<script type="text/javascript">
(function(){document.write(unescape('%3Cdiv id="bdcs"%3E%3C/div%3E'));var bdcs = document.createElement('script');bdcs.type = 'text/javascript';bdcs.async = true;bdcs.src = 'http://znsv.baidu.com/customer_search/api/js?sid={{theme.search.baidu.sid}}' + '&plate_url=' + encodeURIComponent(window.location.href) + '&t=' + Math.ceil(new Date()/3600000);var s = document.getElementsByTagName('script')[0];s.parentNode.insertBefore(bdcs, s);})();
</script>
{%- endif %}
