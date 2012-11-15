spud.admin.editor = {};

(function(){

  var editor = spud.admin.editor;

  var registeredPlugins = [
    'autolink','lists','layer','table','advhr','advimage','advlink','iespell','inlinepopups','media','paste','spud_media_picker'
  ];

  var registeredButtons = [
    ['bold','italic','underline','strikethrough','|','justifyleft','justifycenter','justifyright','justifyfull','|','formatselect','fontsizeselect','cut','copy','paste','pastetext','pasteword','|','bullist','numlist'],
    ['outdent','indent','blockquote','|','undo','redo','|','link','unlink','anchor','image','code','|','forecolor','backcolor','|','tablecontrols'],
    ['spud_media_picker'],
    []
  ];
  var validElements = "@[id|class|style|title|dir<ltr?rtl|lang|xml::lang|onclick|ondblclick|" +
  "onmousedown|onmouseup|onmouseover|onmousemove|onmouseout|onkeypress|" +
  "onkeydown|onkeyup],a[rel|rev|charset|hreflang|tabindex|accesskey|type|" +
  "name|href|target|title|class|onfocus|onblur],strong/b,em/i,strike,u," +
  "#p,-ol[type|compact],-ul[type|compact],-li,br,img[longdesc|usemap|" +
  "src|border|alt=|title|hspace|vspace|width|height|align|hidpi_src],-sub,-sup," +
  "-blockquote,-table[border=0|cellspacing|cellpadding|width|frame|rules|" +
  "height|align|summary|bgcolor|background|bordercolor],-tr[rowspan|width|" +
  "height|align|valign|bgcolor|background|bordercolor],tbody,thead,tfoot," +
  "#td[colspan|rowspan|width|height|align|valign|bgcolor|background|bordercolor" +
  "|scope],#th[colspan|rowspan|width|height|align|valign|scope],caption,-div," +
  "-span,-code,-pre,address,-h1,-h2,-h3,-h4,-h5,-h6,hr[size|noshade],-font[face" +
  "|size|color],dd,dl,dt,cite,abbr,acronym,del[datetime|cite],ins[datetime|cite]," +
  "object[classid|width|height|codebase|*],param[name|value|_value],embed[type|width" +
  "|height|src|*],script[src|type],map[name],area[shape|coords|href|alt|target],bdo," +
  "button,col[align|char|charoff|span|valign|width],colgroup[align|char|charoff|span|" +
  "valign|width],dfn,fieldset,form[action|accept|accept-charset|enctype|method]," +
  "input[accept|alt|checked|disabled|maxlength|name|readonly|size|src|type|value]," +
  "kbd,label[for],legend,noscript,optgroup[label|disabled],option[disabled|label|selected|value]," +
  "q[cite],samp,select[disabled|multiple|name|size],small," +
  "textarea[cols|rows|disabled|name|readonly],tt,var,big";



  editor.init = function(){
    editor.initWithOptions({});
  };

  editor.initWithOptions = function(options){
    var selector = options.selector || 'textarea.tinymce';
    var theme = options.theme || 'advanced';
    var height = options.height || 400;
    $(selector).tinymce({
      //script_url : '/assets/tiny_mce/tiny_mce.js',
      theme: theme,
      plugins: registeredPlugins.join(','),
      theme_advanced_toolbar_location: "top",
      theme_advanced_buttons1: registeredButtons[0].join(','),
      theme_advanced_buttons2: registeredButtons[1].join(','),
      theme_advanced_buttons3: registeredButtons[2].join(','),
      theme_advanced_buttons4: registeredButtons[3].join(','),
      convert_urls: false,
      valid_elements: validElements,
      height: height
    });
  };

  editor.registerPlugin = function(pluginName){
    if(!$.inArray(registeredPlugins, pluginName)){
      registeredPlugins.push('pluginName');
    }
  };

  editor.deregisterPlugin = function(pluginName){
    var i=0;
    while(i < registeredPlugins.length){
      if(registeredPlugins[i] == pluginName){
        registeredPlugins.splice(1, i);
        break;
      }
      i++;
    }
  };

  editor.registerButton = function(buttonNameOrArray, rowNum){
    rowNum = rowNum || 0;
    if(typeof(buttonName) == 'object'){
      registeredButtons[rowNum].concat(buttonName);
    }
    else{
      registeredButtons[rowNum].push(buttonName);
    }
  };
})();
