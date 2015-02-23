class AddCategoryIdToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :category_id, :integer
    add_index :pictures, :category_id
  end
end
