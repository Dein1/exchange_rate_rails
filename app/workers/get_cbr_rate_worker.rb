class GetCbrRateWorker
  include Sidekiq::Worker

  def perform(*args)
    cbr_rate = CbrRateScraper.usd_rate
    if ExchangeRate.last.rate != cbr_rate
      ExchangeRate.create(rate: cbr_rate, date: Time.now)
      ActionCable.server.broadcast('rate', rate: ExchangeRate.last.rate)
      puts 'cbr_job performed'
    end
  end
end
