module.exports =
  name: 'index'
  dependencies: ['firstLevelModule', 'firstLevelModuleTwo']
  start: (cb, data)->
    cb(null, 11)
