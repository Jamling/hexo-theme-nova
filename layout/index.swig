<div class="container container-fluid">
  <div class="row">
  <div class="{{theme.layout.index.main}}">
    {% if is_home() %}
    {{ partial('post/index') }}
    {% elseif is_archive() || is_category() || is_tag() %}
    {{ partial('post/archive') }}
    {% elseif is_post() %}
    {% set show_toc = theme.toc.post || page.toc %}
    {{ partial('post/post', {post: page}) }}
    {% endif %}
  </div>
  <!-- aside -->
  <div class="{{theme.layout.index.widgets}}">
    <aside>
      {%- if show_toc %}
      <!-- toc -->
      {% else %}
      {% for widget in theme.post_widgets %}
      {{ partial('post/widget_' + widget) }}
      {% endfor %}
      {%- endif %}
    </aside>
  </div>
</div>
</div>
<!--多说js加载开始，一个页面只需要加载一次 -->
<script type="text/javascript">
var duoshuoQuery = {short_name:"{{theme.comments.ds.short_name}}"};
(function() {
    var ds = document.createElement('script');
    ds.type = 'text/javascript';ds.async = true;
    ds.src = 'http://static.duoshuo.com/embed.js';
    ds.charset = 'UTF-8';
    (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(ds);
})();
</script>
<!--多说js加载结束，一个页面只需要加载一次 -->