require 'test_helper'
class StartScrapingWorkerTest < MiniTest::Unit::TestCase
  def test_quequeing
    StartScrapingWorker.perform_async
    assert_equal 1, StartScrapingWorker.jobs.size
  end
end
