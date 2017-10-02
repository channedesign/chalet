class AddHomeDescriptionToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :home_description, :text
  end
end
