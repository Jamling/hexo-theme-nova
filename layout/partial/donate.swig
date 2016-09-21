{%- if theme.donate.enable && (page.donate === undefined || page.donate) %}
<!-- Button trigger modal -->
<blockquote class="donate"><!--
  <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#DonateModal">
    {{_p('donate.page.title')}}
  </button>-->
  <p>
  <a href="#" role="button" data-toggle="modal" data-target="#DonateModal">{{ image_tag('/image/donate_button.png') }}
  <span>{{ __('donate.page.desc') }}</span></a>
  </p>
</blockquote>
<!-- Modal -->
<div class="modal fade" id="DonateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">{{_p('donate.page.title')}}</h4>
      </div>
      <div class="modal-body"><!--
        <table>
        <thead>
          <th class="text-center">支付宝</th>
          <th class="text-center">微信支付</th>
        </thead>
        <tr>
          <td><img src="/image/donate_alipay.png" alt="使用支付宝扫码打赏" class="img-rounded donate" width="200" height="200"></td>
          <td><img src="/image/donate_wechat.png" alt="使用微信扫码打赏" class="img-rounded donate" width="200" height="200"></td>
        </tr>
        </table>-->
        <div class="container-fluid">
        <div class="row">
        <div class="col-md-6">
          <div class="text-center">
            <span style="display:block;">支付宝</span>
            <img src="/image/donate_alipay.png" alt="使用支付宝扫码打赏" class="donate" />
          </div>
        </div>
        <div class="col-md-6">
          <div class="text-center">
            <span style="display:block;">微信支付</span>
            <img src="/image/donate_wechat.png" alt="使用微信扫码打赏" class="donate" />
          </div>
        </div>
        </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">{{_p('donate.page.close')}}</button>
      </div>
    </div>
  </div>
</div>
{%- endif %}
