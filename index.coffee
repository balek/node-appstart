module.exports = (opts) ->
    opts ||= {}

    if opts.coffee
        require 'coffeescript/register'

    config = require './config'

    opts.src ||= 'src'
    if not opts.src.startsWith '/'
        opts.src = config.projectRoot + '/' + opts.src
    process.env.NODE_PATH = opts?.src
    require('module').Module._initPaths()

    mod = process.argv[2] || opts.default || 'index'
    require opts.prefix + mod