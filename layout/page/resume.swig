
<style>

</style>
{{ css('css/bs/resume.css')}}
{{ page_encrypt(page, {dom:'.page-body', src:'/js/encrypt.min.js'}) }}
<div class="container page-body">
  <div class="row">
    <div class="side col-xs-12 col-md-4">
      {%- set side = page.side || site.data.resume.side %}
      <div class="me">
        <img class="avatar" src="{{side.me.avatar}}" alt="avatar">
        <h2 class="name" role="link">{{side.me.name}}</h2>
        <h5 class="summary">{{side.me.tag}}</h5>
      </div>
      {%- for group in side.groups %}
      <div class="panelx animated slideInUp faster group">
        <h3 class="panelx-title">
          <span class="{{group.iconClass}}"></span>
          {{group.name}}
        </h3>
        <div class="panelx-body">
        {%- if group.type == 'tag' %}
        {{ tagcloud(group.items, {color:true,start_color:'#795548', end_color:'#212121'})}}
        {%- else %}
        {%- for item in group.items %}
        <div class="info-list">
          <span class="info-label">{{item.label}}</span>
          <span class="info-value">
          {%- if item.type == 'md' %} {{markdown(item.value)}} 
          {%- else %} {{item.value}}{%- endif %}
          </span>
        </div>
        {%- endfor %}
        {%- endif %}
        </div><!-- end panel-boxy -->
      </div><!-- end group -->
      {%- endfor %}
    </div><!-- end side -->
    <div class="main col-xs-12 col-md-8">
      <div class="btn-print-bar">
        <button type="button" class="btn btn-primary" onclick="javascript: printContent(true)">
            <span class="glyphicon glyphicon-print"></span> 打印
        </button>
        <button type="button" class="btn btn-info" style="display:none;" onclick="javascript: cancelPrint()">
            <span class="glyphicon glyphicon-refresh"></span> 恢复
        </button>
      </div>
      {{ markdown(page.content) }}
    </div>
  </div>
</div>
{{js('/js/decrypt.min.js')}}

<div class="container page-footer">
  <div style="margin: 1em 0">
  {%- if theme.share.footer.enable %}
  {{- partial('../partial/' + theme.share.footer.layout)}}
  {%- endif %}
  </div>
  <div class="divider"></div>
  {{- partial('../partial/donate') }}
  {{- partial('../partial/comment') }}
</div>
<script>

function printContent(p) {
  $('#body-header').hide();
  $('#body-footer').hide();
  $('.page-footer').hide();
  $('.panelx-body').show();
  $(document.body).css('padding-top', '0px');
  $('.btn-print-bar').css('visibility', 'hidden');
  if (p) {
    window.print();
  }
}
function cancelPrint() {
  $('#body-header').show();
  $(document.body).css('padding-top', '60px');
  $('#body-footer').show();
  $('.page-footer').show();

}

//First, checks if it isn't implemented yet.
if (!String.prototype.format) {
  String.prototype.format = function() {
    var args = arguments;
    return this.replace(/{(\d+)}/g, function(match, number) {
      return typeof args[number] != 'undefined'
        ? args[number]
        : match
      ;
    });
  };
}

function nextH3(node, arr) {
  let n = node.next();
  if (n && n.get(0)) {
    let e = n.get(0);
    if (e.nodeName !== 'H3' && e.nodeName !== 'H2') {
      arr.push(n);
      nextH3(n, arr);
    }
  }
}

jQuery(document).ready(function($) {
    $('.main h3').each(function (h3) {
        let parent = $(this).parent();
        
        let nexts = [];//$(this).nextUntil('mark');
        nextH3($(this), nexts);
        let panelx = $('<div/>').addClass('panelx animated slideInUp faster');
        let panelxBody = $('<div/>').addClass('panelx-body');
        if (Array.isArray(nexts)) {
          nexts = [nexts];
        }
        nexts.forEach((next, index) => {
          panelxBody.append(next);
        });
        let p = $(this).wrap(panelx);
        panelx = $(this).parent();
        panelx.append(panelxBody);
    });
    /* Handle panel expand/collapse */
    $(".panelx").filter(function(index) {
        return ($(this).children('h3').length);
    }).children("h3").append('<span class="item-toggle"><span class="glyphicon glyphicon-collapse-up"></span></span>');

    $('.panelx').hover(function() {
        /* Stuff to do when the mouse enters the element */
        $(this).find('.item-toggle').css('visibility', 'visible');
        //$(this).css('padding', '0.5rem');
    }, function() {
        /* Stuff to do when the mouse leaves the element */
        $(this).find('.item-toggle').css('visibility', 'hidden');
        //$(this).css('padding', '0em');
    });
    $('.panelx h3 .item-toggle').parent().click(function(event) {
        var unit = $(this).parent().find(".panelx-body");
        $(unit).toggle();
    });

    $('.main').hover(function() {
      /* Stuff to do when the mouse enters the element */
      $('.btn-print-bar').css('visibility', 'visible');
    }, function() {
      /* Stuff to do when the mouse leaves the element */
      $('.btn-print-bar').css('visibility', 'hidden');
      cancelPrint();
    });
    
    $("progress").click(function(event) {
        $(this).attr("value", event.offsetX/$(this).width()/0.8 * $(this).attr("max"));
    });

});
</script>
