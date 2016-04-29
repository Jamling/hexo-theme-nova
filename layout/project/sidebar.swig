  <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
    {%- set hasChild = false %}
    {%- for menu in prj %}
      {%- if _.isObject(menu) %}
        {%- set hasChild = true %}
      {%- endif %}
    {%- endfor %}
    
    {%- if hasChild %}
    {%- for menu in prj %}
    {%- set name1 = name + '.' + loop.key %}
    <div class="panel panel-primary">
    {%- if _.isString(menu) %}
    <div class="panel-heading" role="tab" id="p_menu_{{loop.key}}">
      <h4 class="panel-title">
        <a href="{{menu}}">{{ _p(name1)}}</a>
      </h4>
    </div>
    {%- else %}
    <div class="panel-heading" role="tab" id="p_menu_{{loop.key}}">
      <h4 class="panel-title">
        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#p_menu_body_{{loop.key}}" aria-expanded="true" aria-controls="p_menu_body_{{loop.key}}">{{ _p(name1)}}</a>
      </h4>
    </div>
    <div id="p_menu_body_{{loop.key}}" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="p_menu_{{loop.key}}">
      <ul class="list-group">
      {%- for mi in menu %}
      {% set name2 = name1 + '.' + loop.key %}
        <li class="list-group-item"><a href="{{mi}}">{{ _p(name2) }}</a></li>
      {%- endfor %}
      </ul>
    </div>
    {%- endif %}
    </div>
    {%- endfor %}
    {%- else %}
       <ul class="list-group">
      {%- for menu in prj %}
        {%- set name1 = name + '.' + loop.key %}
        <li class="list-group-item"><a href="{{menu}}">{{ p_sidebar(name1) }}</a></li>
      {%- endfor %}
      </ul>
    {%- endif %}
  </div>