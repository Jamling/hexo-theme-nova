{%- if theme.comments.changyan %}
<script>
  var ds_short_name = '{{theme.comments.changyan.appid}}';

  // load comments/likes count
  function ds_load_comments(selector, options) {
    var o = options || {};

    var tkeys;
    $(selector).each(function(i) {
      var tkey = $(this).data('tkey');
      if (tkeys) {
        tkeys += ',' + tkey;
      }
      else {
        tkeys = tkey;
      }
    });
    var url = "http://changyan.sohu.com/api/2/topic/count";
    var label = {

    };
    $.ajax({
      url : url,
      dataType : "jsonp",
      type : 'get',
      data : {
        client_id : ds_short_name,
        topic_source_id : tkeys
      },
      jsonp: 'callback',
      success : function(data) {
        var r = data.result;
        $(selector).each(function(i) {
          var tkey = $(this).data('tkey');
          $(this).data("tid", r[tkey].thread_id);
          if (o.p) {
            for ( var key in o.p) {
              var c = r[tkey][key];
              var str = c <= 0 ? '' : c + '';
              $(this).find(o.p[key]).html(str);
            }
          }
        });
      }
    });//end ajax;
  }
  ds_load_comments('.card-action', {
    style : 'hidden-xs',
    p : {
      comments : '.nova-bubbles .count',
      likes : '.nova-heart2-full .count',
      shares : '.nova-eye .count'
    }
  });
</script>
{%- endif %}
