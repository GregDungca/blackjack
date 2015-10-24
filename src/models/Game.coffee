class window.Game extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on('stand', @calculateGameOutcome, @)

  calculateGameOutcome: ->
    #debugger
    #@get('dealerHand').model.flip()
    # calculate player score :
    if @get('playerHand').hasAce() == 1
      if @get('playerHand').scores()[1] <= 21
        playerScore = @get('playerHand').scores()[1]
      else 
        playerScore = @get('playerHand').scores()[0]
    else
      playerScore = @get('playerHand').scores()[0]

    # calculate dealer score :
    if @get('dealerHand').hasAce() == 1
      if @get('dealerHand').scores()[1] <= 21
        dealerScore = @get('dealerHand').scores()[1]
      else 
        dealerScore = @get('dealerHand').scores()[0]
    else
      dealerScore = @get('dealerHand').scores()[0]

    # calculate who wins
    if playerScore > dealerScore && playerScore <= 21
      @set 'outcome', 'win'
    else if playerScore == dealerScore  
      @set 'outcome', 'tie'
    else 
      @set 'outcome', 'lose'
  
    @calculatePlayerWinnings()
    #alert @get 'outcome'  

  calculatePlayerWinnings: -> 

    if @get('outcome') == 'win' then @set('playerWinnings', @get('playerBet') * 2)

    else if @get('outcome') == 'tie' then @set('playerWinnings', @get('playerBet'))

    else @set('playerWinnings', 0)




