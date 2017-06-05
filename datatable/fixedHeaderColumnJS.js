<script type="text/javascript">
	function lockHeadColumn(sourceTable, divWidth, divHeight, lockcolumns){		
		var $ = jQuery;				
		var wrapDiv = document.createElement('div');	
        var wrapID = 'wrap' + '_' + sourceTable ;		
		$(wrapDiv).attr('id',wrapID);
		
		var stable = document.getElementById(sourceTable);		
		$(stable).wrap(wrapDiv);
		
	    var s1 = {
			'width': divWidth,
			'height': divHeight,
			'overflow':'scroll',
            'position':'relative'			
		};
		
		var warpDivDom = document.getElementById(wrapID);	//这里必须要这样， 否则后面如果用$(wrapDiv) 是无效的
		$(warpDivDom).css(s1);		
		
		var s2 = {
			'white-space':'nowrap',
			'padding':'3px 5px'
		};
		$(stable).find('div').css(s2);		

		var rows = stable.rows;	
		var cols = rows[0].cells;
		var rowLength= rows.length;
		var colLength= cols.length;	

	    var theadRows = $(stable).find('th').parent().length;    //表头的行数
		
  /*
		(function createHeadTable(){   //创建 head table
			var tableHead = document.createElement('table');
			$(tableHead).attr('id',sourceTable +'_head');
			$(tableHead).css({'border-collapse':'collapse'});
			var tbody = $('<tbody></tbody>');
			for(var i=0; i<theadRows; i++){  
				var tr = $('<tr></tr>');				
				for(j=0; j<colLength; j++){
					var tx= $(rows[i].cells[j]);
					var txclone = tx.clone(true);							
					txclone.width(tx.width());
					txclone.height(tx.height());
					txclone.appendTo(tr);	
					tr.height(tx.parent().height());
					tr.width(tx.parent().width());
				}				
				tr.appendTo(tbody);	
			}
			tbody.appendTo($(tableHead));		
			var cssHead = {
				'position': 'absolute',
				'top': '0px',
				'padding':'3px 5px'
				//'border': '1px solid',
				//'zIndex' : '30'
				//'backgroundColor':'#ffffcc'
			}
			$(tableHead).css(cssHead);		
			$(tableHead).appendTo($(warpDivDom));
		
        })(rows,cols,rowLength, colLength, warpDivDom);		 */
	    

		
		var tableLeft = document.createElement('table');    
		$(tableLeft).attr('id',sourceTable +'_left');
		$(tableLeft).css({'border-collapse':'collapse'}); 
		var tbody = $('<tbody></tbody>');
		for(var i=0; i<rowLength; i++){    
			var tr = $('<tr></tr>');	
			for(j=0; j<lockcolumns; j++){
				var tx= $(rows[i].cells[j]);
				var txclone = tx.clone(true);					
				txclone.height(tx.height());
				txclone.width(tx.width());
				txclone.appendTo(tr);
				tr.height(tx.parent().height());
				
				/*
				if(i<theadRows){
					rows[i].cells[j].style.zIndex = 30;
					rows[i].cells[j].style.position = 'absolute';
					rows[i].cells[j].style.left = '0px';
					rows[i].cells[j].style.top = '0px';
				}  */
			}								
			tr.appendTo(tbody);
		}			
		tbody.appendTo($(tableLeft));		
		var cssLeft = {
			'position': 'absolute',
			'left': '0px',
			'top': '0px',
			'border': '1px solid',
			'backgroundColor':'#ffffcc'
		}
		$(tableLeft).css(cssLeft);		
		$(tableLeft).appendTo($(warpDivDom));
		
		/*
		(function createCornerTable(){   //创建左上角的table
			var tableCorner = document.createElement('table');
			$(tableCorner).attr('id',sourceTable +'_corner');
			$(tableCorner).css({'border-collapse':'collapse'});
			var tbody = $('<tbody></tbody>');
			for(var i=0; i<theadRows; i++){  
				var tr = $('<tr></tr>');
				var tx= $(rows[i].cells[0]);
				var txclone = tx.clone(true);
				txclone.appendTo(tr);			
				tr.appendTo(tbody);	
				txclone.height(tx.height());
				tr.height(tx.parent().height());
			}
			tbody.appendTo($(tableCorner));		
			var cssCorner = {
				'position': 'absolute',
				'left': '0px',
				'top': '0px',
				'border': '1px solid',
				'zIndex' : '30'
				//'backgroundColor':'#ffffcc'
			}
			$(tableCorner).css(cssCorner);		
			$(tableCorner).appendTo($(warpDivDom));
		
        })(rows,cols,rowLength, colLength, warpDivDom);   */
		

		
		$(warpDivDom).scroll(function(){
			
						/*
			              for ( var i = 0; i < cols.length; i++) {
								cols[i].style.top=$(warpDivDom).scrollTop() -1+'px';														
							}  */
					
						$.each($(stable).find('tr'), function(index, dom){
							if ( index < theadRows){
								//$(dom).css({'top': $(warpDivDom).scrollTop() -1+'px'});
								
								$.each($(dom).children(), function(i, d){
									$(d).css({'top': $(warpDivDom).scrollTop() -1+'px'});	
								}); 
								
							}
						}); 
						//$(tableLeft).find('tr')[i].css({'top': $(warpDivDom).scrollTop() -1+'px'});	
						/*
						for ( var j = 0; j < colLength; j++) {							
								rows[i].cells[j].style.top=$(warpDivDom).scrollTop() -1+'px';	
								rowsLeft[i].cells[j].style.top=$(warpDivDom).scrollTop() -1+'px';	
								
							}					*/		
					

					
					$(tableLeft).css({'left': $(warpDivDom).scrollLeft() +'px'});	
		});
	    
		$("#table1 tr").hover(           
			function(){$(this).addClass("hover")},
			function () { $(this).removeClass("hover") }
		);  
           
	}
	
			/*
        var w = document.getElementById("Document").style.width;		
		var h = document.getElementById("Document").style.height; 		
        var tp = document.getElementById("documentView").style.paddingTop;		
		h = (parseInt(h) - parseInt(tp) -28) +'' + 'px';   
		w = (parseInt(w) - 17) +'' + 'px';   
		*/	
	
	lockHeadColumn('table1', '500px', '400px', 1);
</script>