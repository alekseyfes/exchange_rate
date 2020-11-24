class ManualSetter
  attr_reader :rate

  def call(rate_value, expired_date)
    @rate = set_rate(rate_value, expired_date)
    broadcast
    set_expiration_time
  end

  private
    def set_rate(rate_value, expired_date)
      setter = ExchangeRateSetter.new
      setter.call(value: rate_value, is_manual: true, expired_date: expired_date)
    end

    def broadcast
      ExchangeRateChannel.broadcast_to('exchange_rate', rate: @rate.value)
    end

    def set_expiration_time
      expired_date = @rate.expired_date
      return if expired_date.nil? || expired_date < DateTime.now
      
      ExchangeRateUpdateJob.set(wait_until: expired_date).perform_later
    end
end
