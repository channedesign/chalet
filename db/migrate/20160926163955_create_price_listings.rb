class CreatePriceListings < ActiveRecord::Migration
  def change
    create_table :price_listings do |t|
      t.string :month
      t.string :week1
      t.string :week2
      t.string :week3
      t.string :week4
      t.string :price1week1
      t.string :price2week1
      t.string :price1week2
      t.string :price2week2
      t.string :price1week3
      t.string :price2week3
      t.string :price1week4
      t.string :price2week4

      t.timestamps null: false
    end
  end
end
