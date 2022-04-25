class Estimate < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  validates :address, presence: true, length: { maximum: 255 }
  validates :tel, presence: true, length: { maximum: 255 }
  has_many :matchings
  has_many :matched_partner, through: :matchings, source: :partner
  
  def matching(partner_id)
    self.matchings.find_or_create_by(partner_id: partner.id)
  end
  
  def matched?(partner)
    self.matched_partner.include?(partner)
  end
  
end