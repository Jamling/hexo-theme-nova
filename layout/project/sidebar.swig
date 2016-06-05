    <aside>
      <div id="project_tree"></div>
      {# css('//cdn.bootcss.com/bootstrap-treeview/1.2.0/bootstrap-treeview.min.css') #}
      {{ js('//cdn.bootcss.com/bootstrap-treeview/1.2.0/bootstrap-treeview.min.js')}}
      <script>
      $('#project_tree').treeview({
        enableLinks: true,
        color: '#428bca',
        expandIcon: 'glyphicon glyphicon-chevron-right',
        collapseIcon: 'glyphicon glyphicon-chevron-down',
        //levels: 3,
        //node-icon: '',
        //selectedColor: '#ff0000',
        onNodeSelected: function(event, data) {
          if (data.state.selected){
            return;
          }
        },
		onNodeExpanded: function(event, data) {
		  $('.node-project_tree').each(function(i){
            $(this).attr('onclick', 'pnav(this)');
		  });
		},
        data: {{ p_nav({parent_color:'#337ab7'}) }}
      });
	  function pnav(liobj){
		var as = $(liobj).find('a[href!="#"]');//alert(as)
		if(as && as[0]){
			as[0].click();
		}
	  }
      $('.node-project_tree').each(function(i){
        $(this).attr('onclick', 'pnav(this)');
	  });
      </script>
    </aside>