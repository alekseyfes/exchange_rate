class ManualSetter
  attr_reader :rate

  def call(rate)
    @rate = rate
    set_rate
    broadcast
  end

  private
    def set_rate
      setter = ExchangeRateSetter.new
      setter.call(@rate)
    end

    def broadcast
      ExchangeRateChannel.broadcast_to('exchange_rate', rate: @rate)
    end
end
