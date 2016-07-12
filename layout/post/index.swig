<main>
        {% for post in page.posts %}
          <div class="card hoverable">
            <div class="card-content">
              <h3 class="card-title"><a href="{{ url_for_lang(post.path) }}" class="article-title">{{ post.title }}</a></h3>
              <div class="divider"></div>
              <div class="section post-header">
                <!-- sub element must be span -->
                <span class="icon nova-calendar">{{ time_tag(post.date) }}</span>
                {{ post_cates(post) }} 
                {{ post_tags(post) }}
              </div>
              <div class="excerpt">
              {{ page_excerpt(post) }}
              </div>
            </div>
            <div class="divider"></div>
            <div class="card-action">
              <a class="icon nova-share action-item" href="{{page_share_jiathis('', post)}}" data-toggle="modal" data-target="#share-modal" target="_blank">{{__('sns.share')}}</a>
              <a class="icon nova-bubbles action-item" href="{{ url_for_lang(post.path) }}#comment" id="uyan_count_unit" du="{{ page_uid(post) }}"><span class="hidden-xs">0 {{__('sns.comment')}}</span></a>
              <a class="icon nova-heart2-full action-item" href="http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_likeurl" target="_blank"><span class="hidden-xs">{{__('sns.like')}}</span></a>
              <a class="icon nova-hand-right action-item" href="{{ url_for_lang(post.path) }}" >{{__('page.more')}}</a>
            </div>
          </div>
        {% endfor %}


    <nav> {{ nova_paginator({total:page.total, class:'pagination'}) }} </nav>
<!-- UYAN COUNT BEGIN -->
<script type="text/javascript" src="http://v2.uyan.cc/code/uyan.js?uid={{theme.comments.uyan.uid}}"></script>
<!-- UYAN COUNT END -->
<script>/*
$(document).ready(function() {
  $(".fancybox.iframe").fancybox({
    maxWidth  : 800,
    maxHeight : 600,
    fitToView : false,
    autoSize  : false,
    closeClick  : false,
    openEffect  : 'none',
    closeEffect : 'none',
    iframe: {
		security: "restricted",
		sandbox: "allow-scripts",
		preload: false
    },
    afterLoad: function(){
		var f = $('.fancybox-iframe');
		f.attr("security", "restricted");
		f.attr("sandbox", "allow-scripts");
		return true;
    }
  });
});*/
</script>
</main>
<div class="modal fade" id="share-modal" tabindex="-1" role="dialog" aria-labelledby="share target">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title icon nova-share" id="exampleModalLabel">&nbsp;{{__('sns.share')}}</h4>
      </div>
      <div class="modal-body">
          <a class="share-item" data-webid="tsina" href="#" target="_blank" onclick="share()">
            <i class="icon nova-weibo bg-red white"></i>
            {{__('sns.weibo')}}
          </a> 
          <a class="share-item" data-webid="twitter" href="#" target="_blank">
            <i class="icon nova-twitter blue" style="background-color: #E3F2FD"></i>
            {{__('sns.twitter')}}
          </a>
          <span class="share-item" data-webid="cqq" href="#" target="_blank">
            <i class="icon nova-qq bg-blue"></i>
            QQ
          </span>
          <a class="share-item" data-webid="weixin" href="#" target="_blank">
            <i class="icon nova-wechat bg-green"></i>
            {{__('sns.wechat')}}
          </a>
          <a class="share-item" data-webid="" href="#" target="_blank">
            <i class="icon nova-share" style="background-color: #2196F3"></i>
            {{__('sns.more')}}
          </a>
      </div>
    </div>
  </div>
</div>
<script>
$('#share-modal').on('show.bs.modal', function (event) {
	var button = $(event.relatedTarget); // Button that triggered the modal
	var href = button.attr('href');
  $('a[data-webid]').each(function(i){
    var url = href.replace(/webid=\w*/, 'webid=' + $(this).data('webid'));
    $(this).attr("href", url);
  });
});

function share(){
    $('#share-modal').modal('hide')
}
</script>