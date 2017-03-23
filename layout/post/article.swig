{%- extends '../page/article.swig' %}
{%- block article-header %}
    <div class="page-path"><span class="post-category">{{ page_path(page)}}</span></div>
    <div class="divider"></div>
      <h1 class="article-title" itemprop="name headline">{{ post.title }}</h1>
    <div class="post-header clearfix">
      <span class="post-date"><span class="hidden-xs icon nova-calendar">{{__('page.written_on')}}</span>
      <time datetime="{{ date_xml(page.date) }}" itemprop="datePublished">{{ time_tag(page.date) }}</time>
      </span>
      {{ post_tags(post) }}
      <span class="post-share">
        <a href="#share" class="icon nova-share"><span class="hidden-xs">{{__('sns.share')}}</span><span class="jiathis_counter_style"></span></a>
        <a href="#comment" class="icon nova-bubbles"><span class="ds-thread-count" id="changyan_count_unit" data-thread-key="{{page_uid()}}"></span><span class="hidden-xs">{{__('sns.comment')}}</span></a>
        <a href="#like" class="icon nova-heart2-full"><span class="count" id="changyan_parti_unit"></span><span class="hidden-xs">{{__('sns.like')}}</span></a>
        <a href="#" class="icon nova-eye"><span class="count lc-count"></span><span class="hidden-xs">{{__('article.views')}}</span></a>
      </span>
    </div>
    <div class="divider"></div>
{%- endblock %}
