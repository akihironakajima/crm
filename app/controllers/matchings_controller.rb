class MatchingsController < ApplicationController
  def create
    estimate = Estimate.find(params[:estimate_id])
    partner = Partner.find(params[:partner_id])
    matching = estimate.matchings.build(partner_id: partner.id)
    matching.save
    flash[:success] = 'マッチングしました。'
    redirect_to partner
  end
end