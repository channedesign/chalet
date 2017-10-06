class AddSleepCapacityToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :sleep_capacity, :integer
  end
end
