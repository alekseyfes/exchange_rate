set :output, File.join(File.dirname(__FILE__), '..', 'log', 'cron.log')

every :day do
  runner 'ExchangeRateUpdateJob.perform_later', environment: :development
end

# Learn more: http://github.com/javan/whenever
