{% if page.comments && theme.comments.uyan %}
<!-- UY BEGIN -->
<div id="uyan_frame"></div>
<script>
var uyan_config = {
     title: '{{page.title}}',
     //'url':'',
     //'pic':'自定义图片链接地址，设置为空值则不分享图片',
     //'vid':'自定义视频链接地址',
     //'du':'ieclipse.cn',
     su: '{{ page_uid() }}'
};
</script>
<script type="text/javascript" src="//v2.uyan.cc/code/uyan.js?uid={{theme.comments.uyan.uid}}"></script>
<!-- UY END -->
{% endif %}
