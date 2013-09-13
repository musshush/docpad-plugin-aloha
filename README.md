# Aloha Editor Wrapper for DocPad

[Aloha Editor](http://www.aloha-editor.org/) has not been updated to use the latest jquery so I made some quick fixes replacing browser testing to [Modernizr](http://modernizr.com/)'s feature testing and added [jquery-migrate](https://github.com/jquery/jquery-migrate) for other issues I was having.
To make the setup process simpler I made a wrapper plugin for [DocPad](http://docpad.org/) for DocPad users.

This is very basic wrapper so it may not be suitable to your use but, at least, hope you can find anything that can help you in the source codes.

## Setup

The plugin includes local copies of slightly modified **aloha.js** and **Modernizr**, **require.js**, **jquery**, **jquery-migrate**, and **aloha.css** but other than **aloha.js** you can set the paths to your own files (if you have any already using) in **docpad.coffee** plugins setting.

    plugins:
    	aloha:
    		modernizr: '/path/to/modernizr.js'
    		requirejs: '/path/to/require.js'
    		jquery: '/path/to/jquery.js'
    		jquerymigrate: '/path/to/jquerymigrate.js'
    		
The plugin is using the cdn version of aloha.css but if you really want to and are willing to customize aloha style then you can set the path to the stylesheet in the setting.

    plugins:
    	aloha:
    		alohacss: '/path/to/aloha.css'
    		
And you can set your prefered aloha plugins.

    plugins:
    	aloha:    		
    		alohaPlugins: [
        		'common/ui'
        		'common/format'
        		'common/list'
        		'common/link'
        		'common/highlighteditables'
      		]
      		
This plugin uses `.editable` as default selector to attach Aloha editor but if you want to use a different selector you can set it in the setting.

	plugins:
		aloha:
			selector: '.yourselector'

## Hot to use

Use getBlock("styles") and getBlock("scripts") on your layout to add your own css files and javascripts and the plugin will automatically attach related files.
The below is an example in JADE template

    !!! 5
    html
        head
            title="Aloha Plugin"
            meta(charset="UTF-8")
            meta(name="viewport", content="width=device-width,initial-scale=1")
 
            != getBlock("styles").add([<your css files>]).toHTML()
 
        body
            != content
 
            != getBlock("scripts").add([<your javascript files>]).toHTML()
            
