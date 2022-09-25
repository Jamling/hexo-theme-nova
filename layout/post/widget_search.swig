{%- if (config.search) %}
<style>
#local-search-result {
    overflow-y: auto;
    max-height: 3in;
}
#local-search-result .search-keyword {
    color:red;
}
.search {
    margin-bottom: 0;
}
</style>
<div class="panel {{theme.post_widgets_animate}}">
    <!-- hexo-generator-search -->
    <div id="site_search">
      <div class="form-group search">
        <input type="text" name="q" id="local-search-input" class="form-control primary" aria-label="..." placeholder="{{ _p('widget.search')}}">
      </div>
      <div id="local-search-result"></div>
    </div>
</div>
{{js('js/search.js')}}
<script>
    var search_path = "{{config.search.path}}";
    if (search_path.length == 0) {
    	search_path = "search.xml";
    }
    var path = "{{config.root}}" + search_path;
    searchFunc(path, 'local-search-input', 'local-search-result');
</script>
{%- endif %}
