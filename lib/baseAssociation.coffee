_ = require 'underscore'
Base = require './base'

class BaseAssociation
  @create: (obj)-> _.extend obj, @::

module.exports = BaseAssociation
