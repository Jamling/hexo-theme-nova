
    <div class="panel panel-primary {{theme.post_widgets_animate}}">
      <div class="panel-heading">
        <h3 class="panel-title">{{ __('widget.announce') }}</h3>
      </div>
      <div class="panel-body" id="widget_announce">
        <div class="text-center">{{__('ajax.loading')}}</div>
      </div>
    </div>
    <script>
    $(document).ready(function(e) { 
      let dom = $('#widget_announce');
      lc.getAnnounce({
    				debug: false
    			}).then(arr => {
    				if (arr === undefined) {
    					dom.html('<div class="text-center">{{__("ajax.empty")}}</div>');
    				} else {
    					dom.html(arr.value);
    				}
          }, err => {
            console.warn(err);
            dom.html('<div class="text-center">{{__("ajax.error")}}</div>');
          });
    });
    </script>
