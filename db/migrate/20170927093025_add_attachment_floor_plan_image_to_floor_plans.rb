class AddAttachmentFloorPlanImageToFloorPlans < ActiveRecord::Migration
  def self.up
    change_table :floor_plans do |t|
      t.attachment :floor_plan_image
    end
  end

  def self.down
    remove_attachment :floor_plans, :floor_plan_image
  end
end
