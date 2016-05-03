
    <div class="panel panel-primary">
      <div class="panel-heading">
        <h3 class="panel-title">{{ _p('archive.name') }}</h3>
      </div>
      {{ nova_list_archives({orderby:'date', amount: theme.archive.amount, order:-1, class:'list-group', show_count: theme.post_widgets_show_count, format: theme.archive.format, type: theme.archive.type})}}
    </div>