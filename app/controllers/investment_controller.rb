class InvestController < ApplicationController
  def index
    unless session[:id]
      redirect_to '/login'
    end
  end


  def add
    invest = Invest.find_by(code: params[:code])

    p = Purchase.where(invest: invest, date: DateTime.current.midnight).first
    if !p.nil?
      p.count += params[:count].to_i
      p.save
    else
      Purchase.create(user: @current_user, invest: invest, count: params[:count], coast: params[:coast], date: DateTime.current.midnight)
    end

    render json: ""
  end


  def allInfoAboutUser
    invests = Purchase.select("purchases.id, code, name, sum(count) as count, avg(coast) as coast, date, income")
                      .joins("INNER JOIN invests ON purchases.invest_id = invests.id")
                      .where(user: @current_user)
                      .group(:invest_id).group(:date)

    uri = URI('https://www.cbr-xml-daily.ru/daily_json.js')
    res = Net::HTTP.get_response(uri).body
    valutes = JSON.parse(res)["Valute"]
    sumincome = 0.0
    sumcoast = 0.0

    invests.each do |i|
      v = valutes[i.code]
      i.income = (i.count * (v["Value"].to_f - i.coast)).ceil(2)
      sumincome += i.income
      sumcoast += i.coast * i.count

      i.coast = i.coast.ceil(4)

      i.date = i.date.strftime("%d/%m/%Y")
    end

    data = {invests: invests, sumincome: sumincome.ceil(2), sumcoast: sumcoast.ceil(2)}
    render json: data
  end


  def setInvestCount
    p = Purchase.where(id: params[:id]).take
    p.count = params[:count]
    p.save

    render json: ""
  end

  def delete
    p = Purchase.find(params[:id]).delete.save

    render json: ""
  end

end