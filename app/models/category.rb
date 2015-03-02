class Category < ActiveRecord::Base
  has_many :pictures

  validates :name, :desc, presence: true

end
