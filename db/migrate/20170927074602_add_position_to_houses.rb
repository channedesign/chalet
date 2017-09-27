class AddPositionToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :position, :integer
  end
end
