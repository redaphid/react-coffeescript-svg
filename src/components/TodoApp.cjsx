React = require 'react'
TodoList = require './TodoList'

class TodoApp extends React.Component
  render: ->
    <div class="todo-app">
      <h3>The amazing list!</h3>
      <TodoList/>
    </div>

module.exports = TodoApp
