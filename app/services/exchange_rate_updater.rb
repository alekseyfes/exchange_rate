class ExchangeRateUpdater
  attr_reader :rate

  def call
    @rate = get_bank_rate
    set_rate
    broadcast
  end

  private
    def get_bank_rate
      BankRate.get
    end

    def set_rate
      setter = ExchangeRateSetter.new
      setter.call
    end

    def broadcast
      ExchangeRateChannel.broadcast_to('exchange_rate', rate: @rate)
    end
end
