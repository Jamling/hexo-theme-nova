{%- if theme.comments.duoshuo %}
<script>
  var ds_short_name = '{{theme.comments.duoshuo.short_name}}';

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
    var url = "http://api.duoshuo.com/threads/counts.jsonp";
    var label = {

    };
    $.ajax({
      url : url,
      dataType : "jsonp",
      type : 'get',
      data : {
        short_name : ds_short_name,
        threads : tkeys
      },
      jsonp : 'callback',
      success : function(data) {
        var r = data.response;
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

  // vote, need login first.
  function ds_vote(obj, selector, vote, url) {
    var p = $(obj).parents(selector);
    var tid = p.data("tid");
    if (tid) {
      $.ajax({
        url : 'http://' + ds_short_name + '.duoshuo.com/api/threads/vote.json',
        type : 'post',
        //dataType: 'jsonp',
        data : {
          short_name : ds_short_name,
          vote : vote,
          thread_id : tid
        },
        //jsonp: 'callback',
        success : function(data) {
          console.log(data);
          try {
            var old = $(p.likes).html();
            var i = parseInt(old) + 1;
            $(p.likes).html(i + '');
          } catch (e) {
            location.href = url;
          }
        },
        error : function(xhr, msg, error) {
          console.log(msg + ':' + error);
          location.href = url;
        }
      });
    }
  }
  ds_load_comments('.card-action', {
    style : 'hidden-xs',
    p : {
      comments : '.nova-bubbles .count',
      likes : '.nova-heart2-full .count',
      views : '.nova-eye .count'
    }
  });
</script>
{%- endif %}
