class Picture < ActiveRecord::Base
  belongs_to :category

  validates :title, :desc, :category_id, presence: true
end
