class Month < ActiveRecord::Base
  belongs_to :appartment
  has_many :weeks, dependent: :destroy

  validates :name, presence: true, length: { minimum: 1, maximum: 50 }
end
