class AdminController < ApplicationController
  def index
    @rates = Rate.order(created_at: :desc)
  end

  def set_rate
    value = rate_params[:value].to_f
    expired_date = parse_expired_date(rate_params)

    setter = ManualSetter.new
    setter.call(value, expired_date)
  end

  private
    def rate_params
      params.require(:rate).permit(:value, :expired_date)
    end

    def parse_expired_date(params)
      arr = 
      [
        params['expired_date(1i)'], # год 
        params['expired_date(2i)'], # месяц
        params['expired_date(3i)'], # число
        params['expired_date(4i)'], # часы
        params['expired_date(5i)']  # минуты
      ].map(&:to_i)
      
      DateTime.new(*arr)
    end
end
