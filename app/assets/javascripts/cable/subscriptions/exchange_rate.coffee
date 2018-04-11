App.cable.subscriptions.create 'ExchangeRateChannel',
  received: (data) ->
    $('#rate').replaceWith("<div class='display-4' id='rate'>#{data.rate}</div>")