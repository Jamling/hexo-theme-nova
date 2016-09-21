{%- if (page.share === undefined || page.share) %}
  <!-- JiaThis Button BEGIN -->
  <div class="jiathis_style clearfix"><a id="share" href="#share"></a>
      <span class="jiathis_txt icon nova-share">{{__('sns.share')}}：</span>
      <a class="jiathis_button_tsina">{{__('sns.weibo')}}</a>
      <a class="jiathis_button_weixin">{{__('sns.wechat')}}</a>
      <a class="jiathis_button_twitter">{{__('sns.twitter')}}</a>
      <a class="jiathis_button_copy">{{__('sns.copy')}}</a>
      <a class="jiathis_button_ishare">{{__('sns.one')}}</a>
      <a href="http://www.jiathis.com/share?uid={{theme.share.jiathis.uid}}" class="jiathis jiathis_txt jiathis_separator jtico jtico_jiathis" target="_blank">{{__('sns.more')}}</a>
<!--       <a class="jiathis_counter_style"></a> -->
  </div>
  <!-- JiaThis Button END -->
  {{ partial('share_jiathis') }}
{%- endif %}
