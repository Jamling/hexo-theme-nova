
<div class="container container-fluid">
  <div class="jumbotron">
    <div class="card-content">
      <h2 class="card-title">打赏</h2>
      <p>
      {% block content %}
        {{ page.content }}
      {% endblock %}
      </p>
    </div>
    <div class="card-action">
      <a class="btn btn-raised btn-primary" href="#DonateModal" role="button" data-toggle="modal"
        data-target="#DonateModal">捐赠</a>
    </div>
  </div>

  <div class="row">
    <div class="col-sx-12 col-sm-8 col-md-9 col-lg-9">
      <div class="panel panel-primary">
        <div class="panel-heading">捐赠/打赏记录</div>
        <table class="table table-condensed table-hover" id="donate-list">
          <tr>
            <th scope="row">序号</th>
            <th>姓名</th>
            <th>金额</th>
            <th>日期</th>
          </tr>
        </table>
      </div>
      <!-- paginator -->
      <nav id="page-bar"></nav>
    </div>
    <!-- end row main -->
    <div class="col-sx-6 col-sm-4 col-md-3 col-lg-3">
      {%- if page.donate && page.donate.top_count %}
      <div class="panel panel-primary">
        <!-- Default panel contents -->
        <div class="panel-heading">捐赠次数排行</div>
        <table class="table table-condensed table-hover" id="donate-top-count">
          <tr>
            <th>#</th>
            <th>姓名</th>
            <th>次数</th>
          </tr>
        </table>
      </div>
      {%- endif %}
      {%- if page.donate && page.donate.top_amount %}
      <!-- 2nd -->
      <div class="panel panel-primary">
        <!-- Default panel contents -->
        <div class="panel-heading">捐赠金额排行</div>
        <div class="table-responsive">
          <table class="table table-striped table-hover" id="donate-top-sum">
            <thead>
              <tr>
                <th>#</th>
                <th>姓名</th>
                <th>金额</th>
              </tr>
            </thead>
            <tbody>
            </tbody>
          </table>
        </div>
      </div>
      <!-- end 2nd -->
      {%- endif %}
    </div>
    <!-- end top -->
  </div>
  <!-- end row -->
</div>

<div class="container page-footer">
  <div style="margin: 1em 0">
  {%- if theme.share.footer.enable %}
  {{ partial('../partial/' + theme.share.footer.layout)}}
  {%- endif %}
  </div>
  <div class="divider"></div>
  {{ partial('../partial/donate') }}
  {{ partial('../partial/comment') }}
</div>

<script>
  {%- set dp = page.donate || {} %}
  let donateParams = {
    total: 0,
    listLimit: {{dp.list_limit || 10}},
    topLimit: {{dp.top_limit || 5}},
    page: 0
  }
  let donateFormat = {
    cny: new Intl.NumberFormat('zh-CN', {
      style: 'currency',
      currency: 'CNY',
      minimumFractionDigits: 2,
    }),
    date: new Intl.DateTimeFormat('en-CA', { dateStyle: 'short' })
  };
  function listCallback(res) {
    $("#donate-list tr:not(:first)").remove();
        res.list.forEach((item, index)=> {
          let time = donateFormat.date.format(new Date(item.donatedAt));
          let amount = donateFormat.cny.format(item.amount);
          let html = $(`<tr>
          <td>${index+1}</td>
          <td>${item.uname}</td>
          <td>${amount}</td>
          <td>${time}</td>
          </tr>`);
          if (item.usite) {
            html.children().eq(1).html($('<a/>').text(item.uname).attr('href', item.usite));
          }
          $("#donate-list tr:last").after(html);
        });
        donateParams.total = res.total;
        initPage();
  }
  function topAmountCallback(res) {
    res.forEach((item, index)=> {
          let time = new Date(item.donatedAt).toLocaleDateString();
          let amount = donateFormat.cny.format(item.amount);
          let html = $(`<tr>
          <td>${index+1}</td>
          <td>${item.uname}</td>
          <td>${amount}</td>
          </tr>`);
          if (item.usite) {
            html.children().eq(1).html($('<a/>').text(item.uname).attr('href', item.usite));
          }
          let row = $(html).addClass(topTrClass(index));
          $("#donate-top-sum tr:last").after(row);
        });
  }
  function topCountCallback(res) {
    res.forEach((item, index)=> {
          let time = new Date(item.donatedAt).toLocaleDateString();
          let html = $(`<tr>
          <td>${index+1}</td>
          <td>${item.uname}</td>
          <td>${item.count}</td>
          </tr>`);
          if (item.usite) {
            html.children().eq(1).html($('<a/>').text(item.uname).attr('href', item.usite));
          }
          let row = $(html).addClass(topTrClass(index));
          $("#donate-top-count tr:last").after(row);
        });
  }
  function loadRecords(current) {
    let $list = $('#donate-list');
    if ($list.get(0)) {
      lc.listDonate({limit: donateParams.listLimit, page: donateParams.page}).then(listCallback);
      //$.getJSON('//localhost:3000/1.1/functions/donateList', listCallback);
    }
  }

    function initPage(){
      var tp = Math.ceil(donateParams.total / donateParams.listLimit);
      var currentPage = donateParams.page;
      var pageSize = donateParams.listLimit;
      var html = '<ul class="pagination">';
      if (tp > 0) {
        html += '<li>';
        html += '<a href="javascript:void(0);" onclick="javascript:goPage(' +  0 + ');" aria-label="Previous">'
        html += '<span aria-hidden="true">&laquo;</span>';
        html += '</a>';
        html += '</li>';

        for (var i=1; i<=tp; i++) {
          let className = i == currentPage + 1 ? 'active' : ' ';
          html += `<li class="${className}"><a href="javascript:void(0);" onclick="goPage(${i-1});">${i}</a></li>`;
        }

        html += '<li>';
        html += '<a href="javascript:void(0);" onclick="goPage(' + (tp - 1) + ');" aria-label="Next">'
        html += '<span aria-hidden="true">&raquo;</span>';
        html += '</a>';
        html += '</li>';
      }
      html += '</ul>';
      $('#page-bar').replaceWith(html);
    }
  
  function topWidget() {
    let $list = $('#donate-top-sum');
    if ($list.get(0)) {
      lc.topDonateAmount().then(topAmountCallback);
    }

    $list = $('#donate-top-count');
    if ($list.get(0)) {
      lc.topDonateCount().then(topCountCallback);
    }
  }

  function topTrClass(key) {
    if (key == 0) {
      return 'success'
    } 
    else if (key == 1) {
      return 'info'
    } 
    else if (key == 2) {
      return 'warning'
    }
    else {
      return '';
    }
  }

  function goPage(p){
        donateParams.page = p;
        loadRecords(p);
        $('ul.pagination li').removeClass('active');
        $('ul.pagination li').eq(p + 1).addClass('active');
  }
  window.addEventListener("load", function () {
    loadRecords();
    topWidget();
  });
</script>
