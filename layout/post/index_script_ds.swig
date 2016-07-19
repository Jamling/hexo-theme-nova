
<script>
    // load comments/likes count 
    function ds_load_comments(selector, options) {
	var o = options || {};

	var tkeys;
	$(selector).each(function(i) {
	    var tkey = $(this).data('tkey');
	    if (tkeys) {
		tkeys += ',' + tkey;
	    } else {
		tkeys = tkey;
	    }
	});
	var url = "http://api.duoshuo.com/threads/counts.jsonp?short_name={{theme.comments.ds.short_name}}&threads="
		+ tkeys;
	var label = {

	};
	$.ajax({
	    url : url,
	    dataType : "jsonp",
	    type : 'get',
	    data : {},
	    jsonp : 'callback',
	    success : function(data) {
		var r = data.response;
		$(selector).each(function(i) {
		    var tkey = $(this).data('tkey');
		    $(this).data("tid", r[tkey].thread_id);
		    if (o.p) {
			for ( var key in o.p) {
			    var c = '' + r[tkey][key] + '';
			    $(this).find(o.p[key]).html(c);
			}
		    }
		});
	    }
	});//end ajax;
    }

    // vote, need login first.
    function ds_vote(obj, selector, vote) {
	var p = $(obj).parents(selector);
	var tid = p.data("tid");
	if (tid) {
	    $
		    .ajax({
			url : 'http://{{theme.comments.ds.short_name}}.duoshuo.com/api/threads/vote.json',
			type : 'post',
			//dataType: 'jsonp',
			data : {
			    short_name : '',
			    vote : vote,
			    thread_id : tid
			},
			//jsonp: 'callback',
			success : function(data) {
			    console.log(data);
			}
		    });
	}
    }
    ds_load_comments('.card-action', {
	style : 'hidden-xs',
	p : {
	    comments : '.nova-bubbles .count',
	    likes : '.nova-heart2-full .count',
	    views : '.glyphicon-eye-open .count'
	}
    });
</script>