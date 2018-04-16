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
      job = Sidekiq::Cron::Job.find('get_cbr_rate_job')
      job.disable!
      puts 'job disabled'
      ExchangeRate.create(rate: @exchange_rate.rate, date: @exchange_rate.date)
      ActionCable.server.broadcast('rate', rate: @exchange_rate.rate)
      StartScrapingWorker.perform_at(@exchange_rate.date)
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
