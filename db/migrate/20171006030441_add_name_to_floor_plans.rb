class AddNameToFloorPlans < ActiveRecord::Migration
  def change
    add_column :floor_plans, :name, :string
  end
end
