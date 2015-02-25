class Picture < ActiveRecord::Base
  
  mount_uploader :image, ImageUploader

  belongs_to :category

  validates :title, :desc, :category_id, :image, presence: true
end
