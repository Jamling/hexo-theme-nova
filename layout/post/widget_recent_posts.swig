
    <div class="panel panel-primary">
      <div class="panel-heading">
        <h3 class="panel-title">{{ _p('widget.recent') }}</h3>
      </div>
      {{ widget_recents({orderby:'date', amount: post_widgets_recent_count, order:-1, class:'list-group'})}}
    </div>