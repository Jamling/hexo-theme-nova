{% if page.comments && theme.comments.valine %}
<script src="//unpkg.com/valine/dist/Valine.min.js">
</script>
<!--PC和WAP自适应版-->
<div id="vcomments" data-sid="{{ page_uid() }}" ></div>
<script>
    new Valine({
        av: AV,
        el: '#vcomments',
        appId: '{{theme.comments.valine.app_id}}',
        appKey: '{{theme.comments.valine.app_key}}',
        path: '{{page.path || page.permalink}}',
        recordIP: true,
        visitor: {{theme.comments.valine.visitor}}
    })
</script>
{% endif %}
