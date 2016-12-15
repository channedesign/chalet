class Pricing < ActiveRecord::Base
  belongs_to :week

  validates :price, presence: true
end
