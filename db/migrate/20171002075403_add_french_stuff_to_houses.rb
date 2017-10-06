class AddFrenchStuffToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :fr_home_description, :text
    add_column :houses, :fr_description, :text
    add_column :houses, :fr_property_feature, :text
    add_column :houses, :fr_property_fact, :text

  end
end
