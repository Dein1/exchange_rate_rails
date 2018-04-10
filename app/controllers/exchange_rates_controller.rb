class ExchangeRatesController < ApplicationController
  def index
    @exchange_rate = ExchangeRate.last
  end

  def edit
    @exchange_rate = ExchangeRate.last
  end

  def update
    @exchange_rate = ExchangeRate.last
    if @exchange_rate.update(exchange_rate_params)
      redirect_to action: 'index'
    else
      render 'edit'
    end
  end

  private

  def exchange_rate_params
    params.require(:exchange_rate).permit(:rate, :date)
  end
end
