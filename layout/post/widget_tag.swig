
    <div class="panel panel-primary card widget">
      <div class="panel-heading">
        <span class="panel-title">{{ _p('tag.name') }}</span>
      </div>
      {# widget_tags()#}
      <div class="panel-body card-content">{% set tags = widget_tags_data() %}
      {{ tagcloud(tags, {color:true,start_color:'#ff0000', end_color:'#0000FF'})}}
      </div>
    </div>