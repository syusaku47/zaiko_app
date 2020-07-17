class StocksController < ApplicationController
  before_action :ensure_correct_user,{only: [:destroy, :update, :decrease, :increase, :edit]}

  def index
    @stocks = Stock.all.order(created_at: :desc)
  end

  def new
    @stock = Stock.new
    @food = Food.new
  end

  def create
    4.times do |i|
      @stock = Stock.new(
        content: params[:item][i],
        stock_number: params[:number][i],
        user_id: @current_user.id
        )
      if params[:exp]
      @food = Food.new(
        price: params[:price][i],
        exp: params[:exp][i]
      )
      else
        @food = Food.new(price: params[:price][i])
      end
      @stock.save
      @food.stock_id = @stock.id
      @food.save
    end
    
    flash[:notice]="新規項目作成しました"
    redirect_to("/stocks/index")
  end

  def edit
    @stock = Stock.find_by(id: params[:id])
    @food = @stock.food
  end

  def add_all
    @stocks = Stock.where(user_id: @current_user.id)
  end

  def edit_all
    @stocks = Stock.where(user_id: @current_user.id)
  end

  def update
    @stock = Stock.find_by(id: params[:id])
    @stock.content = params[:name]
    @stock.stock_number = params[:number]

    @food = @stock.food
    @food.price = params[:price]
    @food.exp = params[:exp]
    if  @stock.save && @food.save
      flash[:notice]= "編集しました"
      redirect_to("/stocks/index")
    else
      render("stocks/edit")
    end

  end

  def update_all
    @stocks = Stock.where(user_id: @current_user.id)
    error = nil
    flag = nil  
    i=0
      if params[:f] == "add"
        #flagがある場合 add
        flag = params[:f]
        @stocks.each do |stock|
            stock.stock_number += params[:number][i].to_i
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
      
      #エラー判定
      if  error && flag 
        render("/stocks/add_all")

      elsif error && !(flag) 
        flash[:notice]="??"
        render("/stocks/edit_all")

      else
        flash[:notice]="変更しました"
        redirect_to("/stocks/index")
      end
    end
    
    def unit_price
      #初期値
      @stock = Stock.new
      @food = Food.new
      #単価計算
      @price = params[:price].to_i
      @number = params[:number].to_i
      @unit_price = @price/@number
      render("stocks/new")
    end
    #在庫数1個増加
    def increase
      @stock = Stock.find_by(id: params[:id])
      @stock.stock_number+= 1
      @stock.save
      redirect_to("/stocks/index")
    end

    #在庫数1個減少
    def decrease
      @stock = Stock.find_by(id: params[:id])
      @stock.stock_number-= 1
      @stock.save
      redirect_to("/stocks/index")
    end

    #登録在庫削除
  def destroy
    @stock = Stock.find_by(id: params[:id])
    flash[:notice]="#{@stock.content}削除しました"
    @stock.destroy
    redirect_to("/stocks/index")
  end

  #ユーザーの確認
  def ensure_correct_user 
    if params[:id] != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/stocks/index")
    end
  end
#static_pages
end
