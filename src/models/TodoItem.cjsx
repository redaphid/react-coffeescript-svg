
generateId = ->
  "#{generateIdFragment()}-#{generateIdFragment()}"
generateIdFragment = =>
  (Math.floor Math.random() * 1000000000).toString 16

class TodoItem
  constructor: (todo) ->
    @text = todo.text
    @id = generateId()
    console.log @text, @id

module.exports = TodoItem
