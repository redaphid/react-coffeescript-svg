React = require 'react'
dispatcher = require '../dispatcher'
TodoList = require './TodoList'
TodoItemEditor = require './TodoItemEditor'
TodoStore = require '../stores/TodoStore'
ActionTypes = require('../constants/TodoListConstants').ActionTypes

class TodoApp extends React.Component
  constructor: ->
    todoListData = localStorage.getItem 'todoList'

    localStorage.setItem 'todoList', '[]' unless todoListData?.length
    todoList = JSON.parse(localStorage.getItem 'todoList')

    dispatcher.dispatch
      type: ActionTypes.RECEIVE_TODO_LIST
      list: todoList



  componentWillMount: =>
    TodoStore.addChangeListener @saveState

  saveState: =>
    todoList = TodoStore.list()
    localStorage.setItem 'todoList', JSON.stringify(todoList)

  render: ->
    <div className="todo-app">
      <h3>The amazing list!</h3>
      <TodoList/>
      <TodoItemEditor/>
    </div>

module.exports = TodoApp
