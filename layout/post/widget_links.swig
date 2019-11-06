
    <div class="panel panel-primary {{theme.post_widgets_animate}}">
      <div class="panel-heading">
        <h3 class="panel-title">{{ _p('widget.links') }}</h3>
      </div>
      <div class="list-group" id="widget-links">
      {{ nova_list_links({class: 'list-group-item', style: 'a' }) }}
      </div>
    </div>