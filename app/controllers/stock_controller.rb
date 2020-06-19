class StockController < ApplicationController
  def index
    @stocks = Stock.all
  end

  def new
  end

  def create
    @stock = Stock.new(
      content: params[:item],
      stock_number: params[:number]
      )
      @stock.save
      redirect_to("/stock/index")
  end

  def edit
    @stocks = Stock.all
  end

  def update
    @stocks = Stock.all
    i=0
      @stocks.each do |stock|
        stock.content = params[:name][i]
        stock.stock_number = params[:number][i]
        stock.save
        i+=1
      end
      redirect_to("/stock/index")
  end

  def add
    @stocks = Stock.all
  end

    def update
      flag = params[:f]
      @stocks = Stock.all
      i=0
        @stocks.each do |stock|
          if flag
            stock.stock_number += params[:number][i].to_i
          else 
            stock.content = params[:name][i]
            stock.stock_number = params[:number][i]
          end
          stock.save
          i+=1
        end
        flag=nil
        redirect_to("/stock/index")
    end

  def destroy
    @stock = Stock.find_by(id: params[:id])
    @stock.destroy
    redirect_to("/stock/index")
  end


end
