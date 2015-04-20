React = require 'react'
dispatcher = require './dispatcher'
TodoApp = require './components/TodoApp'
ActionTypes = require('./constants/TodoListConstants').ActionTypes
todoListData = localStorage.getItem 'todoList'

localStorage.setItem 'todoList', '[]' unless todoListData?.length
todoList = JSON.parse(localStorage.getItem 'todoList')

dispatcher.dispatch
  type: ActionTypes.RECEIVE_TODO_LIST
  list: todoList

React.render(
  <TodoApp />
  document.getElementById 'main'
)
