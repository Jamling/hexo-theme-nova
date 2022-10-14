<footer id="body-footer">
  <div class="divider"></div>
  <div>&nbsp;</div>
  <div class="inner text-center">
    <div id="footer-copyright">
      &copy; {{ moment(Date.now()).year() }} <a href="{{ config.url }}" target="_blank">{{ config.author }}</a> powered by <a href="http://hexo.io" target="_blank">Hexo</a> Theme <a href="https://github.com/Jamling/hexo-theme-nova" target="_blank">Nova</a><br>
      <!-- Documentation licensed under <a href="http://creativecommons.org/licenses/by/4.0/" target="_blank">CC BY 4.0</a>. -->
      {%- if is_home() %}
      <span class="home-count" data-xid="{{page_uid()}}" data-title="{{page_title()}}" data-url="{{page.path || page.permalink}}">
      {{__('page.visits')}}<span class="count"></span>

      </span>
      {%- endif %}
    </div>
    <div>
      <a href="//beian.miit.gov.cn" target="_blank">{{theme.icp}}</a>
    </div>
  </div>
</footer>
