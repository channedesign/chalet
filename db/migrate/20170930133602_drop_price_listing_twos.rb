class DropPriceListingTwos < ActiveRecord::Migration
  def change
    drop_table :price_listing_twos
  end
end
