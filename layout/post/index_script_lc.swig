{%- if theme.lc.enable %}
<script>
  $(document).ready(function() {
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
  });
</script>
{%- endif %}
