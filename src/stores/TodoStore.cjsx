dispatcher = require '../dispatcher'
EventEmitter = require('events').EventEmitter
TodoConstants = require '../constants/TodoListConstants'
TodoItem = require '../models/TodoItem'
ActionTypes = TodoConstants.ActionTypes

class TodoStore extends EventEmitter
  constructor: ->
    @todoList = []

    @setupMessageHandler()

    @dispatchToken = dispatcher.register (action) =>
      @messageHandler[action.type] action if @messageHandler[action.type]?

  load: (@todoList) =>
    @emit 'change'

  addChangeListener: (callback) =>
    @on 'change', callback

  removeChangeListener: (callback) =>
    @removeListener callback

  list: =>
    @todoList

  setupMessageHandler : =>
    @messageHandler = {}
    @messageHandler[ActionTypes.RECEIVE_TODO_LIST] = (action) =>
      @load action.list

    @messageHandler[ActionTypes.CREATE_TODO_ITEM] = (item) =>
      @todoList.push new TodoItem item
      @emit 'change'



module.exports = new TodoStore
