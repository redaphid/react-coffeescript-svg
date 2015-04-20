React = require 'react'
class TodoList extends React.Component
  constructor: ->
    @getStateFromStores()
  getStateFromStores: =>
    @state = count: 0

  render: =>
    <div class="todo-list">
        {@state.count}
        <button onClick={@incrementCount}>Increment!</button>
    </div>

  incrementCount: =>
    @setState count: @state.count + 1

module.exports = TodoList
