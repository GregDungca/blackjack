class window.AppView extends Backbone.View
  # template: _.template '
  #   <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
  #   <div class="player-hand-container"></div>
  #   <div class="dealer-hand-container"></div>
  # '

  # events:
  #   'click .hit-button': -> @model.get('playerHand').hit()
  #   'click .stand-button': -> 
  #     @model.get('playerHand').stand()

  initialize: ->
    @render()
    # listen for change on outcome from App
     # when change occurs, re-render
     # @model.on('change', @render, @)

  render: ->
    # @model.get('game').render()
    @$el.html((new GameView model: @model.get('game')).el)
    # @$el.children().detach()
    # @$el.html @template()
    # @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    # @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

