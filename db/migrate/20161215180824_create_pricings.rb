class CreatePricings < ActiveRecord::Migration
  def change
    create_table :pricings do |t|
      t.decimal :price
      t.references :week, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
