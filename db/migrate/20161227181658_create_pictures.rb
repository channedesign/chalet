class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :name
      t.references :house, index: true, foreign_key: true
      t.integer :position

      t.timestamps null: false
    end
  end
end
