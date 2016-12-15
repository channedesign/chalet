class House < ActiveRecord::Base
  validates :name, presence: true
end
