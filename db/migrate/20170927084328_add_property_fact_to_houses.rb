class AddPropertyFactToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :property_fact, :text
  end
end
