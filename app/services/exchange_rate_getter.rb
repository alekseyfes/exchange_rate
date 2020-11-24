class ExchangeRateGetter
  def call
    Rate.last.value # текущим курсом является последняя запись
  end
end
