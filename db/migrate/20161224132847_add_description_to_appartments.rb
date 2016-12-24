class AddDescriptionToAppartments < ActiveRecord::Migration
  def change
    add_column :appartments, :description, :text
  end
end
