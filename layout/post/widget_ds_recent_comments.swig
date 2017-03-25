
    <div class="panel panel-primary">
      <div class="panel-heading">
        <h3 class="panel-title">{{ __('widget.recent_comments') }}</h3>
      </div>
      <!-- 代码1：放在页面需要展示的位置  -->
<!-- 如果您配置过sourceid，建议在div标签中配置sourceid、cid(分类id)，没有请忽略  -->
<div id="cyReping" role="cylabs" data-use="reping"></div>
<!-- 代码2：用来读取评论框配置，此代码需放置在代码1之后。 -->
<!-- 如果当前页面有评论框，代码2请勿放置在评论框代码之前。 -->
<!-- 如果页面同时使用多个实验室项目，以下代码只需要引入一次，只配置上面的div标签即可 -->
<script type="text/javascript" charset="utf-8" src="https://changyan.sohu.com/js/changyan.labs.https.js?appid={{theme.comments.changyan.appid}}"></script>
    </div>
