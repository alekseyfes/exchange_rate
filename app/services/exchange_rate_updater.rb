class ExchangeRateUpdater
  attr_reader :rate

  def call
    @rate = get_bank_rate
    set_rate
    broadcast
  end

  private
    def get_bank_rate
      api = BankRateApi.new
      api.rate
    end

    def set_rate
      setter = ExchangeRateSetter.new
      setter.call(@rate)
    end

    def broadcast
      ExchangeRateChannel.broadcast_to('exchange_rate', rate: @rate)
    end
end
