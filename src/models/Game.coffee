class window.Game extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on('stand', @calculateGameOutcome, @)
    # listen for bust and when we hear it, we set outcome to lose
    @get('playerHand').on('bust', (-> @set(outcome : 'lose', playerWinnings : 0)), @)
    @get('dealerHand')..flip

  calculateGameOutcome: ->
    #debugger
    #@get('dealerHand').model.flip()

    # calculate player score :
    playerScore = @calculateScore('playerHand')

    # calculate dealer score :
    dealerScore = @calculateScore('dealerHand')

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

  calculateScore: (userHand) ->
    if @get(userHand).hasAce() == 1
      if @get(userHand).scores()[1] <= 21
        return @get(userHand).scores()[1]
      else 
        return @get(userHand).scores()[0]
    else
      @get(userHand).scores()[0]





