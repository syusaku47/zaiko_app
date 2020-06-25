class StockController < ApplicationController
  before_action :set_current_user
  before_action :current_user_stock
  def index
  end

  def new
    @stock = Stock.new
  end

  def create
    @stock = Stock.new(
      content: params[:item],
      stock_number: params[:number],
      user_id: @current_user.id
      )

      if @stock.save
        flash[:notice]="新規項目作成しました"
        redirect_to("/stock/index")
      else
        render("/stock/new")
      end
  end

  def edit
    
  end

  def add
    
  end

    def update
      flag=nil
      error=nil
      
      flag = params[:f]
      
      i=0
      if flag
        #flagがある場合 add
        @stocks.each do |stock|
          if stock.user_id==@current_user.id
            stock.stock_number += params[:number][i].to_i
          end
          if stock.save
            i+=1
          else
            error=stock
          end
        end
        
      else
        #flagがない場合 edit
        @stocks.each do |stock|
          if stock.user_id==@current_user.id
            stock.content = params[:name][i]
            stock.stock_number = params[:number][i].to_i
          end
          if stock.save
            i+=1
          else
            error=stock
            i+=1
          end
        end
      end
      
      
      if  error && flag 
        render("/stock/add")

      elsif error && !(flag) 
        flash[:notice]="??"
        render("/stock/edit")

      else
        flash[:notice]="変更しました"
        redirect_to("/stock/index")
      end
    end

  def destroy
    @stock = Stock.find_by(id: params[:id])
    flash[:notice]="#{@stock.content}削除しました"
    @stock.destroy
    redirect_to("/stock/index")
  end

end
