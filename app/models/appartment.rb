class Appartment < ActiveRecord::Base
  belongs_to :house
  has_many :months, dependent: :destroy

  validates :name, presence: true, length: { minimum: 1, maximum: 50 }, uniqueness: true

  
end
