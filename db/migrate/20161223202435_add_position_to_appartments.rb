class AddPositionToAppartments < ActiveRecord::Migration
  def change
    add_column :appartments, :position, :integer
  end
end
