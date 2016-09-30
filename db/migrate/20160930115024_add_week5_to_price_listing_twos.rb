class AddWeek5ToPriceListingTwos < ActiveRecord::Migration
  def change
    add_column :price_listing_twos, :week5, :string
    add_column :price_listing_twos, :price1week5, :string
    add_column :price_listing_twos, :price2week5, :string
  end
end
