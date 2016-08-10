<!--<link type="text/css" rel="stylesheet" href="https://raw.githubusercontent.com/hizzgdev/jsmind/master/style/jsmind.css" />-->
<style>
blockquote.donate img {
    height: 32px;
}
</style>

<link type="text/css" rel="stylesheet"
  href="http://zwsssn.u.qiniudn.com/love/default.css">
<script type="text/javascript"
  src="http://zwsssn.u.qiniudn.com/love/jquery.min.js"></script>
<script type="text/javascript"
  src="http://zwsssn.u.qiniudn.com/love/jscex.min.js"></script>
<script type="text/javascript"
  src="http://zwsssn.u.qiniudn.com/love/jscex-parser.js"></script>
<script type="text/javascript"
  src="http://zwsssn.u.qiniudn.com/love/jscex-jit.js"></script>
<script type="text/javascript"
  src="http://zwsssn.u.qiniudn.com/love/jscex-builderbase.min.js"></script>
<script type="text/javascript"
  src="http://zwsssn.u.qiniudn.com/love/jscex-async.min.js"></script>
<script type="text/javascript"
  src="http://zwsssn.u.qiniudn.com/love/jscex-async-powerpack.min.js"></script>
<script type="text/javascript"
  src="http://zwsssn.u.qiniudn.com/love/functions.js" charset="utf-8"></script>
<script type="text/javascript"
  src="http://zwsssn.u.qiniudn.com/love/love.js" charset="utf-8"></script>

<div class="container-fluid">

  <div class="formusic" style="z-index: -99999 !important; height: 0;">
    <audio
      style="visibility: hidden; width: 0 !important; height: 0 !important;"
      autoplay="true" controls="false"
      src="http://www.soge8.com/1421074091/fb79ec491c73a29655c21d85ad1c9261.mp3"></audio>
  </div>
  <div id="main">
    <div id="error">
      本页面采用HTML5编辑，目前您的浏览器无法显示，请换成谷歌(<a
        href="http://www.google.cn/chrome/intl/zh-CN/landing_chrome.html?hl=zh-CN&brand=CHMI"
        target="_blank" rel="external">Chrome</a>)或者火狐(<a
        href="http://firefox.com.cn/download/" target="_blank"
        rel="external">Firefox</a>)浏览器，或者其他游览器的最新版本。
    </div>
    <div id="wrap">
      <div id="text">
        <div id="code">
          <span class="say">献给我挚爱的小欣</span><br> <span class="say"></span><br>
          <span class="say"></span><br> <span class="say">欣，从我们相识相爱到现在</span><br>
          <span class="say"> </span><br> <span class="say">已经有3年多的时间了</span><br>
          <span class="say"> </span><br> <span class="say">我不曾送你一束鲜花</span><br>
          <span class="say"> </span><br> <span class="say">不代表我不爱你</span><br>
          <span class="say"> </span><br> <span class="say">我将用程序员特有的方式</span><br>
          <span class="say"> </span><br> <span class="say">献上我的祝福</span><br>
          <span class="say"> </span><br> <span class="say">七夕节快乐！</span><br>
          <span class="say"> </span><br> <span class="say"><span
            class="space"></span> -- 明月--</span>
        </div>
      </div>
      <div id="clock-box">
        明月<span class="STYLE1">与</span>欣有所属<span class="STYLE1">已经相恋了</span>
        <div id="clock"></div>
      </div>
      <canvas id="canvas" width="1170" height="680"></canvas>
    </div>

  </div>
  <script type="text/javascript">
      (function() {
        var canvas = $('#canvas');

        if (!canvas[0].getContext) {
          $("#error").show();
          return false;
        }

        var width = canvas.width();
        var height = canvas.height();

        canvas.attr("width", width);
        canvas.attr("height", height);

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
            num : 700,
            width : 1080,
            height : 650,
          },
          footer : {
            width : 1200,
            height : 5,
            speed : 10,
          }
        }

        var tree = new Tree(canvas[0], width, height, opts);
        var seed = tree.seed;
        var foot = tree.footer;
        var hold = 1;

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
          tree.snapshot("p1", 240, 0, 610, 680);
          while (tree.move("p1", 500, 0)) {
            foot.draw();
            $await(Jscex.Async.sleep(10));
          }
          foot.draw();
          tree.snapshot("p2", 500, 0, 610, 680);

          // 会有闪烁不得意这样做, (＞﹏＜)
          canvas.parent().css("background", "url(" + tree.toDataURL('image/png') + ")");
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
          var together = new Date();
          together.setFullYear(2013, 03, 23); //时间年月日
          together.setHours(20); //小时
          together.setMinutes(11); //分钟
          together.setSeconds(1); //秒前一位
          together.setMilliseconds(1); //秒第二位

          $("#code").show().typewriter();
          $("#clock-box").fadeIn(500);
          while (true) {
            timeElapse(together);
            $await(Jscex.Async.sleep(1000));
          }
        }));

        var runAsync = eval(Jscex.compile("async", function() {
          $await(seedAnimate());
//           if (!inputPwd(2)) {
//             return false;
//           }
          $await(growAnimate());
          $await(flowAnimate());
          $await(moveAnimate());

          textAnimate().start();

          $await(jumpAnimate());
        }));
        
        function inputPwd(count){
          var pwd = ['姜欣欣', '七夕快乐'];
          var tip = '送给谁的？';
          var txt = prompt('查看本网页需要密码\n密码提示：' + tip, '');
          if (pwd.indexOf(txt) < 0) {
            alert('密码错误！');
            if (count >0) {
              return inputPwd(count-1);
            } else {
              return false;
            }
          } else {
            return true;
          }
        }

        runAsync().start();
      })();
    </script>
</div>
<div class="container">
  <div style="margin: 1em 0">
  {{ partial('../partial/share_jiathis_footer') }}
  </div>
  <div class="divider"></div>
  {{ partial('../partial/donate') }}
  {{ partial('../partial/comment') }}
</div>