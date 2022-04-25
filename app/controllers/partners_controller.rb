class PartnersController < ApplicationController
  before_action :require_partner_logged_in, only: [:index, :show]
  
  def show
    if current_partner == Partner.find(params[:id]) or current_partner.admin == true
      @partner = Partner.find(params[:id])
      @estimates_list = @partner.matched_estimate.all
      @pagy, @estimates = pagy(@estimates_list.order(id: :desc), items: 10)
    else
      redirect_to current_partner
    end
  end

  def new
    @partner = Partner.new
  end

  def create
    @partner = Partner.new(partner_params)

    if @partner.save
      flash[:success] = 'パートナー企業を登録しました。'
      redirect_to @partner
    else
      flash.now[:danger] = 'パートナー企業の登録に失敗しました。'
      render :new
    end
  end

  private

  def partner_params
    params.require(:partner).permit(:name, :email, :password, :password_confirmation)
  end
end
