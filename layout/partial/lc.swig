{%- if theme.lc && theme.lc.enable %}

<!-- LeanClound官方Javascript SDK -->
<script>
  var page_layout = '{{is_home()}}'
  var lc_debug = false;
  if(typeof AV === 'undefined') {
    $.getScript('//cdnjs.cloudflare.com/ajax/libs/valine/1.2.1/Valine.min.js',function() {
      lc_debug && console.log('init AV after av.js loaded');
        AV.init({
          appId : '{{theme.lc.app_id}}',
          appKey : '{{theme.lc.app_key}}'
        });
        if (page_layout === 'true') {
          lc_index_views('.card-action', {
            style : 'hidden-xs',
            p : {
              views : '.nova-eye .count'
            }
          })
        }
        lc_page_views();
    });
  }

  var lc_config = {
    pageId : '{{page_uid()}}',
    url : '{{page.path}}' || '{{page.permalink}}',
    title : '{{page_title()}}'
  };
  lc_debug && console.log('lcconfig', lc_config);

  var lc_table = '{{theme.lc.class}}' || 'Counter';

  function lc_page_views() {
    var query = new AV.Query(lc_table);
    query.select(['-ACL']);
    query.equalTo('pageId', lc_config.pageId);
    query.first({
      success: function(results) {
        // results is an array of AV.Object.
        if (typeof results === 'undefined') {
          insert(results);
          return;
        }
        update(results);
        show(results);
      },
      error: function(error) {
        // error is an instance of AV.Error.
        console.log(error);
      }
    });

    function insert(data) {
      if (!data) {
        lc_debug && console.log('data is null new object');
        var M = AV.Object.extend(lc_table);
        data = new M();
        data.set('views', 1);
      }
      for ( var key in lc_config) {
        data.set(key, lc_config[key]);
      }
      data.save().then(function(data) {
        lc_debug && console.log('created objectId is ' + data.id);
      }, function(error) {
        lc_debug && console.log("create object failed", error);
      });
    }

    function update(data) {
      for ( var key in lc_config) {
        if (key !== 'pageId')
        data.set(key, lc_config[key]);
      }
      lc_debug && console.log("after change,data", data);
      data.increment('views', 1);
      data.save().then(function(data) {
        lc_debug && console.log("update to " + data.get('views'));
      }, function(error) {
        lc_debug && console.log("update object failed", error);
      });
    }

    function show(data) {
      $(".lc-count").html(data.get('views'));
    }
    function show_count(count) {
      $(".lc-count").html(count);
    }
  };

  function lc_index_views() {
    // load views count from leanclound
    // make sure you are created Counter table on leanclound
    function lc_load_views(selector, options) {
      var o = options || {};
      var tkeys = [];
      $(selector).each(function(i) {
        var tkey = $(this).data('tkey');
        tkeys.push(tkey);
      });

      var query = new AV.Query(lc_table);
      query.select([ '-ACL', '-createdAt', '-updatedAt', '-url' ]);
      query.containedIn('pageId', tkeys);
      query.find().then(function(results) {
        $(selector).each(function(i) {
          var tkey = $(this).data('tkey');
          for (var i = 0; i < results.length; i++) {
            var t = results[i];
            if (t.get('pageId') === tkey) {
              var c = t.get('views') + '';
              $(this).find(o.p.views).html(c);
            }
          }
        });
      }, function(error) {
      });
    }

    lc_load_views('.card-action', {
      style : 'hidden-xs',
      p : {
        views : '.nova-eye .count'
      }
    });
  }
</script>
{%- endif %}
