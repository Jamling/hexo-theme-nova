<!--<link type="text/css" rel="stylesheet" href="https://raw.githubusercontent.com/hizzgdev/jsmind/master/style/jsmind.css" />-->
<style>
/* important section */
.jsmind-inner{position:relative;overflow:auto;width:100%;height:100%;}/*box-shadow:0 0 2px #000;*/
.jsmind-inner{
    moz-user-select:-moz-none;
    -moz-user-select:none;
    -o-user-select:none;
    -khtml-user-select:none;
    -webkit-user-select:none;
    -ms-user-select:none;
    user-select:none;
}

/* z-index:1 */
canvas{position:absolute;z-index:1;}

/* z-index:2 */
jmnodes{position:absolute;z-index:2;background-color:rgba(0,0,0,0);}/*background color is necessary*/
jmnode{position:absolute;cursor:default;max-width:400px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;}
jmexpander{position:absolute;width:11px;height:11px;display:block;overflow:hidden;line-height:12px;font-size:12px;text-align:center;border-radius:6px;border-width:1px;border-style:solid;cursor:pointer;}

/* default theme */
jmnode{padding:10px;background-color:#fff;color:#333;border-radius:5px;box-shadow:1px 1px 1px #666;font:16px/1.125 Verdana,Arial,Helvetica,sans-serif;}
jmnode:hover{box-shadow:2px 2px 8px #000;background-color:#ebebeb;color:#333;}
jmnode.selected{background-color:#11f;color:#fff;box-shadow:2px 2px 8px #000;}
jmnode.root{font-size:24px;}
jmexpander{border-color:gray;}
jmexpander:hover{border-color:#000;}

@media screen and (max-device-width: 1024px) {
    jmnode{padding:5px;border-radius:3px;font-size:14px;}
    jmnode.root{font-size:21px;}
}
/* primary theme */
jmnodes.theme-primary jmnode{background-color:#428bca;color:#fff;border-color:#357ebd;}
jmnodes.theme-primary jmnode:hover{background-color:#3276b1;border-color:#285e8e;}
jmnodes.theme-primary jmnode.selected{background-color:#f1c40f;color:#fff;}
jmnodes.theme-primary jmnode.root{}
jmnodes.theme-primary jmexpander{}
jmnodes.theme-primary jmexpander:hover{}

#jsmind_container{
  width: auto;
  height: 100px;
  display: block;
  margin: 0px;
}
.jsmind-inner a{
  color: #fff;
}
</style>
<!-- fix chrome load js issue from github -->
<!--<script type="text/javascript" src="https://raw.githubusercontent.com/hizzgdev/jsmind/master/js/jsmind.js"></script>-->
{{js('js/jsmind.js')}}
<div class="container-fluid">
  <div id="jsmind_container"></div>
  <div id="category" class="h1">
  {# nova_list_categories(site.categories, {class:'list-group', depth: 10, children_indicator: 'category'}) #}
  </div>
  <script type="text/javascript">
    var mind = {
      /* 元数据，定义思维导图的名称、作者、版本等信息 */
      "meta":{
          "name":"jsMind-demo-tree",
          "author":"hizzgdev@163.com",
          "version":"0.2"
      },
      /* 数据格式声明 */
      "format":"node_tree",
      /* 数据内容 */
      "data":{{nova_mind_categories()}}
      };
    var options = {
        container:'jsmind_container',
        editable:false,
        support_html : true,
        //mode: 'full',
        theme:'primary'
    };

    var jm = new jsMind(options);
    // 让 jm 显示这个 mind 即可
    jm.show(mind);
    jm.select_node('root');
    
    var h = $(".theme-primary").css('height');
    $('#jsmind_container').css('height', h);
</script>
</div>