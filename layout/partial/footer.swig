<footer id="body-footer">
  <div class="divider"></div>
  <div>&nbsp;</div>
  <div class="inner text-center">
    <div id="footer-copyright">
      &copy; {{ moment(Date.now()).year() }} <a href="{{ config.url }}" target="_blank">{{ config.author }}</a> powered by <a href="http://hexo.io" target="_blank">Hexo</a> Theme <a href="https://github.com/Jamling/hexo-theme-nova" target="_blank">Nova</a><br>
      <!-- Documentation licensed under <a href="http://creativecommons.org/licenses/by/4.0/" target="_blank">CC BY 4.0</a>. -->
      {%- if is_home() %}
      {{__('page.visits')}}<span class="lc-count"></span>
      {%- endif %}
    </div>
    <div>
      <a href="http://www.miitbeian.gov.cn" target="_blank">{{theme.icp}}</a>
    </div>
  </div>
</footer>
