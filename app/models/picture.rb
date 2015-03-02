class Picture < ActiveRecord::Base

  mount_uploader :image, ImageUploader

  belongs_to :category

  validates :title, :desc, :category_id, :image, presence: true

  def self.current_category(category_id)
    Category.find(category_id)
  end
end
