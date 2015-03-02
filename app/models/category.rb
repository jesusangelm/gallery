class Category < ActiveRecord::Base
  has_many :pictures, dependent: :destroy

  validates :name, :desc, presence: true

end
