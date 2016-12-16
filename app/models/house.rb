class House < ActiveRecord::Base
  has_many :appartments, dependent: :destroy
  validates :name, presence: true

  has_attached_file :image, styles: {
     thumb: '100x100>',
     square: '200x200#',
     medium: '300x300>'
   }
   validates_attachment :image, presence: true, content_type: { :content_type => /\Aimage\/.*\Z/ }, size: { in: 0..5.megabytes }
end
