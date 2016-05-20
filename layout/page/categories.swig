<div class="container container-fluid">
  <div id="category" class="h1">
  {{ nova_list_categories(site.categories, {class:'list-group', depth: 10, children_indicator: 'category'}) }}
  </div>
</div>
{{gh_generate()}}