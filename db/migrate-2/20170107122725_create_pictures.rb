class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :pictureable_id
      t.string :pictureable_type
      t.string :image

      t.timestamps null: false
    end
  end
end
