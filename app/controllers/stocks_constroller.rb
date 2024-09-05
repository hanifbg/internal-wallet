class StocksController < ApplicationController
  def show
    stock = Stock.find(params[:id])
    render json: stock, include: :wallet
  end

  def index
    stocks = Stock.all
    render json: stocks, include: :wallet
  end
end
