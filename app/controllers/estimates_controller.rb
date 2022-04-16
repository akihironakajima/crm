class EstimatesController < ApplicationController
  def index
    @pagy, @estimates = pagy(Estimate.order(id: :desc), items: 20)
  end

  def show
    @estimate = Estimate.find(params[:id])
  end

  def new
    @estimate = Estimate.new
  end

  def create
    @estimate = Estimate.new(estimate_params)

    if @estimate.save
      flash[:success] = '見積依頼者を登録しました。'
      redirect_to @estimate
    else
      flash.now[:danger] = '見積依頼者の登録に失敗しました。'
      render :new
    end
  end
  
  private

  def estimate_params
    params.require(:estimate).permit(:name, :address, :tel)
  end
end