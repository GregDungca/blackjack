class window.GameView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <input class="bet-amount" type="text">
    <button class="bet-button">Bet</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '
  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> 
      @model.get('dealerHand').at(0).flip()
      @model.get('playerHand').stand()
    'click .bet-button': -> @model.set('playerBet', $('.bet-amount').val())

  initialize: ->
    @model.on( 'change:playerWinnings', (-> alert @model.get('outcome') + ' ' + @model.get('playerWinnings')), @) # test
    @render()
    # listen for change on outcome from App
     # when change occurs, re-render
     # @model.on('change', @render, @)

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
