
    <div class="panel panel-primary card widget">
      <div class="panel-heading">
        <span class="panel-title">{{ _p('widget.recent') }}</span>
      </div>
      {{ widget_recents({orderby:'date', amount: post_widgets_recent_count, order:-1, class:'collection'})}}
    </div>