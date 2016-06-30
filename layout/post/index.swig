    <div class="wrapper">
      <div class="inner">
        {% for post in page.posts %}
          <div class="card hoverable">
            <div class="card-content">
              <span class="card-title"><a href="{{ url_for_lang(post.path) }}" class="article-title">{{ post.title }}</a></span>
              <div class="divider"></div>
              <div class="section post-header">
                <span class="icon nova-calendar"><var href="{{ url_for_lang(post.path) }}">{{ time_tag(post.date) }}</var></span>
                {{ post_cates(post) }} 
                {{ post_tags(post) }}
              </div>
              <div class="excerpt">
              {{ page_excerpt(post) }}
              </div>
            </div>
            <div class="card-action">
              <span style="display: inline-block; position: relative; float:left;">
              <span class="fixed-action-btn horizontal click-to-toggle"  style="display: inline-block; left: 0px; top: 0px; position: absolute;padding:0px; min-width:5em;">
                <a class="icon nova-share">{{__('sns.share')}}</a>
                <ul style="right:0px;left:0px;text-align:left;top:1em;">
                  <li><a class="btn-floating red" href="{{page_share_jiathis('tsina', post)}}"><i class="icon nova-weibo"></i></a></li>
                  <li><a class="btn-floating blue lighten-5" href="{{page_share_jiathis('twitter', post)}}"><i class="icon nova-twitter blue-text"></i></a></li>
                  <li><a class="btn-floating green" href="{{page_share_jiathis('weixin', post)}}"><i class="icon nova-wechat"></i></a></li>
                  <li><a class="btn-floating blue" href="{{page_share_jiathis('cqq', post)}}"><i class="icon nova-qq"></i></a></li>
                  <li><a class="btn-floating blue darken-3" href="{{page_share_jiathis('fb', post)}}"><i class="icon nova-facebook white-text"></i></a></li>
                </ul>
              </span></span>
              <span style="display:inline-block; margin-left: 5em; position:relative;">
              <a href="{{ url_for_lang(post.path) }}#comment" class="icon nova-bubbles" id="uyan_count_unit" du="{{ page_uid(post) }}"><span class="hidden-xs">0 {{__('sns.comment')}}</span></a>
              <a class="icon nova-heart2-full" href="http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_likeurl" target="_blank"><span class="hidden-xs">{{__('sns.like')}}</span></a>
              <a href="{{ url_for_lang(post.path) }}" class="icon nova-hand-right">{{__('page.more')}}</a>
              </span>
            </div>
          </div>
        {% endfor %}
      </div>
    </div>

    <div class="center-align">{{ nova_paginator({total:page.total, class:'pagination'}) }}</div>
    
<!-- UYAN COUNT BEGIN -->
<script type="text/javascript" src="http://v2.uyan.cc/code/uyan.js?uid={{theme.comments.uyan.uid}}"></script> <!-- 如果已经过加载此行JS，即可不用重复加载 -->
<!-- UYAN COUNT END -->