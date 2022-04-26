class EstimatesController < ApplicationController
  before_action :require_partner_logged_in
  before_action :require_admin_logged_in

  def index
    @pagy, @estimates = pagy(Estimate.order(id: :desc), items: 10)
  end

  def show
    @estimate = Estimate.find(params[:id])
  end

  def new
    @estimate = Estimate.new
  end

  def create
    @estimate = Estimate.new(estimate_params)
    @estimate.status = "未面談"

    if @estimate.save
      flash[:success] = '見積依頼者を登録しました。'
      redirect_to @estimate
    else
      flash.now[:danger] = '見積依頼者の登録に失敗しました。'
      render :new
    end
  end
  
  def edit
    @estimate = Estimate.find(params[:id])
  end
  
  def update
    @estimate = Estimate.find(params[:id])
    
    if @estimate.status == "未面談"
      @estimate.status = "面談済み"
    end

    if @estimate.update(estimate_params)
      flash[:success] = "見積依頼者 は正常に更新されました"
      redirect_to @estimate
    else
      flash.now[:danger] = "見積依頼者 は更新されませんでした"
      render :edit
    end
  end
  
  def matchings
    @partners = Partner.all
    @estimate = Estimate.find(params[:id])
  end
  
  private

  def estimate_params
    params.require(:estimate).permit(:name, :address, :tel, :content, :status)
  end
end