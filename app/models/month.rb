class Month < ActiveRecord::Base
  belongs_to :appartment
  has_many :weeks, dependent: :destroy

  validates :name, presence: true
end
