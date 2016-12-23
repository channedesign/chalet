class ChangeWeeksDataType < ActiveRecord::Migration
  def change
    remove_column :weeks, :from
    remove_column :weeks, :to

  end
end
