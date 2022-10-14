
    <div class="panel panel-primary {{theme.post_widgets_animate}}">
      <div class="panel-heading">
        <h3 class="panel-title">{{ _p('widget.recent_comments', 1) }}</h3>
      </div>
      <div class="list-group" id="valine-recent-comments" data-num-items="5">
        <div class="text-center">{{__('ajax.loading')}}</div>
      </div>
    </div>
    <script>
    $(document).ready(function(e) {
    	var dom = $('#valine-recent-comments');
    	var param = dom.data();

    	lc.recentComment({
    		limit: param.numItems,
			debug: false
    	}).then(arr => {
    		if (arr.length == 0) {
    			dom.html('<div class="text-center">{{_p("widget.recent_comments", 0)}}</div>');
    		} else {
    			dom.html('');
    			for (var i = 0; i < arr.length; i++) {
    				let item = arr[i].toJSON();
					let link = item.link;
					let nick = item.nick ? (item.nick.length > 5 ? (item.nick.substring(0, 5) + "...") : item.nick) : '';
					let comment = item.comment.length > 20 ? (item.comment.substring(0, 20) + "...") : item.comment;
    				var url = item.url;
    				// TODO need fix url issue
					let span = $('<span></span').addClass('list-group-item');
					let nickNode = $('<a></a>').text(nick);
					if (link) {
						nickNode.attr('href', link);
					}
					span.append(nickNode);
    				var a = $('<a></a>').text(comment).attr('href', url);
					span.append(a);
    				dom.append(span);
    			}
    		}
    	}, err => {
    		console.warn(e);
    		dom.html('<div class="text-center">{{__("ajax.error")}}</div>');
    	});
    });
    </script>