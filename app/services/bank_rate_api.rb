class BankRateApi
  REQUEST_URL = 'http://www.cbr.ru/scripts/XML_daily.asp'.freeze

  # @return [Float]
  def rate
    parse(data)
  end

  private
    def data
      uri = URI(REQUEST_URL)
      Net::HTTP.get(uri)
    end

    # @return [Float]
    def parse(data)
      Hash.from_xml(data)['ValCurs']['Valute'].find { |v| v['ID'] == 'R01235' }['Value'].sub(',','.').to_f
    end
end
