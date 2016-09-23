
<script>/*
$(document).ready(function() {
  $(".fancybox.iframe").fancybox({
    maxWidth  : 800,
    maxHeight : 600,
    fitToView : false,
    autoSize  : false,
    closeClick  : false,
    openEffect  : 'none',
    closeEffect : 'none',
    iframe: {
		security: "restricted",
		sandbox: "allow-scripts",
		preload: false
    },
    afterLoad: function(){
		var f = $('.fancybox-iframe');
		f.attr("security", "restricted");
		f.attr("sandbox", "allow-scripts");
		return true;
    }
  });
});*/
</script>
<div class="modal fade" id="share-modal" tabindex="-1" role="dialog" aria-labelledby="share target">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title icon nova-share" id="exampleModalLabel">&nbsp;{{__('sns.share')}}</h4>
      </div>
      <div class="modal-body">
          <a class="share-item" data-webid="tsina" href="#" target="_blank" onclick="share()">
            <i class="icon nova-weibo red white-text"></i>
            {{__('sns.weibo')}}
          </a>
          <a class="share-item" data-webid="twitter" href="#" target="_blank">
            <i class="icon nova-twitter blue" style="background-color: #E3F2FD"></i>
            {{__('sns.twitter')}}
          </a>
          <a class="share-item" data-webid="cqq" href="#" target="_blank">
            <i class="icon nova-qq blue"></i>
            QQ
          </a>
          <a class="share-item" data-webid="weixin" href="#" target="_blank">
            <i class="icon nova-wechat green"></i>
            {{__('sns.wechat')}}
          </a>
          <a class="share-item" data-webid="" href="#" target="_blank">
            <i class="icon nova-share" style="background-color: #2196F3"></i>
            {{__('sns.more')}}
          </a>
      </div>
    </div>
  </div>
</div>
<script>
$('#share-modal').on('show.bs.modal', function (event) {
	var button = $(event.relatedTarget); // Button that triggered the modal
	var href = button.attr('href');
  $('a[data-webid]').each(function(i){
    var url = href.replace(/webid=\w*/, 'webid=' + $(this).data('webid'));
    $(this).attr("href", url);
  });
});

function share(){
    $('#share-modal').modal('hide')
}
</script>
