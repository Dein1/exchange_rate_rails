class ExchangeRateChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'rate'
  end
end
