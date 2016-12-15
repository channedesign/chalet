class House < ActiveRecord::Base
  has_many :appartments, dependent: :destroy
  validates :name, presence: true
end
