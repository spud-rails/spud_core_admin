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