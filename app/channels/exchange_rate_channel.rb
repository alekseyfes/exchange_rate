class ExchangeRateChannel < ApplicationCable::Channel
  def subscribed
    stream_for 'exchange_rate'
  end

  def current_rate
    rate_getter = ExchangeRateGetter.new
    transmit rate: rate_getter.call&.value
  end
end
