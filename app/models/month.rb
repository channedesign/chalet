class Month < ActiveRecord::Base
  belongs_to :appartment

  validates :name, presence: true
end
