class AddPropertyFeatureToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :property_feature, :text
  end
end
