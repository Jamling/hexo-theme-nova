
<style>
.glyphicon {
  top: 5px;
}

#cv span {
  display: inline-block;
}

#cv .label-value {
  width: 200px;
  vertical-align: top;
}

h1, h2, h3, h4, h5 {
  font-weight: 500;
  color: #5bc0de;
  line-height: 1.5;
}

.progress-list div {
  width: 100%;
  margin-left: 200px;
}

.info-list, .progress-list {
  list-style: none;
  padding-left: 0px;
  font-size: 16px;
  line-height: 2;
}

.stack-list {
  list-style: none;
  padding-left: 0px;
  line-height: 1.5;
}

.stack-list li {
  margin-bottom: 12px;
}

.right-list li {
  margin-bottom: 12px;
}

hr {
  margin-bottom: 8px;
  color: #ccc;
}

.info-unit {
  color: #666;
  margin-bottom: 20px;
}

.remodal-img h3 {
  float: left;
  margin-bottom: 10px;
}

.remodal-img input {
  float: left;
  width: 480px;
  height: 42px;
  font-size: 20px;
  padding: 6px;
  color: #666;
}

.remodal-img button {
  float: right;
  background: #5bc0de;
}

.remodal-img button:hover {
  float: right;
  background: #5bc0de;
}

p {
  line-height: 1.5;
}

progress {
  background-color: #f6f6f6;
  display: inline;
  /*width: 195px;*/
  height: 1em;
}

progress::-webkit-progress-bar {
  background-color: #e0eaf0;
}

progress::-webkit-progress-value {
  background-color: #00796b;
}

progress::-moz-progress-bar {
  background-color: #e0eaf0;
}

progress::-moz-progress-value {
  background-color: #00796b;
}

.progress-list {
  line-height: 2;
}

.me {
  text-align: center;
  margin-bottom: 20px;
}

.weixin {
  margin-top: 20px;
  background-color: #e0eaf0;
  position: relative;
  padding-top: 40px;
  padding-bottom: 40px;
  text-align: center;
}

.weixin img {
  width: 200px;
}

.left-label {
  display: inline-block;
  width: 120px;
}

.portrait {
  margin: 0 auto;
  margin-top: 20px;
  margin-bottom: 10px;
  background-image:
    url('https://avatars3.githubusercontent.com/u/5350591?v=3&s=160');
  background-size: 120%;
  background-position: center;
  border-radius: 50%;
  border: 5px solid #5bc0de;
  width: 160px;
  height: 160px;
}

.side {
  background-color: whitesmoke;
  padding-left: 20px;
  padding-right: 20px;
}

.main {
  padding: 20px;
  background-color: white;
}

.info-header:hover {
  background-color: #d4dee4;
}

.info-unit ul li:hover {
  background-color: #d4dee4;
}

.info-header .unit-remove {
  float: right;
  margin-left: 20px;
  visibility: hidden;
  cursor: pointer;
}

.info-header .item-add {
  float: right;
  margin-left: 20px;
  margin-right: 2px;
  visibility: hidden;
  cursor: pointer;
}

.item-remove {
  position: absolute;
  top: 1px;
  right: 2px;
  margin-right: 2px;
  visibility: hidden;
  cursor: pointer;
  color: red;
}

ul li {
  position: relative;
}

.experience-list .item-remove {
  position: absolute;
  right: 2px;
  top: 0px;
  margin-right: 2px;
  visibility: hidden;
  cursor: pointer;
}

.stack-list .item-remove {
  position: absolute;
  right: 2px;
  top: 0px;
  margin-right: 2px;
  visibility: hidden;
  cursor: pointer;
}
.unit-remove {
  color: red;
}
.item-add {
  color: green;
}
.btn-print-bar {
  visibility: hidden;
  position: absolute;
  top: .5em;
  right: 1em;
}
.btn-print-bar .glyphicon {
  top: 1px;
}
</style>

{{ page_encrypt(page, {dom:'.page-body', src:'/js/encrypt.min.js'}) }}
<div class="page-body">
{% block content %}
  {{ page.content }}
{% endblock %}
</div>
{{js('/js/decrypt.min.js')}}

<div class="container page-footer">
  <div style="margin: 1em 0">
  {{ partial('../partial/share_jiathis_footer') }}
  </div>
  <div class="divider"></div>
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
  $('.btn-print-bar').css('visibility', 'hidden');
  window.print();
  $(document.body).html(old);
}
function toggle_print(p) {
  $('#body-header').toggle();
  $('#body-footer').toggle();
  $('.page-footer').toggle();
  if (p) {
    window.print();
  }
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


jQuery(document).ready(function($) {
    $(".left-label").attr('contenteditable', 'true');
    $(".label-value").attr('contenteditable', 'true');
    $(".info-title").attr('contenteditable', 'true');
    $("h3").attr('contenteditable', 'true');
    $("p").attr('contenteditable', 'true');
    $(".right-paragraph p").attr('contenteditable', 'true');
    $("#username").attr('contenteditable', 'true');
    $("#persona-tag").attr('contenteditable', 'true');
    $(".info-unit ul li").append('<span class="item-remove"><span class="glyphicon glyphicon-remove"></span></span>');
    $(".link").attr('contenteditable', 'false');

    $(".info-unit").filter(function(index) {
        return ($(this).children('ul').length);
    }).children("h2").append('<span class="item-add"><span class="glyphicon glyphicon-plus"></span></span>');

    $(".info-unit h2").append('<span class="unit-remove"><span class="glyphicon glyphicon-remove"></span></span>');

    $('.info-header').hover(function() {
        /* Stuff to do when the mouse enters the element */
        $(this).children('.unit-remove').css('visibility', 'visible');
        $(this).children('.item-add').css('visibility', 'visible');

    }, function() {
        /* Stuff to do when the mouse leaves the element */
        $(this).children('.unit-remove').css('visibility', 'hidden');
        $(this).children('.item-add').css('visibility', 'hidden');
    });

    $('.info-unit ul li').hover(function() {
        /* Stuff to do when the mouse enters the element */
        $(this).children('.item-remove').css('visibility', 'visible');

    }, function() {
        /* Stuff to do when the mouse leaves the element */
        $(this).children('.item-remove').css('visibility', 'hidden');
    });

    $('.main').hover(function() {
      /* Stuff to do when the mouse enters the element */
      $('.btn-print-bar').css('visibility', 'visible');
    }, function() {
      /* Stuff to do when the mouse leaves the element */
      $('.btn-print-bar').css('visibility', 'hidden');
    });

    $('.unit-remove').click(function(event) {
        $(this).closest(".info-unit").remove();
    });

    $('.item-remove').click(function(event) {
        $(this).closest("li").remove();
    });

    $('.item-add').click(function(event) {
        var unit = $(this).closest(".info-unit");
        if (unit.children('ul')){
            var list = unit.children('ul');
            var clone = list.children('li:first-child').clone(true);
            list.append(clone);
        }

    });
    $("progress").click(function(event) {
        $(this).attr("value", event.offsetX/$(this).width()/0.8 * $(this).attr("max"));
    });

});
</script>
