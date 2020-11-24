class ExchangeRateUpdater
  attr_reader :rate

  def call
    return if rate_change_blocked?
    @rate = set_rate(get_bank_rate)
    broadcast
  end

  private
    def rate_change_blocked?
      getter = ExchangeRateGetter.new
      current_rate = getter.call
      return false if !current_rate.is_manual? || current_rate.expired_date.nil?

      DateTime.now < current_rate.expired_date
    end
  
    def get_bank_rate
      api = BankRateApi.new
      api.rate
    end

    def set_rate(value)
      setter = ExchangeRateSetter.new
      setter.call(value: value)
    end

    def broadcast
      ExchangeRateChannel.broadcast_to('exchange_rate', rate: @rate.value)
    end
end
