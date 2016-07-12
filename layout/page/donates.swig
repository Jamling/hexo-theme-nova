{% set top = {project: false} %}
<script>
  function loadRecords(current) {
    $.getJSON('{{theme.donate.data_url}}', function(data) {
      $("#tb-main tr:not(:first)").remove();
      var items = [];
     
      $.each(data.all_list, function(key, val) {
        var d = new Date();
        d.setTime(val.time * 1000);
        var newRow = ('<tr><td>' + (key + 1) + '</td><td>' + val.name + '</td><td>￥' + val.value + '</td><td>' + d.toLocaleDateString() + '</td></tr>');
        $("#tb-main tr:last").after(newRow);
      });
      
      initPage(Number(data.total), Number(data.page_size), current === undefined ? 1 : current);
      
      $("#tb-top-count tr:not(:first)").remove();
        $.each(data.top_count, function(key, val) {
        var newRow = ('<tr><td>' + (key + 1) + '</td><td>' + val.name + '</td><td>' + val.value + '</td></tr>');
        $("#tb-top-count tr:last").after(newRow);
      });
      
      $("#tb-top-sum tr:not(:first)").remove();
      $.each(data.top_sum, function(key, val) {
        var trcls = "";
        if (key == 0)
        {
          trcls = ' class="success"';
        } else if (key == 1)
        {
          trcls = ' class="info"';
        } else if (key == 2)
        {
          trcls = ' class="warning"';
        }
        var newRow = ('<tr' + trcls + '><td>' + (key + 1) + '</td><td>' + val.name + '</td><td>' + val.value + '</td></tr>');
        $("#tb-top-sum tr:last").after(newRow);
      });
      {% if top.project %}
      $("#tb-prj-count tr:not(:first)").remove();
      $.each(data.prj_count, function(key, val) {
        var trcls = "";
        if (key == 0)
        {
          trcls = ' class="success"';
        } else if (key == 1)
        {
          trcls = ' class="info"';
        } else if (key == 2)
        {
          trcls = ' class="warning"';
        }
        var newRow = ('<tr' + trcls + '><td>' + (key + 1) + '</td><td>' + val.name + '</td><td>' + val.value + '</td></tr>');
        $("#tb-prj-count tr:last").after(newRow);
      });
      {%- endif %}
    });
    
    function initPage(total, size, page){
      var tp = Math.ceil(total / size);
      /*
      $("#page-bar").createPage({
          pageCount:tp,
          current:page,
          backFn:function(p){
            //单击回调方法，p是当前页码
            loadRecords(current);
          }
      });
      */
      //var mod = total % size;
      //if (mod > 0)
      //{
      //	tp = tp + 1;
      //}
      var currentPage = page === undefined ? 1 : page;
      var pageSize = size == undefined ? 10 : size;
      var html = '<ul class="pagination">';
      if (tp > 0)
      {
        html += '<li>';
        html += '<a href="#" onclick="javascript:goPage(' + (currentPage > 1 ? currentPage - 1 : 1) + ',' + pageSize + ');" aria-label="Previous">'
        html += '<span aria-hidden="true">&laquo;</span>';
        html += '</a>';
        html += '</li>';

        for (var i=1; i<=tp; i++)
        {
          html += '<li><a href="#" onclick="goPage(' + i + ',' + size + ');">' + i + '</a></li>';
        }

        html += '<li>';
        html += '<a href="#" onclick="goPage(' + (currentPage == tp ? tp : currentPage + 1) + ',' + pageSize + ');" aria-label="Next">'
        html += '<span aria-hidden="true">&raquo;</span>';
        html += '</a>';
        html += '</li>';
      }
      html += '</ul>';
      $('#page-bar').replaceWith(html);
    }
  }
  
  function goPage(p, s){
		loadRecords(p);
	}
  window.addEventListener("load", function () {
    loadRecords();
  });
  
  function val_donate(){
    var f = $('#donateForm');
    var fe = f.elements;
    var rg = $('#donateForm :radio');
    var s = $('#donateForm select');
    var s1 = "alipay";
    
    for (var i=0;i<rg.length;i++){
      var r = rg[i];
      if (r.checked){
        s1 = r.value;
        break;
      }
    }
    var src = '/image/donate_' + s1;
    if (s1 == "alipay") {
      src += '_' + s.val();
    } else if (s1 == 'wechat') {
      
    }
    
    src += '.png';
    $('#donate_pic').attr('src',src);
  }
  
  $('#DonateModal').on('show.bs.modal', function (e) {
    $('#donateForm').reset();
  })
</script>

<div class="container container-fluid">
  <div class="jumbotron">
    <div class="card-content">
      <h2 class="card-title">{{ __('donate.page.title')}}</h2>
      <p>
      鄙人是一名技术宅，一直致力于相关技术的研究与探索，托管在github上的相关项目，全部为本人放弃休息，奋战若干个日日夜夜的结果，最长的项目甚至从09年就已经开始，如果您对相关项目感兴趣，非常欢迎您在github fork或star，您的star或fork将是我最大的动力！如果您愿意的话，也可以对相关项目进行捐赠，让免费开源之路能够走得更远~
      
      </p>
    </div>
      <div class="card-action">
        <a class="btn btn-raised btn-primary" href="#DonateModal" role="button" data-toggle="modal" data-target="#DonateModal">{{ __('donate.name')}}</a>
      </div>
  </div>
  
  <div class="row">
    <div class="{{theme.layout.d.main}}">
      <div class="panel panel-primary">
        <div class="panel-heading">{{ _p('donate.main.title')}}</div>
        <table class="table table-condensed table-hover" id="tb-main">
          <tr>
            <th scope="row">{{ _p('donate.main.index') }}</th>
            <th>{{ _p('donate.main.name') }}</th>
            <th>{{ _p('donate.main.amount') }}</th>
            <th>{{ _p('donate.main.date') }}</th>
          </tr>
        </table>
      </div>
      <!-- paginator -->
      <nav id="page-bar"></nav>
    </div> <!-- end row main -->
    <div class="{{theme.layout.d.top}}">
      <div class="panel panel-primary">
        <!-- Default panel contents -->
        <div class="panel-heading">{{ _p('donate.aside.count') }}</div>
        <table class="table table-condensed table-hover" id="tb-top-count">
          <tr>
            <th>#</th>
            <th>{{ _p('donate.main.name') }}</th>
            <th>{{ _p('donate.th.count') }}</th>
          </tr>
        </table>
      </div>
      <!-- 2nd -->
      <div class="panel panel-primary">
        <!-- Default panel contents -->
        <div class="panel-heading">{{ _p('donate.aside.sum') }}</div>
        <div class="table-responsive">
          <table class="table table-striped table-hover" id="tb-top-sum">
            <thead>
              <tr>
                <th>#</th>
                <th>{{ _p('donate.main.name') }}</th>
                <th>{{ _p('donate.th.sum') }}</th>
              </tr>
            </thead>
            <tbody>
            </tbody>
          </table>
        </div>
      </div> <!-- end 2nd -->
      {%- if top.project %}
      <!-- top product -->
      <div class="panel panel-primary">
        <!-- Default panel contents -->
        <div class="panel-heading">{{ _p('donate.aside.prj_count') }}</div>
        <div class="table-responsive">
          <table class="table table-striped table-hover" id="tb-prj-count">
            <thead>
              <tr>
                <th>#</th>
                <th>{{ _p('donate.th.project') }}</th>
                <th>{{ _p('donate.th.count') }}</th>
              </tr>
            </thead>
            <tbody>
            </tbody>
          </table>
        </div>
      </div>
      <!-- top product amount -->
      <div class="panel panel-primary">
        <!-- Default panel contents -->
        <div class="panel-heading">{{ _p('donate.aside.prj_sum') }}</div>
        <div class="table-responsive">
          <table class="table table-striped table-hover" id="tb-prj-amount">
            <thead>
              <tr>
                <th>#</th>
                <th>{{ _p('donate.th.project') }}</th>
                <th>{{ _p('donate.th.sum') }}</th>
              </tr>
            </thead>
            <tbody>
            </tbody>
          </table>
        </div>
      </div>
      {%- endif %}
    </div><!-- end top -->
  </div> <!-- end row -->
</div>
<!-- Modal -->
<div class="modal fade" id="DonateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">项目捐赠</h4>
      </div>
      <div class="modal-body">
        <div class="container-fluid">
        <div class="row">
        <div class="col-md-5">
        <form class="form-horizontal" id="donateForm">
            <div class="control-group">
              <label class="control-label">支付方式</label>
                <div class="controls radio radio-primary ">
                <!-- Multiple Radios -->
                <label class="">
                  <input checked="checked" value="alipay" name="pay_method" type="radio" onclick="val_donate();">
                  <span class="circle"></span>
                  支付宝
                </label>
                <label class="">
                  <input value="wechat" name="pay_method" type="radio" onclick="val_donate();">
                  <span class="circle"></span>
                  微信支付
                </label>
                </div>
            </div>

            <div class="control-group">
                <!-- Select Basic -->
                <label class="control-label">捐赠项目</label>
                <div class="controls">
                  <select class="form-control" name="prj" onchange="val_donate();">
                    <option value="aorm">Android-ORM</option>
                    <option value="explorer">Eclipse-Explorer</option>
                    <option value="adt-ext">ADT-extensions</option>
                    <option value="other">其它</option>
                  </select>
                </div>
            </div>
            <img id="donate_pic" src="/image/donate_alipay_aorm.png" alt="..." class="img-rounded" width="160" height="160">
        </form>
        </div>
        
        <div class="col-md-7">
        <h5>扫描左侧的二维码进行捐赠（捐赠金额随意，1分也是爱~）</h5>
        
        <label>捐赠到账之后，本站会及时更新捐赠/打赏记录及相关的榜单</label>
        <label class="text-warning">再次诚挚感谢您的支持~</label>
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
