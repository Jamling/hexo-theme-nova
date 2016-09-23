
            <div class="card-action" data-tkey="{{page_uid(post)}}">
              <a class="icon nova-share action-item" href="{{page_share_jiathis(post)}}" data-toggle="modal" data-target="#share-modal" target="_blank"><span class="hidden-xs">{{__('sns.share')}}</span></a>
              <a class="icon nova-bubbles action-item" href="{{ url_for_lang(post.path) }}#comment" id="uyan_count_unit"><span class="count"></span><span class="hidden-xs">{{__('sns.comment')}}</span></a>
              <a class="icon nova-heart2-full action-item fancybox.ajax" onclick="javascript:ds_vote(this, '.card-action', 1, '{{ url_for_lang(post.path) }}#comment')"><span class="count"></span><span class="hidden-xs">{{__('sns.like')}}</span></a>
              <a class="icon nova-eye action-item" href="{{ url_for_lang(post.path) }}"><span class="count"></span><span class="hidden-xs">{{__('article.views')}}</span></a>
              <a class="icon nova-hand-right action-item" href="{{ url_for_lang(post.path) }}" ><span>{{__('page.more')}}</span></a>
            </div>
