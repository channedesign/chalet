class AddColumnToWeeks < ActiveRecord::Migration
  def change
    add_column :weeks, :from, :date
    add_column :weeks, :to, :date
  end
end
