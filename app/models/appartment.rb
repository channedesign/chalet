class Appartment < ActiveRecord::Base
  belongs_to :house
  has_many :months

  validates :name, presence: true
end
