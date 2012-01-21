//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require spud/admin/jquery.dataTables.min
//= require_self
//= require_tree .
$(document).ready(function() {
    $('#user_table').dataTable({
    	"bJQueryUI": true,
		"sPaginationType": "full_numbers",

    });

    $('a.ajax').live('click', function() {
    	var url = this.href;
    	var title = this.title;
    	var dialog = $("#dialog");
    	if(dialog.length == 0)
    	{
    		dialog = $('<div id="dialog" style="display:hidden;"></div>').appendTo('body');
    	}
    	dialog.load(url + ".js",null,
    	function(responseText, textStatus, XMLHttpRequest) {
    		dialog.dialog({width:500,modal:true,height:500,title:title});
    	})
    	return false;
    });

    $('a.close_dialog').live('click', function() {
    	$('#dialog').dialog('close');
    })
    
    $('a[data-method="delete"]').live('ajax:success',
      function(data, textStatus, jqXHR){
        $(this).closest('tr').fadeOut();
      });

      $('form[data-remote="true"]').live('ajax:success',
      function(data, textStatus, jqXHR){
        $(this).closest('#dialog').dialog('close');
        console.log(data)
      });
      $('a.button').button();
    

        var tabNames = [];
       $('.formtabs .formtab').each(function(tabind) {
           this.id = 'tab-' + tabind;
           console.log($('.tab_name',this));
           tabNames.push($('.tab_name',this).first().val())
       });
       var tabButtons = $('.formtabs .formtab_buttons').first();
       for(var x=0;x<tabNames.length;x++)
       {
           tabButtons.append($('<li><a href="#tab-' + x + '">' + tabNames[x] + '</a></li>'))
       }
       
       $('.formtabs').tabs();

    
} );


function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
}