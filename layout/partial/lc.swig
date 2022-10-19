{%- if theme.lc && theme.lc.enable %}
<script>
{%- if is_home() %}
  /* 列表中的阅读数 */
  lc.countCounter({
      index: true
  });
  /* 首页阅读数 */
  lc.countCounter({
      selector: '.home-count',
      subSelector: '.count-home'
  });
{%- else %}
  lc.countCounter({});
{%- endif %}
  lc.countComment({
    index: {{is_home()}}
  });
</script>
{%- endif %}