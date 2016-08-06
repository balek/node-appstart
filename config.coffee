path = require 'path'


projectRoot = path.dirname require.main.filename

module.exports = config = Object.assign
    projectRoot: projectRoot
    require projectRoot + '/config'


process.env.NODE_ENV =
    if config.env
        config.env
    else if config.development
        'development'
    else
        'production'