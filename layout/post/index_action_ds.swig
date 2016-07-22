
            <div class="card-action" data-tkey="{{page_uid(post)}}">
              <a class="icon nova-share action-item" href="{{page_share_jiathis(post)}}" data-toggle="modal" data-target="#share-modal" target="_blank"><span class="hidden-xs">{{__('sns.share')}}</span></a>
              <a class="icon nova-bubbles action-item" href="{{ url_for_lang(post.path) }}#comment" id="uyan_count_unit"><span class="hidden-xs"><span class="count"></span>{{__('sns.comment')}}</span></a>
              <a class="icon nova-heart2-full action-item fancybox.ajax" href="{{ url_for_lang(post.path) }}#comment" onclick="javascript:ds_vote(this, '.card-action', 1)"><span class="hidden-xs"><span class="count"></span>{{__('sns.like')}}</span></a>
              <a class="icon nova-eye action-item" href="{{ url_for_lang(post.path) }}"><span class="hidden-xs"><span class="count"></span>{{__('article.views')}}</span></a>
              <a class="icon nova-hand-right action-item" href="{{ url_for_lang(post.path) }}" >{{__('page.more')}}</a>
            </div>