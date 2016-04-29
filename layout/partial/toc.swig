      <nav id="toc" class="hidden-print hidden-xs hidden-sm well" data-spy="affix">
        <h4 class="toc-title"><a role="button" data-toggle="collapse" href="#toc-body" aria-expanded="true">
          {{ __('page.contents') }}
        </a></h4>
        {{ nova_toc(page.content, options) }}
        <footer class="toc-footer">
          <a role="button" href="#" id="article-toc-top">{{ __('page.back_to_top') }}</a>
        </footer>
      </nav>