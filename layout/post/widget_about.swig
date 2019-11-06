
    <div class="panel panel-primary {{theme.post_widgets_animate}}">
      <div class="panel-heading">
        <h3 class="panel-title">{{ __('widget.about') }}</h3>
      </div>
      <div class="panel-body text-center">
        <div>{{theme.about.desc}}</div>
        <div id="widget-about" class="h3 text-center">
          {%- if theme.about.github %}
          <a class="icon-item github" href="https://github.com/{{theme.about.github}}" title="{{theme.about.name}} on Github" target="_blank">
            <i class="icon nova-github-alt icon-font"></i>
          </a>
          {%- endif %}{%- if theme.about.weibo %}
          <a class="icon-item weibo" href="http://weibo.com/{{theme.about.weibo}}" title="{{theme.about.name}} on Weibo" target="_blank">
            <i class="icon nova-weibo icon-font"></i>
          </a>
          {%- endif %}{%- if theme.about.twitter %}
          <a class="icon-item twitter" href="https://twitter.com/{{theme.about.twitter}}" title="{{theme.about.name}} on Twitter" target="_blank">
            <i class="icon nova-twitter icon-font"></i>
          </a>
          {%- endif %}{%- if theme.about.email %}
          <a class="icon-item email" href="mailto:{{theme.about.email}}" title="mail to {{theme.about.name}}" target="_blank">
            <i class="icon nova-email icon-font" style="font-size: 22px"></i>
          </a>
          {%- endif %}
          <!-- 剩下的自己加 -->
        </div>
      </div>
    </div>