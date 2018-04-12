require 'test_helper'

class ExchangeRateTest < ActiveSupport::TestCase
  test 'valid rate' do
    rate = ExchangeRate.new(rate: 99.999, date: Time.now + 1)
    assert rate.valid?
  end

  test 'invalid without rate' do
    rate = ExchangeRate.new(date: Time.now + 1)
    refute rate.valid?
    assert_not_nil rate.errors[:rate]
  end

  test 'invalid when date in the past' do
    rate = ExchangeRate.new(date: Time.now - 1)
    refute rate.valid?
    assert_not_nil rate.errors[:date]
  end
end
