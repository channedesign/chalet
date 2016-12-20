class Pricing < ActiveRecord::Base
  belongs_to :week

  validates :self_catered, presence: true
  validates :weekend, presence: true
end
