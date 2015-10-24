class window.CardView extends Backbone.View
  className: 'card'

  template: _.template ''
  # <%= rankName %> of <%= suitName %>


  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'

    image = "url('img/cards/#{@model.get('rankName')}-#{@model.get('suitName')}.png')"

    if @model.get 'revealed'
      @$el.css({
        'background': image
        'background-size': '100px, 140px'
      })
    else
      @$el.css({
        'background': "url('img/card-back.png')"
        'background-size': '100px, 140px'
      })

