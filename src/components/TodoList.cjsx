React = require 'react'
TodoStore = require '../stores/TodoStore'
_ = require 'lodash'

class TodoList extends React.Component
  constructor: ->
    @state = todoList: TodoStore.list()

  getStateFromStores: =>
    console.log 'got state from store'
    @setState todoList: TodoStore.list()
    console.log @state

  componentDidMount: =>
    TodoStore.addChangeListener @getStateFromStores

  componentWillUnmount: =>
    TodoStore.removeChangeListener @getStateFromStores

  render: =>
    listItems = _.map @state?.todoList, (item, index) =>
      <li key={item.id}>{item.text}</li>

    console.log listItems
    <ul className="todo-list">
      {listItems}
    </ul>

module.exports = TodoList
