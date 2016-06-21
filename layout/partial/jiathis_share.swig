<!-- JiaThis Button BEGIN -->
<!--<div class="jiathis_style">
<a href="" class="jiathis jiathis_txt" target="_blank"><img src="http://v2.jiathis.com/code_mini/images/btn/v1/jiathis1.gif" border="0" /></a>
<a class="jiathis_counter_style_margin:0px 0 0 0px"></a>
<a class="jiathis_like_tsina"></a>
</div>-->
<script type="text/javascript" >
var jiathis_config={
	data_track_clickback:false,
	siteNum:12,
	sm:"weixin,qzone,cqq,twitter,tsina,fb,copy,ishare",
	summary:"",
	shortUrl:true,
	hideMore:false
}
function setShare(title, url, summary) {
	var t = title || '{{page_title()}}'
	var u = url || '{{ url_for_lang(page.path) }}'
	var s = summary || '{{ page.excerpt }}'
	jiathis_config.title = t;
	jiathis_config.url = u;
	jiathis_config.summary = s;
	//location.href = 'http://www.jiathis.com/share?uid={{theme.share.jiathis.uid}}'
	alert(u);
	return false;
}
</script>
<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js?uid={{theme.share.jiathis.uid}}" charset="utf-8"></script>
<!-- JiaThis Button END -->

<!-- UYAN COUNT BEGIN --><!--
<a href="链接到的URL地址(产生评论的URL地址)，务必填写，同时URL中允许加入＃标签实现描点功能" id="uyan_count_unit" du="如果网站定义了du参数此处请填上" su="如果网站定义了su参数此处请填上">0条评论</a>
<script type="text/javascript" src="http://v2.uyan.cc/code/uyan.js?uid=2064663"></script>--> <!-- 如果已经过加载此行JS，即可不用重复加载 -->
<!-- UYAN COUNT END -->