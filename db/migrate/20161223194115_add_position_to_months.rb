class AddPositionToMonths < ActiveRecord::Migration
  def change
    add_column :months, :position, :integer
  end
end
