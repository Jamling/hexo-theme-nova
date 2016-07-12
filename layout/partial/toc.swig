<div id="navbar-toc" class="card">
      <nav id="toc" class="hidden-print hidden-xs hidden-sm well" data-spy="affix">
        <h4 class="toc-title"><a role="button" data-toggle="collapse" href="#toc-body" aria-expanded="true">
          {{ __('page.contents') }}
        </a></h4>
        {{ nova_toc(page.content, {class:'nav toc-ul', deep: 6, expand:6}) }}
      </nav>
      <script>
        $('body').scrollspy({ target: '#navbar-toc' });
        $('#toc').css('min-width', $('#navbar-toc').css('width'));
      </script>
</div>