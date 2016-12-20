class AddVisibleToAppartments < ActiveRecord::Migration
  def change
    add_column :appartments, :visible, :boolean, default: false
  end
end
