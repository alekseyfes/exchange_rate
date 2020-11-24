class ExchangeRateSetter
  def call(rate)
    Rate.create(from: 'usd', to: 'rub', value: rate)
  end
end
