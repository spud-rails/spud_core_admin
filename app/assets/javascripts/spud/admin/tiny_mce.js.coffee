class @SpudTinyMCE
	@registeredPlugins: ['autolink','lists','layer','table','tableDropdown','advhr','advimage','advlink','iespell','inlinepopups','media','paste']
	@registeredButtons: [
		['bold','italic','underline','strikethrough','|','justifyleft','justifycenter','justifyright','justifyfull','|','formatselect','cut','copy','paste','pastetext','|','bullist','numlist','outdent','indent','|','tableDropdown','|','link','unlink','anchor','image','code'],
		[],
		[],
		[]
	]
	@validElements: "@[id|class|style|title|dir<ltr?rtl|lang|xml::lang|onclick|ondblclick|" +
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
	"textarea[cols|rows|disabled|name|readonly],tt,var,big"

	@extendedValidElements: []
	@validFormats: "p,h1,h2,h3,h4,h5,h6"
	@defaultTheme: 'advanced'
	editor: null

	constructor: (@element, options) ->
		options = options || {}
		if !@element.attr('id')
			@assignId()

		contentCss = $(@element).data('content-css')
		theme  = options.theme || @constructor.defaultTheme
		height = options.height || 400
		console.log "Loading Css #{contentCss}"
		$(@element).tinymce(
			theme: theme,
			content_css:contentCss,
			plugins: @constructor.registeredPlugins.join(",")
			theme_advanced_toolbar_location: "top"
			theme_advanced_buttons1: @constructor.registeredButtons[0].join(',')
			theme_advanced_buttons2: @constructor.registeredButtons[1].join(',')
			theme_advanced_buttons3: @constructor.registeredButtons[2].join(',')
			theme_advanced_buttons4: @constructor.registeredButtons[3].join(',')
			theme_advanced_toolbar_align: 'left'
			theme_advanced_blockformats: @constructor.validFormats
			convert_urls: false
			valid_elements: SpudTinyMCE.validElements
			media_strict: false
			extended_valid_elements: @constructor.extendedValidElements.join(",")
			width: '100%'
			height: height
		)

	assignId: () =>
		baseId = "spud-tinymce-"
		counter = 1
		counter += 1 while $("##{baseId}#{counter}").length
		@element.attr 'id', "#{baseId}#{counter}"

	unload: () =>
		tinyMCE.execCommand('mceRemoveControl',false,@element.attr('id'));

	@appendValidElement = (element) =>
		@extendedValidElements.push(element)

	@registerButton = (buttonNameOrArray, rowNum) =>
		rowNum = rowNum || 0
		if typeof(buttonNameOrArray) is 'object'
			@registeredButtons[rowNum].concat buttonNameOrArray
		else
			@registeredButtons[rowNum].push buttonNameOrArray

	@registerPlugin = (pluginName) =>
		if $.inArray(@registeredPlugins, pluginName) < 0
			@registeredPlugins.push pluginName

	@deregisterPlugin = (pluginName) =>
		for plugin, i in @registeredPlugins when plugin == pluginName
			@registeredPlugins.splice(i,1)
			break

@spud.admin.editor.registerEditor 'html', @SpudTinyMCE
