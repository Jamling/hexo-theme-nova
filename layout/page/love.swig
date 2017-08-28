
<script type="text/javascript"
  src="http://olx8kgiw6.bkt.clouddn.com/jscex/jscex.min.js"></script>
<script type="text/javascript"
  src="http://olx8kgiw6.bkt.clouddn.com/jscex/jscex-parser.js"></script>
<script type="text/javascript"
  src="http://olx8kgiw6.bkt.clouddn.com/jscex/jscex-jit.js"></script>
<script type="text/javascript"
  src="http://olx8kgiw6.bkt.clouddn.com/jscex/jscex-builderbase.min.js"></script>
<script type="text/javascript"
  src="http://olx8kgiw6.bkt.clouddn.com/jscex/jscex-async.min.js"></script>
<script type="text/javascript"
  src="http://olx8kgiw6.bkt.clouddn.com/jscex/jscex-async-powerpack.min.js"></script>
<script type="text/javascript"
  src="http://olx8kgiw6.bkt.clouddn.com/lovetree/functions.js" charset="utf-8"></script>
<script type="text/javascript"
  src="http://olx8kgiw6.bkt.clouddn.com/lovetree/love.js" charset="utf-8"></script>
<script type="text/javascript"
  src="http://olx8kgiw6.bkt.clouddn.com/lovetree/calendar.js"></script>
<script type="text/javascript"
  src="http://olx8kgiw6.bkt.clouddn.com/lovetree/addon.js" charset="utf-8"></script>
  <style type="text/css">
  body {
    font-size: 16px;
  }
  #wrap{position:relative;margin:0 auto;margin-top:10px;}
  #code{display:none;font-size:1em;}
  #clock-box {font-size:1em;display:none; margin-bottom: 1em; border-bottom: 4px solid #000}
  #clock-box a {font-size:28px;text-decoration:none;}
  #clock .digit {font-size:1.5em;}
  #error{margin:0 auto;text-align:center;margin-top:60px;display:none;}
  .hand{cursor:pointer;}
  .say{margin-left:5px;}
  .space{margin-right:150px;}
  .say {
    min-height: 16px;
  }
  .lover, .author, .festival, .years {
    color: red;
    font-weight: bold;
  }
  .years {
    font-size: 1.5em;
  }
  /*
  #canvas {
    width: 1100px;
    height: 680px;
  }
  @media (max-width: 767px) {
    #canvas {
      width: 360px;
      height: 240px;
    }
  }*/
  @media (min-width: 768px) {
    .container {
      padding: 0.1em;
    }
    #text {
      position: absolute;
      top: 20px;
      z-index: 999;
    }
    #clock-box {
      position:absolute;
      z-index: 1000;
      font-size:2em;
      left:0px;
      bottom:10px;
      border-bottom: none;
    }
    #clock{margin-left:48px;}
  }
  #love {

  }
  </style>
  {% block content %}
    {{ page.content }}
  {% endblock %}

  <script type="text/javascript">
        (function() {
          var divLove = $('#love');
          var divText = $('#text');
          var canvas = $('#canvas');

          if (!canvas[0].getContext) {
            $("#error").show();
            return false;
          }

          var smallScreen = $('#screen-detect').css('display') === 'none';

          var width = divLove.width();
          var height = Math.max(width, canvas.height());
          if (smallScreen) {
            height = 400;
          } else {
            height = 600;
          }

          var dayAddon = new DayAddon(calendar, 'Jamling', 'Jasmin', {
            y: 2013, // 2013年
            M: 3, // 3 月
            d: 23,
            h: 8,
            m: 10,
            s: 0
          });
          // 每年的7月13日
          dayAddon.addSpecial('生日', 0, 07, 13);
          dayAddon.addSpecial('恋爱五周年纪念日', 2018, 03, 23);
          dayAddon.addSpecial('恋爱周年纪念日', 0, 03, 23);
          // 每年的阴历七月初七
          dayAddon.addSpecial('新年', 0, 1, 1, true);
          dayAddon.addSpecial('乞巧节', 0, 7, 7, true);
          dayAddon.addSpecial('元宵节', 0, 1, 15, true);
          dayAddon.addSpecial('端午节', 0, 5, 5, true);
          dayAddon.addSpecial('中秋节', 0, 8, 15, true);
          dayAddon.addSpecial('重阳节', 0, 9, 9, true);
          dayAddon.addSpecial('腊八节', 0, 12, 8, true);

          // 阳历节日
          dayAddon.addSpecial('元旦', 0, 1, 1);
          dayAddon.addSpecial('情人节', 0, 2, 14);
          dayAddon.addSpecial('女神节', 0, 3, 7);
          dayAddon.addSpecial('女王节', 0, 3, 8);
          dayAddon.addSpecial('愚人节', 0, 4, 1);
          dayAddon.addSpecial('劳动节', 0, 5, 1);
          dayAddon.addSpecial('青年节', 0, 5, 4);
          dayAddon.addSpecial('国庆节', 0, 10, 1);
          dayAddon.addSpecial('万圣节', 0, 11, 23);
          dayAddon.addSpecial('平安夜', 0, 12, 24);
          dayAddon.addSpecial('圣诞节', 0, 12, 25);

          dayAddon.display();
          // 本人七牛上的歌曲有:天空之城等
          if (dayAddon.festival === '生日') {
            $('#bg').attr("src", "http://olx8kgiw6.bkt.clouddn.com/lovetree/Happy_Birthday.mp3");
            $('#bg')[0].play();
          }

          var treeAddon = new TreeAddon(width, height, {
              maxCount: Math.floor(dayAddon.days / 100),
              maxLength: smallScreen ? 80 : 100,
              maxWidth: smallScreen ? 16 : 32,/*
              bloomWidth: smallScreen ? width - 40 : width,
              bloomHeight: smallScreen ? height - 40: height - 40,*/
              bloomRadius: Math.ceil(height/3)
            }
          );
          canvas.attr("width", width);
          canvas.attr("height", height);
          //if (true) return;

          var opts = {
            seed : {
              x : width / 2 - 20,
              color : "rgb(190, 26, 37)",
              scale : 2
            },
            branch : [ [
                535,
                680,
                570,
                250,
                500,
                200,
                30,
                100,
                [
                    [ 540, 500, 455, 417, 340, 400, 13, 100, [ [ 450, 435, 434, 430, 394, 395, 2, 40 ] ] ],
                    [ 550, 445, 600, 356, 680, 345, 12, 100, [ [ 578, 400, 648, 409, 661, 426, 3, 80 ] ] ],
                    [ 539, 281, 537, 248, 534, 217, 3, 40 ],
                    [ 546, 397, 413, 247, 328, 244, 9, 80,
                        [ [ 427, 286, 383, 253, 371, 205, 2, 40 ], [ 498, 345, 435, 315, 395, 330, 4, 60 ] ] ],
                    [ 546, 357, 608, 252, 678, 221, 6, 100, [ [ 590, 293, 646, 277, 648, 271, 2, 80 ] ] ] ] ] ],
            bloom : {
              num : Math.floor(dayAddon.days / 10),
              width : treeAddon.bloomWidth,
              height : treeAddon.bloomHeight,
              radius : treeAddon.bloomRadius
            },
            footer : {
              width : width,
              height : 5,
              speed : 10,
            }
          }


          opts.branch = treeAddon.getBranches();

          var tree = new Tree(canvas[0], width, height, opts);
          var seed = tree.seed;
          var foot = tree.footer;
          var hold = 0;

          canvas.click(function(e) {
            var offset = canvas.offset(), x, y;
            x = e.pageX - offset.left;
            y = e.pageY - offset.top;
            if (seed.hover(x, y)) {
              hold = 0;
              canvas.unbind("click");
              canvas.unbind("mousemove");
              canvas.removeClass('hand');
            }
          }).mousemove(function(e) {
            var offset = canvas.offset(), x, y;
            x = e.pageX - offset.left;
            y = e.pageY - offset.top;
            canvas.toggleClass('hand', seed.hover(x, y));
          });

          var seedAnimate = eval(Jscex.compile("async", function() {
            seed.draw();
            while (hold) {
              $await(Jscex.Async.sleep(10));
            }
            while (seed.canScale()) {
              seed.scale(0.95);
              $await(Jscex.Async.sleep(10));
            }
            while (seed.canMove()) {
              seed.move(0, 2);
              foot.draw();
              $await(Jscex.Async.sleep(10));
            }
          }));

          var growAnimate = eval(Jscex.compile("async", function() {
            do {
              tree.grow();
              $await(Jscex.Async.sleep(10));
            } while (tree.canGrow());
          }));

          var flowAnimate = eval(Jscex.compile("async", function() {
            do {
              tree.flower(2);
              $await(Jscex.Async.sleep(10));
            } while (tree.canFlower());
          }));

          var moveAnimate = eval(Jscex.compile("async", function() {
            var x1 = 240, y1 = 0, x2 = 500, y2 = 0;
            var w = 610, h = 680;
            var tb = treeAddon.getBounds();
            w = Math.max(treeAddon.bloomRadius * 4, tb[2] - tb[0]);
            h = canvas.height();
            x1 = (canvas.width() - w) / 2;
            x2 = canvas.width() - w - 20;
            x1 = Math.max(x1, 0);
            x2 = Math.max(x2, 0);

            tree.snapshot("p1", x1, y1, w, h);
            while (tree.move("p1", x2, y2)) {
              foot.draw();
              $await(Jscex.Async.sleep(10));
            }
            foot.draw();
            tree.snapshot("p2", x2, y2, w, h);

            // 会有闪烁不得意这样做, (＞﹏＜)
            canvas.parent().css("background", "url(" + tree.toDataURL('image/png') + ") no-repeat");
            canvas.css("background", "#ffe");
            $await(Jscex.Async.sleep(300));
            canvas.css("background", "none");
          }));

          var jumpAnimate = eval(Jscex.compile("async", function() {
            var ctx = tree.ctx;
            while (true) {
              tree.ctx.clearRect(0, 0, width, height);
              tree.jump();
              foot.draw();
              $await(Jscex.Async.sleep(25));
            }
          }));

          var textAnimate = eval(Jscex.compile("async", function() {
            var together = dayAddon.start;

            $("#code").show().typewriter();
            $("#clock-box").fadeIn(500);
            while (true) {
              timeElapse(together);
              $await(Jscex.Async.sleep(1000));

              // var h = $(document).height()-$(window).height();
              // $(document).scrollTop(h);
            }
          }));

          var runAsync = eval(Jscex.compile("async", function() {
            $await(seedAnimate());
            if (!inputPwd(2)) {
              return false;
            }
            $await(growAnimate());
            $await(flowAnimate());
            $await(moveAnimate());

            textAnimate().start();

            $await(jumpAnimate());
          }));
          function inputPwd(count){
            return true;
          }
          runAsync().start();
        })();
      </script>

<div class="container page-footer">
  <div style="margin: 1em 0">
  {{ partial('../partial/share_jiathis_footer') }}
  </div>
  <div class="divider"></div>
  {{ partial('../partial/donate') }}
  {{ partial('../partial/comment') }}
</div>
