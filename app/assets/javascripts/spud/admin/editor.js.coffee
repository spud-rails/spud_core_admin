spud.admin.editor = {editors: {}, instances: []}
editor            = @spud.admin.editor

editor.init = (options) ->
  editor.monitorFormatters()
  options = options || {}
  selector = options.selector || 'textarea.spud-formatted-editor'

  $(selector).each ->
    editor.initializeEditorForElement this

editor.initializeEditorForElement = (element) ->
  $element = $(element)
  if $element.id and editorInstanceForId($element.id)
    console.warn "Spud Formatted Editor #{$element.id} already initialized!"
    return
  dataFormat = $element.data('format') || 'html'
  dataFormat = dataFormat.toLowerCase()
  editorClass = editor.editors[dataFormat]

  if editorClass
    instance = new editorClass($element)
    editor.instances.push instance
  else
    console.error "Editor not found for the requested Format!"

editor.registerEditor = (format, editorObject, override) ->
  if editor.editors[format] && !override
    log.warn("An Editor is Already Defined For the specified Format")
    return

  editor.editors[format] = editorObject

editor.deregisterEditor = (format) ->
  delete editor.editors[format]

editor.monitorFormatters = ->
  $('select[data-formatter]').off 'change.spud'
  $('select[data-formatter]').on  'change.spud', editor.formatterChanged

editor.formatterChanged = ->

  targetEditorId = $(this).data('formatter')
  targetEditor = $("##{targetEditorId}")
  editor.unload(targetEditorId)
  targetEditor.data 'format', $(this).val()
  editor.initializeEditorForElement(targetEditor)

editor.editorInstanceForId = (id) ->
  for instance in editor.instances when instance.element.attr('id') is id
    return instance
  return null

editor.unload = (id) ->
  if id
    instance = editor.editorInstanceForId id
    if instance
      instance.unload()
      editor.instances.splice(editor.instances.indexOf(instance), 1)
  else
    editor.instances.pop().unload() while editor.instances.length > 0
