
    <div class="panel panel-primary {{theme.post_widgets_animate}}">
      <div class="panel-heading">
        <h3 class="panel-title">{{ _p('widget.hot', 2) }}</h3>
      </div>
      <div  class="list-group" id="top-threads" data-range="weekly" data-num-items="5">
        <div class="text-center">{{__('ajax.loading')}}</div>
      </div>
    </div>
    <script>
    $(document).ready(function(e) {
    		var $dom = $('#top-threads');
    		var $param = $dom.data();
    			lc.topViews({
    				limit: $param.numItems
    			}).then(arr => {
    				if (arr.length == 0) {
    					$dom.html('<div class="text-center">{{_p("widget.hot", 0)}}</div>');
    				} else {
    					$dom.html('');
    					for (var i = 0; i < arr.length; i++) {
    						let item = arr[i].toJSON();
    						var url = item.url;
                // TODO need fix url issue
    						var a = $('<a></a>').text(item.title).attr('href', url).addClass('list-group-item text-line-1');
    						$dom.append(a);
    					}
    				}
          }, err => {
            console.warn(err);
            $dom.html('<div class="text-center">{{__("ajax.error")}}</div>');
          });
    });
    </script>