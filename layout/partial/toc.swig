<div id="navbar-toc" class="pinned container">
  <div class="row">
    <div class="{{style}}">
      <nav id="toc" class="nonbar" data-spy="affix">
        <h3 class="toc-title"><a class="blue-text" role="button" data-toggle="collapse" href="#toc-body" aria-expanded="true">
          {{ __('page.contents') }}
        </a></h3>
        <div id="toc-body">
        {{ nova_toc(page.content, {class:'nav toc-ul', deep: 6, expand:6}) }}
        </div>
      </nav>
      <script>
      $('body').scrollspy({ target: '#navbar-toc', offset: 10 });
      </script>
    </div>
  </div>
</div>