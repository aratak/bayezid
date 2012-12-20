module.exports =
  name: 'firstLevelModuleTwo'
  dependencies: ['firstLevelModule']
  start: (cb, data)->
    cb(null, 22)
