class Week < ActiveRecord::Base
  belongs_to :month
  has_many :pricings, dependent: :destroy

  validates :to, presence: true, numericality: true
  validates :from, presence: true, numericality: true
end
