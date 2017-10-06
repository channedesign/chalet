class DropPriceListings < ActiveRecord::Migration
  def change
    drop_table :price_listings
  end
end
