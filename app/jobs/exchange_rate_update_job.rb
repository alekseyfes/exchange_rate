class ExchangeRateUpdateJob < ApplicationJob
  queue_as :default

  def perform
    updater.call
  end

  private
    def updater
      ExchangeRateUpdater.new
    end
end
