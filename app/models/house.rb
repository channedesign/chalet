class House < ActiveRecord::Base
  has_many :appartments, dependent: :destroy
  has_many :pictures, dependent: :destroy
  validates :name, presence: true, length: { minimum: 1, maximum: 50 }, uniqueness: true

  has_attached_file :image, styles: {
     thumb: '100x100>',
     square: '200x200#',
     medium: '300x300>'
   }
   validates_attachment :image, presence: true, content_type: { :content_type => /\Aimage\/.*\Z/ }, size: { in: 0..5.megabytes }
end
