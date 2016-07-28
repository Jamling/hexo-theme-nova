{%- if theme.lc %}
<!-- LeanClound官方Javascript SDK -->
<script src="https://cdn1.lncld.net/static/js/av-min-1.2.1.js"></script>
<script>
  AV.init({
    appId : '{{theme.lc.app_id}}',
    appKey : '{{theme.lc.app_key}}'
  });

  var lc_config = {
    pageId : '{{page_uid()}}',
    url : '{{page.permalink}}',
    title : '{{page_title()}}'
  };
  
  var lc_table = '{{theme.lc.class}}' || 'Counter';

  (function() {

    var query = new AV.Query(lc_table);
    query.select(['-ACL']);
    query.equalTo('pageId', lc_config.pageId);
    query.first().then(function(data) {
      if (!data) {
        insert(data);
        return;
      }
      update(data);
    });

    function insert(data) {
      if (!data) {
        console.log('data is null new object');
        var M = AV.Object.extend(lc_table);
        data = new M();
        data.set('views', 1);
      }
      for ( var key in lc_config) {
        data.set(key, lc_config[key]);
      }
      data.save().then(function(data) {
        console.log('created objectId is ' + data.id);
      }, function(error) {
        console.log("create object failed");
        console.log(error);
      });
    }

    function update(data) {
      data.increment('views', 1);
      data.save().then(function(data) {
        console.log("update to " + data.get('views'));
      }, function(error) {
        console.log("update object failed");
        console.log(error);
      });
    }
  })();
</script>
{%- endif %}
