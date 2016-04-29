
    <div class="panel panel-primary">
      <div class="panel-heading">
        <h3 class="panel-title">{{ _p('tag.name') }}</h3>
      </div>
      {# widget_tags()#}
      <div class="panel-body">
      {{ tagcloud(site.tags, {color:true,start_color:'#ff0000', end_color:'#0000FF'})}}
      </div>
    </div>