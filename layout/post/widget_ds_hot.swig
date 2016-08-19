
    <div class="panel panel-primary">
      <div class="panel-heading">
        <h3 class="panel-title">{{ _p('widget.hot', 2) }}</h3>
      </div>
      <div  class="list-group" id="top-threads" data-range="weekly" data-num-items="5">
        <div class="text-center">{{__('ajax.loading')}}</div>
      </div>
    </div>
    <script>
      var ds_top_url = 'http://api.duoshuo.com/sites/listTopThreads.jsonp';
      var ds_top_dom = $('#top-threads');
      var ds_top_param = ds_top_dom.data();
      ds_top_param.short_name = '{{theme.comments.duoshuo.short_name}}';
      $.ajax({
        url : ds_top_url,
        dataType : "jsonp",
        type : 'get',
        data : ds_top_param,
        jsonp : 'callback',
        success : function(data) {
          if (data.code==0) {
            var arr = data.response;
            if (arr.length == 0) {
              ds_top_dom.html('<div class="text-center">{{_p("widget.hot", 0)}}</div>');  
            } else {
              ds_top_dom.html('');  
              for(var i =0; i<arr.length;i++){
                var a = $('<a></a>').text(arr[i].title).attr('href', arr[i].url).addClass('list-group-item');
                ds_top_dom.append(a);
              }
            }
          }
        },
        error: function (xhr, msg, e) {
          ds_top_dom.html('<div class="text-center">{{__("ajax.error")}}</div>');
        }
      });
    </script>