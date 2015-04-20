React = require 'react'
_ = require 'lodash'
dispatcher = require '../dispatcher'
ActionTypes = require('../constants/TodoListConstants').ActionTypes
TodoStore = require '../stores/TodoStore'

ENTER_KEY = 13

class TodoList extends React.Component
  constructor: ->
    @getStateFromStores()

  getStateFromStores: =>
    @state = text: ''

  componentDidMount: =>
    TodoStore.addChangeListener @getStateFromStores

  componentWillUnmount: =>
    TodoStore.removeChangeListener @getStateFromStores

  render: =>
    <div className="todo-item-editor">
      <input type="text" value={@state.text} onChange={@onChange} onKeyDown={@onKeyDown} />
    </div>

  onChange: (event) =>
    @setState text: event.target.value

  onKeyDown: (event) =>
    return unless event.keyCode == ENTER_KEY

    event.preventDefault()
    text = @state.text.trim()
    @setState text: ''

    return unless text

    dispatcher.dispatch type: ActionTypes.CREATE_TODO_ITEM, text: text

module.exports = TodoList
