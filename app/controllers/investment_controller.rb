class InvestmentController < ApplicationController
  def index
    unless cookies[:name]
      redirect_to '/login'
    end
  end
end