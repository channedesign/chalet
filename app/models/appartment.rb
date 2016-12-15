class Appartment < ActiveRecord::Base
  belongs_to :house
  has_many :months, dependent: :destroy

  validates :name, presence: true
end
