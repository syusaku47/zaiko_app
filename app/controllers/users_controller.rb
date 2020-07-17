class UsersController < ApplicationController
  before_action :authenticate_user,{only:[:edit, :update]}
  before_action :forbid_login_user,{only:[:login, :login_form]}
  before_action :ensure_correct_user{only: [:info, :update, :edit, :destroy]}
  
  def info
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
      flash[:notice] = "ユーザー情報を作成いたしました"
      redirect_to("/stocks/index")
    else
      render("/users/new")
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]

    if @user.save
      flash[:notice] = "変更しました"
      redirect_to("/users/#{@user.id}/info")
    else
      render("users/edit")
    end

  end

  def destroy
    @user = User.find_by(id: params[:id])
    flash[:notice] = "アカウントを削除しました"
    session[:user_id] = nil
    @user.destroy
    redirect_to("/login")
  end

  def login_form
  end

  def login
    @user = User.find_by(
      email: params[:email]
    )
    
      if @user && @user.authenticate(params[:password])
        session[:user_id]=@user.id
        flash[:notice]="ログインしました"
        redirect_to("/stocks/index")
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

    def ensure_correct_user 
      if params[:id] != @current_user.id
        flash[:notice] = "権限がありません"
        redirect_to("/stocks/index")
      end
    end
end
