Sidekiq.configure_server do |config|
  schedule_file = 'config/sidekiq_schedule.yml'

  if File.exist?(schedule_file) && Sidekiq.server?
    Sidekiq::Cron::Job.load_from_hash! YAML.load_file(schedule_file)
    puts 'schedule loaded'
    StartScrapingWorker.perform_async
  end
end
