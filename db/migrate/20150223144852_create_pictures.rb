class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :title
      t.text :desc

      t.timestamps null: false
    end
  end
end
