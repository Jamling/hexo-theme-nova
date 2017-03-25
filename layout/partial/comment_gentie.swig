{% if page.comments && theme.comments.gentie %}
<div id="cloud-tie-wrapper" class="cloud-tie-wrapper"></div>
<script>
  var cloudTieConfig = {
    url: document.location.href,
    sourceId: "{{page_uid()}}",
    productKey: "{{theme.comments.gentie.productKey}}",
    target: "cloud-tie-wrapper"
  };
</script>
<script src="https://img1.cache.netease.com/f2e/tie/yun/sdk/loader.js"></script>
{% endif %}
