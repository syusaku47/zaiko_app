class UsersController < ApplicationController
  before_action :set_current_user
  before_action :authenticate_user,{only:[:edit, :update]}
  
  def index
    @user = User.find_by(id: session[:user_id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password]
    )
    
    if @user.save
      session[:user_id] = @user.id
      redirect_to("/stock/index")
    else
      render("/users/new")
    end
  end

  def destroy

  end

  def login_form
  end

  def login
    @user = User.find_by(
      email: params[:email],
      password: params[:password]
    )
    
      
      if @user
        session[:user_id]=@user.id
        flash[:notice]="ログインしました"
        redirect_to("/stock/index")
      else
      @email = params[:email]
      @password = params[:password]
      @error_message = "メールアドレスまたはパスワードが間違っています"
        render("/users/login_form")
      end
    end

    def logout
      session[:user_id] = nil
      redirect_to("/login")
    end
end
