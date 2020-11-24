class ExchangeRateGetter
  def call
    (30..90).to_a.sample  # todo from db
  end
end
