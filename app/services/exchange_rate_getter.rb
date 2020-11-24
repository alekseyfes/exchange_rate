class ExchangeRateGetter
  def call
    Rate.last # текущим курсом является последняя запись
  end
end
