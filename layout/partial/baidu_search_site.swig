{%- if theme.search.baidu.verified %}

<!-- 百度站内搜索（已通过站点验证） -->
<form class="navbar-form navbar-left" role="search"
  action="{{ theme.search.baidu.domain || 'zhannei.baidu.com'}}/cse/search">
  <div class="form-group search">
    <input type="text" name="q" id="bdcsMain" class="form-control primary" aria-label="..." placeholder="{{ _p('widget.search')}}">
    <input type="hidden" name="s" value="{{theme.search.baidu.sid}}">
    <input type="hidden" name="nsid" value="0">
    <!-- 
    <input name="tn" type="hidden" value="SE_zzsearchcode_shhzc78w">
    <input name="cl" type="hidden" value="3">
    <input name="ct" type="hidden" value="2097152">
    <input name="si" type="hidden" value="ieclipse.cn">
    <input name="ie" type="hidden" value="utf-8">
    -->
  </div>
</form>

{%- else %}

<!--  百度搜索极速体验版，任意站点都可以用 -->
<!--首先请将form表单action属性改写为如下所示-->
<form target="_blank" action="http://zhannei.baidu.com/cse/site">
  <!--请保证您的输入框input标签name值为"q"-->
  <input type="text" name="q" size="30">
  <!--请为您的form表单添加如下一行代码，并将value值改写为您网站的主域-->
  <input type="hidden" name="cc" value="{{ theme.search.baidu.site }}">
  <!--如果您网站是gbk编码，请添加如下一行代码；如果为utf-8编码，则不需要添加-->
  <!--<input type="hidden" name="ie" value="gbk">-->
  <!-- input type="submit" value="搜索"> -->
</form>

{%- endif %}
