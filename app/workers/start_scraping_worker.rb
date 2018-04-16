class StartScrapingWorker
  include Sidekiq::Worker

  def perform(*args)
    job = Sidekiq::Cron::Job.find('get_cbr_rate_job')
    job.enable!
    puts 'job enabled!'
  end
end
