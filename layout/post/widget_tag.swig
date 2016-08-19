
    <div class="panel panel-primary">
      <div class="panel-heading">
        <h3 class="panel-title">{{ _p('tag.name') }}</h3>
      </div>
      {# widget_tags()#}
      <div class="panel-body">{% set tags = widget_tags_data() %}
      {{ tagcloud(tags, {color:true,start_color:'#795548', end_color:'#212121'})}}
      </div>
    </div>