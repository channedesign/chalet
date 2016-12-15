class CreateMonths < ActiveRecord::Migration
  def change
    create_table :months do |t|
      t.string :name
      t.references :appartment, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
