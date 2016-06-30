
    <div class="panel panel-primary card widget" id="category">
      <div class="panel-heading">
        <span class="panel-title">{{ _p('category.name') }}</span>
      </div>
      {# widget_cates({show_count: theme.post_widgets_show_count})#}
      <!-- use category tree -->
      {{ nova_list_categories(site.categories, {class:'collection', depth: 10, children_indicator: 'category'}) }}
    </div>
    