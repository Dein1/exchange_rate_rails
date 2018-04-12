require 'test_helper'

class ExchangeControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exchange_rate = exchange_rates(:one)
  end

  test 'should get index' do
    get root_url
    assert_response :success
  end

  test 'should get edit' do
    get admin_url
    assert_response :success
  end

  test 'should update rate' do
    patch exchange_rate_url(@exchange_rate), params: {
      exchange_rate: {
        rate: @exchange_rate.rate,
        date: @exchange_rate.date
      }
    }
    assert_response :success
  end
end
