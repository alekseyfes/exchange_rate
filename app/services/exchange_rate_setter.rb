class ExchangeRateSetter
  def call(value:, is_manual: false, expired_date: nil)
    Rate.create(from: 'usd', to: 'rub', value: value, is_manual: is_manual, expired_date: expired_date)
  end
end
