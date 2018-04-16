require 'test_helper'
class GetCbrRateWorkerTest < MiniTest::Unit::TestCase
  def after_teardown
    Sidekiq::Worker.clear_all
    super
  end

  def test_quequeing
    GetCbrRateWorker.perform_async
    assert_equal 1, GetCbrRateWorker.jobs.size
  end

  def test_scraping
    GetCbrRateWorker.perform_async
    Sidekiq::Worker.drain_all
    cbr_rate = CbrRateScraper.usd_rate
    assert_equal cbr_rate, ExchangeRate.last.rate
  end
end
