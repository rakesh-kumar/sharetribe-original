class CreateHomepages < ActiveRecord::Migration
  def change
    create_table :homepages do |t|
      t.string :text_variation1
      t.string :text_variation2
      t.string :text_variation3
      
      t.timestamps null: false
    end
  end
end
