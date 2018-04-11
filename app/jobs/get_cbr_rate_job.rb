class GetCbrRateJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    cbr_rate = CbrRateScraper.get_rate
    if ExchangeRate.last.rate != cbr_rate && ExchangeRate.last.date < (Time.now + 10800)
      ExchangeRate.create(rate: cbr_rate, date: Time.now)
    end
  end
end
