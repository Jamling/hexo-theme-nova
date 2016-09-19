<article class="article page" itemscope="itemscope" itemtype="http://schema.org/Article">
  <header class="article-header">
    <meta content="{{ date_xml(page.date) }}" itemprop="datePublished">
  </header>
  <div class="article-content" itemprop="articleBody">
  {% block content %}
    {{ page.content }}
  {% endblock %}
  </div>
  <footer class="container article-footer">
    <time class="article-footer-updated" datetime="{{ date_xml(page.updated) }}" itemprop="dateModified">
    {{__('page.last_updated', date(page.updated)) }}
    </time>
    <span itemprop="author publisher" itemscope="itemscope" itemtype="http://schema.org/Organization">
      <meta content="{{ config.url }}" itemprop="url">
      <meta content="{{__('site.title')}}" itemprop="name">
      <meta content="/image/logo.png" itemprop="logo">
    </span>
    {{ partial('../partial/share_jiathis_footer') }}
  </footer>
</article>
<div class="container">
  {{ partial('../partial/donate') }}
  {{ partial('../partial/comment') }}
</div>

<div class="modal fade" id="input-modal" tabindex="-1" role="dialog" aria-labelledby="edit image">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title">请输入图片地址</h3>
      </div>
      <div class="modal-body">
          <input type="text" class="input-url form-control">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary ok">确定</button>
      </div>
    </div>
  </div>
</div>
<script>
$('#input-modal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget);
    $('#input-modal .ok').data(button.data());
    $("#input-modal .ok").click(function(event) {
      
      var src_type = $("#input-modal .ok").data('type');
      var src_selector = $("#input-modal .ok").data('selector');
      var url = $("#input-modal .input-url").val();
      if (src_type === 'bg') {
        $(src_selector).css('background-image', 'url("{0}")'.format(url));
      } else if (src_type  === 'src') {
        $(src_selector).attr('src', url);
      }
      $('#input-modal').modal('hide');
      
    });
});

function share(){
    $('#share-modal').modal('hide')
}

function printdiv(selector){
  var selector = selector || '.article-content';
  var div = $(selector).html();
  var old = $(document.body).html();
  $(document.body).html(div);
  $('.btn-print').css('visibility', 'hidden');
  window.print();
  $(document.body).html(old);
}
</script>