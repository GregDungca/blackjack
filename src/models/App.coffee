# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->

    @set 'game', game = new Game()

    # event listener for stand
      # check for win / lose
    # @get('playerHand').on('stand', @calculateGameOutcome, @)
    
    # event listener for bust
      # set 'outcome' to be 'lose' 


  # calculateGameOutcome: ->

    
  #   # calculate player score :


  #   if @get('playerHand').hasAce() == 1
  #     if @get('playerHand').scores()[1] <= 21
  #       playerScore = @get('playerHand').scores()[1]
  #     else 
  #       playerScore = @get('playerHand').scores()[0]
  #   else
  #     playerScore = @get('playerHand').scores()[0]

  #   # calculate dealer score :


  #   if @get('dealerHand').hasAce() == 1
  #     if @get('dealerHand').scores()[1] <= 21
  #       dealerScore = @get('dealerHand').scores()[1]
  #     else 
  #       dealerScore = @get('dealerHand').scores()[0]
  #   else
  #     dealerScore = @get('dealerHand').scores()[0]

  #   # calculate who wins

  #   if playerScore > dealerScore && playerScore <= 21
  #     @set 'outcome', 'win'
  #   else if playerScore == dealerScore  
  #     @set 'outcome', 'tie'
  #   else 
  #     @set 'outcome', 'lose'
  #   alert @get 'outcome'  




