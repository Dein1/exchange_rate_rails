require 'test_helper'
class GetCbrRateWorkerTest < MiniTest::Unit::TestCase
  def test_quequeing
    GetCbrRateWorker.perform_async
    assert_equal 1, GetCbrRateWorker.jobs.size
  end
end
