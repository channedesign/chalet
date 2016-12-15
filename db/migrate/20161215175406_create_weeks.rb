class CreateWeeks < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
      t.integer :from
      t.integer :to
      t.references :month, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
