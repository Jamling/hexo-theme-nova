<!-- Button trigger modal -->

          <div class="card-panel grey lighten-5">
            <a name="donate"></a>
            <div class="row valign-wrapper" style="margin:0px;">
              <div class="col s3 m2">
                {{ image_tag('/image/donate_button.png', {class: 'circle responsive-img valign'}) }}
              </div>
              <div class="col s9 m10">
                <span class="black-text"><a class="waves-effect waves-light btn modal-trigger" href="#DonateModal" role="button" data-toggle="modal" data-target="#DonateModal" style="padding: 0 2em; height:100%;">
                  {{ __('donate.page.desc') }}</a>
                </span>
              </div>
            </div>
          </div>
<!-- Modal -->
<div class="modal fade" id="DonateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close modal-action modal-close waves-effect waves-green btn-flat right" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">{{_p('donate.page.title')}}</h4>
      </div>
      <div class="modal-body"><!--
        <table>
        <thead>
          <th class="text-center">支付宝</th>
          <th class="text-center">微信支付</th>
        </thead>
        <tr>
          <td><img src="/image/donate_alipay_blog.png" alt="使用支付宝扫码打赏" class="img-rounded donate" width="200" height="200"></td>
          <td><img src="/image/donate_wechat.png" alt="使用微信扫码打赏" class="img-rounded donate" width="200" height="200"></td>
        </tr>
        </table>-->
        <div class="container">
        <div class="row">
        <div class="col m6">
          <div class="text-center">
            <span style="display:block;">支付宝</span>
            <img src="/image/donate_alipay_blog.png" alt="使用支付宝扫码打赏" class="donate" />
          </div>
        </div>
        <div class="col m6">
          <div class="text-center">
            <span style="display:block;">微信支付</span>
            <img src="/image/donate_wechat.png" alt="使用微信扫码打赏" class="donate" />
          </div>
        </div>
        </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default modal-action modal-close waves-effect waves-green btn-flat" data-dismiss="modal">{{_p('donate.page.close')}}</button>
      </div>
    </div>
  </div>
</div>
<script>

  $(document).ready(function(){
    // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
    $('.modal-trigger').leanModal();
  });
          
</script>
