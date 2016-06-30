<article class="article post" itemscope itemtype="http://schema.org/Article">
  <header class="article-header">
    <div class="page-path"><span class="post-category">{{ page_path(post)}}</span></div>
    <div class="divider"></div>
      {%- if is_post() %}
      <h1 class="article-title" itemprop="name">{{ post.title }}</h1>
      {%- else %}
      <h1>
        <a href="{{ url_for_lang(post.path) }}" class="article-title" itemprop="name">{{ post.title }}</a>
      </h1>
      {%- endif %}
    <div class="article-date">
      <span class="icon nova-calendar"><span class="hidden-xs">{{__('page.written_on')}}</span>{{ time_tag(post.date) }}</span>
      <a href="{{ url_for_lang(post.path) }}" class="article-date"></a>
      {{ post_tags(post) }}
      <span class="post-share right">
        <a href="#share" class="icon nova-share"><span class="hidden-xs">{{__('sns.share')}}</span></a>
        <a href="#comment" class="icon nova-bubbles"><span class="hidden-xs">{{__('sns.comment')}}</span></a>
        <a href="#like" class="icon nova-heart2-full"><span class="hidden-xs">{{__('sns.like')}}</span></a>
      </span>
    </div>
    <div class="divider"></div>
  </header>
  <div class="article-content" itemprop="articleBody" id="post-content">
    {{ post.content }}
  </div>
  <footer class="article-footer">
    <!--<time class="article-footer-updated" datetime="{{ date_xml(page.updated) }}" itemprop="dateModified">{{ __('page.last_updated', date(page.updated)) }}</time>-->
<!-- JiaThis Button BEGIN -->
<div class="jiathis_style hidden-xs"><a name="share"></a>
	<span class="jiathis_txt icon nova-share">{{__('sns.share')}}：</span>
	<a class="jiathis_button_tsina">{{__('sns.weibo')}}</a>
	<a class="jiathis_button_weixin">{{__('sns.wechat')}}</a>
	<a class="jiathis_button_twitter">{{__('sns.twitter')}}</a>
	<a class="jiathis_button_copy">{{__('sns.copy')}}</a>
	<a class="jiathis_button_ishare">{{__('sns.one')}}</a>
	<a href="http://www.jiathis.com/share?uid={{theme.share.jiathis.uid}}" class="jiathis jiathis_txt jiathis_separator jtico jtico_jiathis" target="_blank">{{__('sns.more')}}</a>
	<a class="jiathis_counter_style"></a>
  <a name="like"></a>
  <a class="jiathis_like_qzone"></a>
</div>
<!-- JiaThis Button END -->
  </footer>
</article>
<div>
  <nav class="nonbar noborder">{{ nova_paginator2({show_name: true}) }}</nav>
  {{ partial('../partial/donate') }}
  {{ partial('../partial/comment') }}
</div>
