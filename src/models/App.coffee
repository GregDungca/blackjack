# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    # event listener for stand
      # check for win / lose
    @get('playerHand').on('stand', @calculateGameOutcome, @)

    # event listener for bust
      # set 'outcome' to be 'lose' 

# calculateGameOutcome
  # compare scores of player and dealer
    # if score of player > score of dealer && score of player <= 21
      # this.outcome = win
    # else
      # this.outcome = lose



  calculateGameOutcome: ->

    
    # calculate player score :
      # if player has an ace
        # get highest score from @get('playerHand').scores()
        # if highest score is <= 21 
          # set player score to that score
        # else 
          # set player score to the other score
      # else
        # get 1st score

    if @get('playerHand').hasAce() == 1
      if @get('playerHand').scores()[1] <= 21
        playerScore = @get('playerHand').scores()[1]
      else 
        playerScore = @get('playerHand').scores()[0]
    else
      playerScore = @get('playerHand').scores()[0]

    # calculate dealer score :
      # if dealer has an ace
        # get highest score from @get('dealerHand').scores()
        # if highest score is <= 21 
          # set dealer score to that score
        # else 
          # set player score to the other score  
      # else
        # get 1st score

    if @get('dealerHand').hasAce() == 1
      if @get('dealerHand').scores()[1] <= 21
        dealerScore = @get('dealerHand').scores()[1]
      else 
        dealerScore = @get('dealerHand').scores()[0]
    else
      dealerScore = @get('dealerHand').scores()[0]

    if playerScore > dealerScore && playerScore <= 21
      @set 'outcome', 'win'
    else if playerScore == dealerScore  
      @set 'outcome', 'tie'
    else 
      @set 'outcome', 'lose'
    alert @get 'outcome'  




