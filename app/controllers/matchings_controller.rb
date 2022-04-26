class MatchingsController < ApplicationController
  def create
    estimate = Estimate.find(params[:estimate_id])
    partner = Partner.find(params[:partner_id])
    matching = estimate.matchings.build(partner_id: partner.id)
    estimate.status = "アポイント済み"
    matching.save
    estimate.save
    flash[:success] = 'マッチングしました。'
    redirect_to partner
  end
end