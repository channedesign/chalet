class RemovePriceFromPricings < ActiveRecord::Migration
  def change
    remove_column :pricings, :price
  end
end
