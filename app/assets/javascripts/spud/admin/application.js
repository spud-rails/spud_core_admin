
//= require jquery
//= require jquery_ujs
//= require tiny_mce/jquery.tinymce.js
//= require spud/admin/jquery.dataTables.min
//= require bootstrap/js/bootstrap
//= require datepicker/js/bootstrap-datepicker
//= require jquery-ui/js/jquery-ui-1.9.1.custom
//= require_self
//= require_tree .
//= require retina_tag

Spud = (typeof(Spud) == 'undefined') ? {} : Spud;
Spud.Admin = (typeof(Spud.Admin) == 'undefined') ? {} : Spud.Admin;

$(document).ready(function() {
    $('#user_table').dataTable({
      "bJQueryUI": true,
      "sPaginationType": "full_numbers"
    });

    $("#modal_window .modal-footer .form-submit").bind('click', function() {
      $("#modal_window .modal-body form").submit();
    });

    $("#modal_window ").on('hidden', function(){
      $(this).find('.modal-footer-additional').remove();
      $(this).find('.modal-footer-default').show();
    });

    $('a.ajax').live('click', function() {
      var url = this.href;
      var title = this.title;
      var dialog = $("#modal_window");

      $("#modal_window .modal-title").text(title);
      dialog.modal({
        remote: url +".js",
        show:true
      });

      // dialog.load(url + ".js",
      // function(responseText, textStatus, XMLHttpRequest) {
      //   dialog.dialog({width:500,modal:true,height:500,title:title});
      // });
      return false;
    });

    $('a.close_dialog').live('click', function() {
      $('#dialog').dialog('close');
    });

    $('a[data-method="delete"]').live('ajax:success',
      function(data, textStatus, jqXHR){
        $(this).closest('tr').fadeOut();
      });

      $('form[data-remote="true"]').live('ajax:success',
      function(data, textStatus, jqXHR){
        var dialog = $(this).closest('#dialog');
        if(dialog) {
          dialog.dialog('close');
        }

      });
      $('a.button').button();


      $('input[type=submit].btn').click(function() {$(this).button('loading');});

    $('#multisite_switcher select').change(function() {
      $(this).parent().submit();
      // alert('test');
    });
    initFormTabs();

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

function initFormTabs(){
   var tabNames = [];

   $('.formtabs .formtab').each(function(tabind) {
      if(tabind === 0) {
        $(this).addClass('active');
      }
      this.id = 'tab-' + tabind;
      tabNames.push($('.tab_name',this).first().val());
   });
   var tabButtons = $('.formtabs .formtab_buttons').first();
   for(var x=0;x<tabNames.length;x++)
   {
      var tabButton = $('<li><a href="#tab-' + x + '" data-toggle="tab">' + tabNames[x] + '</a></li>');
      if(x == 0) {
        tabButton.addClass('active');
      }
       tabButtons.append(tabButton);
   }

   // $('.formtabs').tabs();
}


function initTinyMCE(selector) {
  selector = (typeof(selector) == 'undefined') ? 'textarea.tinymce' : selector;
  // Location of TinyMCE script
  $(selector).tinymce({
    script_url : '/assets/tiny_mce/tiny_mce.js',
    theme: "advanced",
    plugins: "autolink,lists,pagebreak,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,paste",
    theme_advanced_toolbar_location: "top",
    theme_advanced_buttons1 : "bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,styleselect,formatselect,fontselect,fontsizeselect,cut,copy,paste,pastetext,pasteword,|,bullist,numlist",
    theme_advanced_buttons2 : "outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor,|,tablecontrols",
    theme_advanced_buttons3 : null,
    theme_advanced_buttons4 : null,
    convert_urls : false,
    height:"400"
  });
}

function initDatePicker(selector){
  selector = (typeof(selector) == 'undefined') ? '.spud_form_date_picker' : selector;
  $(selector).datepicker({
    'format': 'yyyy-mm-dd',
    'autoclose': true
  });
}

function displayModalDialogWithOptions(options){
  var modal = $('#modal_window');
  if(options.title){
    modal.find('.modal-title').text(options.title);
  }
  if(options.html){
    modal.find('.modal-body').html(options.html);
  }
  var defaultFooter = modal.find('.modal-footer-default');
  if(options.buttons){
    var newFooter = defaultFooter.clone();
    newFooter.addClass('modal-footer-additional');
    newFooter.find('.form-submit').remove();
    for(var key in options.buttons){
      newFooter.append('<button class="btn '+key+'">'+options.buttons[key]+'</button>');
    }
    defaultFooter.hide();
    modal.append(newFooter);
  }
  else{
    defaultFooter.show();
  }
  modal.modal('show');
}

function hideModalDialog(){
  var modal = $('#modal_window');
  modal.modal('hide');
}
