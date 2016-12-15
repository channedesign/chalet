class CreateAppartments < ActiveRecord::Migration
  def change
    create_table :appartments do |t|
      t.string :name
      t.references :house, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
