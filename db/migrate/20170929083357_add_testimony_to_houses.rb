class AddTestimonyToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :testimony, :text
  end
end
