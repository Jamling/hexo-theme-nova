
    <div class="panel panel-primary">
      <div class="panel-heading">
        <h3 class="panel-title">{{ __('widget.announce') }}</h3>
      </div>
      <div class="panel-body" id="widget_announce">
        本站评论系统已由友言切换为多说，原有的友言评论数据在友言云端数据迁移完毕之后再导入，在此期间，原先的评论暂不可见，请见谅！
      </div>
    </div>
    <script>
    function loadAnnounce() {
      var ds_top_url = '{{url_for("/other/announce.html")}}';
      var ds_top_dom = $('#widget_announce');
      $.ajax({
        url : ds_top_url,
        dataType : "html",
        type : 'get',
        success : function(data) {
          if (data) {
            ds_top_dom.html(data);
          }
        },
        error: function (xhr, msg, e) {
          ds_top_dom.html('<div class="text-center">{{__("ajax.error")}}</div>');
        }
      });
    }
    loadAnnounce();
    </script>
