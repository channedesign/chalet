class AddSelfCateredAndWeekendToPricings < ActiveRecord::Migration
  def change
    add_column :pricings, :self_catered, :string
    add_column :pricings, :weekend, :string
  end
end
