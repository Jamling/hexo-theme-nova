    <aside>
      <div id="project_tree"></div>
      <style>
      .treeview li{
        padding-top: 0.5em;
        padding-bottom: 0.5em;
      }
      </style>
      {# css('//cdn.bootcss.com/bootstrap-treeview/1.2.0/bootstrap-treeview.min.css') #}
      {{ js('//cdn.bootcss.com/bootstrap-treeview/1.2.0/bootstrap-treeview.min.js')}}
      <script>
      $('#project_tree').treeview({
        enableLinks: true,
        color: '#428bca',
        expandIcon: 'icon nova-arrow-right2',
        collapseIcon: 'icon nova-arrow-down2',
        //levels: 3,
        //node-icon: '',
        //selectedColor: '#ff0000',
        onNodeSelected: function(event, data) {
          if (data.state.selected){
            return;
          }
        },
        data: {{ p_nav({parent_color:'#337ab7'}) }}
      });
      function pnav(liobj){
        var as = $(liobj).find('a');
        if (as && as.length > 0){
          var href = as.attr("href");
          if(href == '#'){
            // as.trigger('click');
          } else if (href) {
            location.href = href;
          }
        }
      }
      
      $('.node-project_tree').each(function(i){
        //$(this).attr('onclick', 'pnav(this)');
	    });
      
      $(document).ready(function(e){
        $(document).on("click",'.node-project_tree',function(e){pnav(this);  });
      });
      </script>
    </aside>