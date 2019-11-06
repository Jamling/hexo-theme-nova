{% if page.layout === 'post' || page.layout === 'project' || page.layout === 'page' || is_post() %}
<a id="share"></a>
<div class="social-share"></div>
<script>
with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='//cdnjs.cloudflare.com/ajax/libs/social-share.js/1.0.16/js/social-share.min.js'];
</script>
{% endif %}
