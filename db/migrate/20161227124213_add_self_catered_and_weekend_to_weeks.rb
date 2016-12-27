class AddSelfCateredAndWeekendToWeeks < ActiveRecord::Migration
  def change
    add_column :weeks, :self_catered, :string
    add_column :weeks, :weekend, :string
  end
end
