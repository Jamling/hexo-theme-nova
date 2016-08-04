
    <div class="panel panel-primary hidden-xs" id="category">
      <div class="panel-heading">
        <h3 class="panel-title">{{ __('category.name') }}</h3>
      </div>
      {# widget_cates({show_count: theme.post_widgets_show_count})#}
      <!-- use category tree -->
      {{ nova_list_categories(site.categories, {class:'list-group', depth: 10, children_indicator: 'category'}) }}
    </div>
    