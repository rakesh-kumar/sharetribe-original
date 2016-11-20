class AddActionSectionParaToHomepage < ActiveRecord::Migration
  def change
    add_column :homepages, :action_sec_para, :string
  end
end
