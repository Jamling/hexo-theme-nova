
    <div class="panel panel-primary card widget">
      <div class="panel-heading">
        <span class="panel-title">{{ _p('archive.name') }}</span>
      </div>
      {{ nova_list_archives({orderby:'date', amount: theme.archive.amount, order:-1, class:'collection', show_count: theme.post_widgets_show_count, format: theme.archive.format, type: theme.archive.type})}}
    </div>