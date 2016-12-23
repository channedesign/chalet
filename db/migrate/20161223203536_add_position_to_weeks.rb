class AddPositionToWeeks < ActiveRecord::Migration
  def change
    add_column :weeks, :position, :integer
  end
end
