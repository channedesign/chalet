class Week < ActiveRecord::Base
  belongs_to :month

  validates :to, presence: true
  validates :from, presence: true
  validates :self_catered, presence: true
  validates :weekend, presence: true
end
