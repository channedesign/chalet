class AddSelfCateredAndWeekendToPricings < ActiveRecord::Migration
  def change
    add_column :pricings, :self_catered, :decimal
    add_column :pricings, :weekend, :decimal
  end
end
