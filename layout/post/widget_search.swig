<div class="panel">
  <form name="f1" onsubmit="return g(this)" target="_blank"><!--target="_blank" action="http://zhannei.baidu.com/cse/site" -->
    <div class="input-group has-primary">
      <div class="input-group-btn">
        <!--<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Search <span class="caret"></span></button>
        <ul class="dropdown-menu">
          <li><a href="#">Baidu</a></li>
          <li><a href="#">Google</a></li>
        </ul>-->
      </div><!-- /btn-group -->
      <input type="text" name="word" id="bdcsMain" class="form-control primary" aria-label="..." placeholder="{{ _p('widget.search')}}">
		<input name="tn" type="hidden" value="SE_zzsearchcode_shhzc78w">
                <input name="cl" type="hidden" value="3">
                <input name="ct" type="hidden" value="2097152">
                <input name="si" type="hidden" value="ieclipse.cn">
		<input name="ie" type="hidden" value="utf-8">
      <span class="input-group-btn">
        <button class="btn btn-primary" type="submit"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
      </span>
    </div><!-- /input-group -->
    <script type="text/javascript">(function(){document.write(unescape('%3Cdiv id="bdcs"%3E%3C/div%3E'));var bdcs = document.createElement('script');bdcs.type = 'text/javascript';bdcs.async = true;bdcs.src = 'http://znsv.baidu.com/customer_search/api/js?sid=14175568865013380132' + '&plate_url=' + encodeURIComponent(window.location.href) + '&t=' + Math.ceil(new Date()/3600000);var s = document.getElementsByTagName('script')[0];s.parentNode.insertBefore(bdcs, s);})();</script>
  </form>
</div>

<script src="http://s1.bdstatic.com/r/www/cache/global/js/BaiduHttps_20150714_zhanzhang.js"></script>
<script>
    function checkHttps () {
        BaiduHttps.useHttps();
    };
    function g(formname) {
        var data = BaiduHttps.useHttps();
        var url = '';
        url = data.s == 0 ? "http://www.baidu.com/baidu" : 'https://www.baidu.com/baidu' + '?ssl_s=1&ssl_c' + data.ssl_code;
        /*if (formname.s[1].checked) {
            formname.ct.value = "2097152";
        }
        else {
            formname.ct.value = "0";
        }*/
        formname.action = url;
        return true;
    };
</script>
