module.exports = (BasePlugin) ->

  class AlohaPlugin extends BasePlugin
    name: 'aloha'
    config:
      urlPrefix: 'aloha'

      modernizr: '/aloha/js/modernizr.custom.89202.js'
      requirejs: 'http://requirejs.org/docs/release/2.0.4/minified/require.js'
      jquery: 'http://code.jquery.com/jquery.min.js'
      jquerymigrate: 'http://code.jquery.com/jquery-migrate-1.2.1.min.js'
      alohacss: 'http://cdn.aloha-editor.org/latest/css/aloha.css'
      alohaPlugins: [
        'common/ui'
        'common/format'
        'common/list'
        'common/link'
        'common/highlighteditables'
      ]
      selector: '.editable'

    populateCollections: (opts) ->
      docpad = @docpad
      config = @getConfig()

      plugins = 'data-aloha-plugins="' + config.alohaPlugins.join(', ') + '"'

      docpad.getBlock('scripts')
      .add(config.requirejs, defer: false)
      .add(config.modernizr, defer: false)
      .add(config.jquery, defer: false)
      .add(config.jquerymigrate, defer: false)
      .add('/' + config.urlPrefix + '/js/aloha.js', attrs: plugins, defer: false)
      .add(
        'Aloha.ready( function() { var $ = Aloha.jQuery; $("' + config.selector + '").aloha();});'
        defer: false)

      docpad.getBlock('styles').add(config.alohacss)

      @

    serverExtend: (opts) ->
      app = opts.server
      express = opts.express
      #docpad = @docpad
      config = @getConfig()

      app.use '/' + config.urlPrefix, express.static(__dirname+'/static')
