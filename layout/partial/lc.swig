{%- if theme.lc && theme.lc.enable %}

<!-- LeanClound官方Javascript SDK -->
<script>
  var page_layout = '{{is_home()}}'
  var lc_debug = false;

  var lc_config = {
    xid : '{{page_uid()}}',
    url : '{{page.path}}' || '{{page.permalink}}',
    title : '{{page_title()}}'
  };
  lc_debug && console.log('lcconfig', lc_config);

  var lc_table = '{{theme.lc.class}}' || 'Counter';

  function lc_page_views() {
    if (page_layout === 'true') {
      lc_index_views();
    }
    var query = new AV.Query(lc_table);
    query.select(['-ACL']);
    query.equalTo('xid', lc_config.xid);
    query.find().then(results => {
        // results is an array of AV.Object.
        if (typeof results === 'undefined' || results.length == 0) {
          insert();
          return;
        }
        update(results[0]);
        show(results[0]);
      });

    function insert() {
        lc_debug && console.log('data is null new object');
        var M = AV.Object.extend(lc_table);
        let data = new M();
        data.set('time', 1);
      
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
      for (var key in lc_config) {
        if (key !== 'xid')
        data.set(key, lc_config[key]);
      }
      lc_debug && console.log("after change,data", data);
      data.increment('time', 1);
      data.save().then(function(data) {
        lc_debug && console.log("update to " + data.get('time'));
      }, function(error) {
        lc_debug && console.log("update object failed", error);
      });
    }

    function show(data) {
      $(".lc-count").html(data.get('time'));
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
        var tkey = $(this).attr('id');
        tkeys.push(tkey);
      });

      var query = new AV.Query(lc_table);
      query.select([ '-ACL', '-createdAt', '-updatedAt', '-url' ]);
      query.containedIn('xid', tkeys);
      query.find().then(function(results) {
        if (typeof results === 'undefined' || results.length == 0) {
          return;
        }
        $(selector).each(function(i) {
          var tkey = $(this).attr('id');
          for (var i = 0; i < results.length; i++) {
            var t = results[i];
            if (t.get('xid') === tkey) {
              var c = t.get('time') + '';
              $(this).find(o.p.views).html(c);
            }
          }
        });
      }, function(error) {
      });
    }
    lc_load_views('.card-action .leancloud_visitors', {
      style : 'hidden-xs',
      p : {
        views : '.count'
      }
    });
  }

  var loadedAV = !(typeof AV === 'undefined');
  if (!loadedAV) {
    $.getScript('//unpkg.com/leancloud-storage@4.13.2/dist/av-min.js',function() {
      lc_debug && console.log('init AV after av.js loaded');
        loadedAV = !(typeof AV === 'undefined');
        if (!loadedAV) {
          lc_debug && console.log('AV not loaded');

        }
        AV.init({
          appId : '{{theme.lc.app_id}}',
          appKey : '{{theme.lc.app_key}}',
          serverURLs : '{{theme.lc.url}}'
        });
        lc_page_views();
    });
  } else {
    lc_page_views();
  }
</script>
{%- endif %}
