class AddVideoUrlToHomepage < ActiveRecord::Migration
  def change
    add_column :homepages, :video_url, :string
  end
end
