class AdminController < ApplicationController
  def index
  end

  def set_rate
    setter = ManualSetter.new
    setter.call(rate_params[:value].to_f)
  end

  private
    def rate_params
      params.require(:rate).permit(:value)
    end
end
