_ = require 'underscore'
BaseAssociation = require './baseAssociation'
BayezidNode = require './bayezidNode'

class BayezidNodeAssociation extends BaseAssociation
  findNode: (nodeName)-> _.find @, (node)-> node.name is nodeName
  names: -> node.name for node in @

module.exports = BayezidNodeAssociation
