class GetCbrRateJob < ApplicationJob
  queue_as :default

  def perform(*args)
    cbr_rate = CbrRateScraper.get_rate
    if ExchangeRate.last.rate != cbr_rate  && ExchangeRate.last.date < (Time.now + 10_800)
      ExchangeRate.create(rate: cbr_rate, date: Time.now)
      ActionCable.server.broadcast('rate', rate: ExchangeRate.last.rate)
    end
  end
end
