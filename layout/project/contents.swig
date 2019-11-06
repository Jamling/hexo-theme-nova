<div class="container-fluid">
<div class="row">
  <div class="{{theme.layout.p.sidebar}}" role="navigation">
    {{ partial('sidebar', {}) }}
  </div>
  <div class="{{theme.layout.p.main}} project">
    <a id="project" href="{{page.gh.prefix}}"></a>
    {{ partial('../page/article') }}
  </div>
  <!-- aside -->
  <div class="{{theme.layout.p.toc}}">
  {%- if page_toc() %}
  {{ partial('../partial/toc', {style: 'col m4 l3'}) }}
  {%- endif %}
  </div>
</div>
<script>
  {
    var base = $('a#project').attr('href');
    // Article
    $('.article').each(function (i) {
      // image
      $(this).find('img').each(function () {
        var src = $(this).attr('src');
        if (src && !(src.indexOf('http://') == 0 || src.indexOf('https://') == 0 || src.indexOf('//') == 0)) {
          console.log(src, 'need to prepend base url');
          $(this).attr('src', base + src);
          var p = $(this).parent();
          if ($(p).is('a')) {
            $(p).attr('href', base + src);
          }
        }
      });
    });
  }
</script>
</div>
