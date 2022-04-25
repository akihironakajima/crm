class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to current_partner
    end
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    if login(email, password)
      flash[:success] = 'ログインに成功しました。'
      redirect_to @partner
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render :new
    end
  end

  def destroy
    session[:partner_id] = nil
    flash[:success] = 'ログアウトしました。'
    redirect_to login_path
  end
  
  private

  def login(email, password)
    @partner = Partner.find_by(email: email)
    if @partner && @partner.authenticate(password)
      # ログイン成功
      session[:partner_id] = @partner.id
      return true
    else
      # ログイン失敗
      return false
    end
  end
  
end
