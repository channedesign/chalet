class AddWeek5ToPriceListings < ActiveRecord::Migration
  def change
  	add_column :price_listings, :week5, :string
  	add_column :price_listings, :price1week5, :string
  	add_column :price_listings, :price2week5, :string
  end
end
