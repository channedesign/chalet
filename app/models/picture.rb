class Picture < ActiveRecord::Base
  belongs_to :house

  has_attached_file :chalet_picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment :chalet_picture, content_type: { content_type: /\Aimage\/.*\z/ }, presence: true, size: { in: 0..3.megabyte }
  validates :house_id, presence: true
end
